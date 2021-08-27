===========================================================
OpenLDAP noopsrch overlay and control [LDAP Tool Box (LTB)]
===========================================================

.. container::
   :name: dokuwiki__site

   .. container:: site dokuwiki mode_show tpl_bootstrap3
      :name: dokuwiki__top

      .. container::
         :name: dokuwiki__header

         .. container:: container-fluid

            .. container:: navbar-header

               |LDAP Tool Box (LTB)|

            .. container:: collapse navbar-collapse

               -  `Home`_
               -  `Documentation`_
               -  `Download`_
               -  `Community`_

               .. container:: navbar-right

                  .. container:: no

                     .. container:: ajax_qsearch JSpopup
                        :name: qsearch__out

                  -  `Login`_

      .. container::
         :name: dw__breadcrumbs

         --------------

         .. container:: breadcrumb

            You are here:\ `Welcome on LDAP Tool Box project`_ »
            `Documentation <../documentation>`__ » `OpenLDAP noopsrch
            overlay and control`_

         --------------

      documentation:openldap-noopsrch

      .. container::
         :name: dw__msgarea

      .. container:: main row

         .. container:: panel panel-default

            .. container:: page group panel-body

               .. container:: pull-right hidden-print

                  .. container::
                     :name: dw__toc

                     .. rubric:: Table of Contents
                        :name: table-of-contents
                        :class: toggle

                     .. container::

                        -  

                           .. container:: li

                              `Installation`_

                        -  

                           .. container:: li

                              `Configuration`_

                        -  

                           .. container:: li

                              `Usage`_

               .. rubric:: OpenLDAP noopsrch overlay and control
                  :name: openldap_noopsrch_overlay_and_control
                  :class: sectionedit1

               .. container:: level1

               .. rubric:: Installation
                  :name: installation
                  :class: sectionedit2

               .. container:: level2

                  .. code:: code

                     apt-get install openldap-ltb-contrib-overlays

                  (or whatever package manager / OS you use)

               .. rubric:: Configuration
                  :name: configuration
                  :class: sectionedit3

               .. container:: level2

                  Add these directives to
                  /usr/local/openldap/etc/openldap/slapd.conf:

                  .. code:: code

                     include         /usr/local/openldap/etc/openldap/schema/core.schema
                     include         /usr/local/openldap/etc/openldap/schema/cosine.schema
                     include         /usr/local/openldap/etc/openldap/schema/inetorgperson.schema

                     modulepath      /usr/local/openldap/libexec/openldap
                     moduleload noopsrch.so

                  Restart OpenLDAP:

                  .. code:: code

                     /etc/init.d/slapd restart

                  Then populate some entries:

                  vim base.ldif

                  .. code:: code

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

                  .. code:: code

                     ldapadd -H 'ldap://localhost:389' -D 'cn=Manager,dc=my-domain,dc=com' -w secret -f base.ldif

               .. rubric:: Usage
                  :name: usage
                  :class: sectionedit4

               .. container:: level2

                  Search for all entries:

                  .. code:: code

                     ldapsearch -x -H 'ldap://localhost:389' -D 'cn=Manager,dc=my-domain,dc=com' -w secret -b 'dc=my-domain,dc=com' '(objectClass=*)' -e '!1.3.6.1.4.1.4203.666.5.18'

                     search: 2
                     result: 0 Success
                     control: 1.3.6.1.4.1.4203.666.5.18 false MAkCAQACAQUCAQA=

                  Search for branch entries :

                  .. code:: code

                     ldapsearch -x -H 'ldap://localhost:389' -D 'cn=Manager,dc=my-domain,dc=com' -w secret -b 'dc=my-domain,dc=com' '(objectClass=organizationalUnit)' -e '!1.3.6.1.4.1.4203.666.5.18'

                     search: 2
                     result: 0 Success
                     control: 1.3.6.1.4.1.4203.666.5.18 false MAkCAQACAQICAQA=

                  Some explanations:

                  -  

                     .. container:: li

                        no operation is done,

                  -  

                     .. container:: li

                        instead, the number of operations is displayed,
                        on the “control” line

                  -  

                     .. container:: li

                        how to verify the number of operations ? See
                        below

                  .. code:: code

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

                  .. code:: code

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

      ``_

      .. container:: text-center

         .. container:: license

            Except where otherwise noted, content on this wiki is
            licensed under the following license: `CC
            Attribution-Noncommercial-Share Alike 3.0 Unported`_

   .. container:: no

      |image1|

   .. container:: no
      :name: screen__mode

.. _Home: ../start
.. _Documentation: ../documentation
.. _Download: ../download
.. _Community: ../community
.. _Login: openldap-noopsrch?do=login&sectok=39fb3f9b54a1ecdb3c46340f395d6940
.. _Welcome on LDAP Tool Box project: ../start
.. _OpenLDAP noopsrch overlay and control: openldap-noopsrch
.. _Installation: openldap-noopsrch#installation
.. _Configuration: openldap-noopsrch#configuration
.. _Usage: openldap-noopsrch#usage
.. _: javascript:void(0)
.. _CC Attribution-Noncommercial-Share Alike 3.0 Unported: http://creativecommons.org/licenses/by-nc-sa/3.0/

.. |LDAP Tool Box (LTB)| image:: ../_media/wiki/logo.png
   :class: pull-left
   :name: dw__logo
   :width: 32px
   :height: 32px
   :target: ../start
.. |image1| image:: ../lib/exe/indexer.php?id=documentation:openldap-noopsrch&1630081866
   :width: 2px
   :height: 1px
