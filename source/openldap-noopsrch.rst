*************************************
OpenLDAP noopsrch overlay and control
*************************************


Installation
============

.. Note:
   This configuration is an example using OpenLDAP LTB packages.
   You should adapt the path and compile the noopsrch overlay if you plan to use another build.

.. code-block:: console

   apt-get install openldap-ltb-contrib-overlays

(or whatever package manager / OS you use)

Configuration
=============

Add these directives to ``/usr/local/openldap/etc/openldap/slapd.conf`` [#f1]_:

::

    include         /usr/local/openldap/etc/openldap/schema/core.schema
    include         /usr/local/openldap/etc/openldap/schema/cosine.schema
    include         /usr/local/openldap/etc/openldap/schema/inetorgperson.schema

    modulepath      /usr/local/openldap/libexec/openldap
    moduleload noopsrch.so

Restart OpenLDAP:

.. code-block:: console

   systemctl restart slapd

Then populate some entries:

.. code-block:: console

   vim base.ldif

::

    dn: dc=my-domain,dc=com
    objectClass: top
    objectClass: dcObject
    objectClass: organization
    o: my-domain
    dc: my-domain
 
    dn: ou=users,dc=my-domain,dc=com
    objectClass: top
    objectClass: organizationalUnit
    ou: users

    dn: ou=groups,dc=my-domain,dc=com
    objectClass: top
    objectClass: organizationalUnit
    ou: groups

    dn: uid=test1,ou=users,dc=my-domain,dc=com
    objectClass: top
    objectClass: person
    objectClass: organizationalPerson
    objectClass: inetOrgPerson
    cn: test1
    sn: test1
    uid: test1
    userPassword: secret

    dn: uid=test2,ou=users,dc=my-domain,dc=com
    objectClass: top
    objectClass: person
    objectClass: organizationalPerson
    objectClass: inetOrgPerson
    cn: test2
    sn: test2
    uid: test2
    userPassword: secret

Finally, add these entries into OpenLDAP:

.. code-block:: console

   ldapadd -H 'ldap://localhost:389' -D 'cn=Manager,dc=my-domain,dc=com' -w secret -f base.ldif

Usage
=====

Search for all entries:

.. code-block:: console

   ldapsearch -x -H 'ldap://localhost:389' -D 'cn=Manager,dc=my-domain,dc=com' -w secret -b 'dc=my-domain,dc=com' '(objectClass=*)' -e '!1.3.6.1.4.1.4203.666.5.18'

   search: 2
   result: 0 Success
   control: 1.3.6.1.4.1.4203.666.5.18 false MAkCAQACAQUCAQA=

Search for branch entries :

.. code-block:: console

   ldapsearch -x -H 'ldap://localhost:389' -D 'cn=Manager,dc=my-domain,dc=com' -w secret -b 'dc=my-domain,dc=com' '(objectClass=organizationalUnit)' -e '!1.3.6.1.4.1.4203.666.5.18'

   search: 2
   result: 0 Success
   control: 1.3.6.1.4.1.4203.666.5.18 false MAkCAQACAQICAQA=

Some explanations:

    * no operation is done,
    * instead, the number of operations is displayed, on the “control” line
    * how to verify the number of operations ? See below

.. code-block:: console

   echo -n 'MAkCAQACAQUCAQA=' | base64 -d | od -x --endian=big
   0000000 3009 0201 0002 0105 0201 0000

   0x30 ber sequence
   0x09 length (9 bytes)

   0x02 ber int
   0x01 length (1 byte)
   0x00 "0" (value of would be search result code)

   0x02 ber int
   0x01 length (1 byte)
   0x05 "5" (number of would be returned entries) --> Ok, there are 5 entries returned

   0x02 ber int
   0x01 length (1 byte)
   0x00 "0" (number of would be returned search refs)

.. code-block:: console

   echo -n 'MAkCAQACAQICAQA=' | base64 -d | od -x --endian=big
   0000000 3009 0201 0002 0102 0201 0000

   0x30 ber sequence
   0x09 length (9 bytes)

   0x02 ber int
   0x01 length (1 byte)
   0x00 "0" (value of would be search result code)

   0x02 ber int
   0x01 length (1 byte)
   0x02 "2" (number of would be returned entries) --> Ok, there are 2 organizational entries returned

   0x02 ber int
   0x01 length (1 byte)
   0x00 "0" (number of would be returned search refs)


.. rubric:: Footnotes

.. [#f1] example is given for a `slapd.conf <https://www.openldap.org/software/man.cgi?query=slapd.conf>`_ configuration. See `slapd-config manual <https://www.openldap.org/software/man.cgi?query=slapd-config>`_ for more information about corresponding cn=config configuration
