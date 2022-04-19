***************************************************
Pass-Through authentication with remoteauth overlay
***************************************************

Presentation
============

.. include:: delegation.rst

Configuration
=============

Ensure you have ``remoteauth`` library available in your overlay directories.

``remoteauth`` is part of main OpenLDAP overlays, and can be compiled with ``--enable-overlays`` or ``--enable-remoteauth``.

Then configure your OpenLDAP with the appropriate directives (example with ``slapd.conf`` [#f1]_):

::

    ###################
    # In global section
    ###################

    modulepath      /usr/local/openldap/libexec/openldap
    moduleload      remoteauth.la

    [...]


    #####################
    # in database section
    #####################

    overlay remoteauth

    # DN used to authenticate on the remote directory
    remoteauth_dn_attribute seeAlso

    # attribute used to resolve the domain
    remoteauth_domain_attribute associatedDomain

    # default domain if none is present in user entry
    remoteauth_default_domain europe

    # domain mapping => [ list of hostnames or URIs]
    # file europe.list contains a hostname or LDAP URI, one per line
    # OpenLDAP tries to connect to first server, then if it fails or timeouts, to second server,...
    remoteauth_mapping europe file:///usr/local/openldap/etc/openldap/europe.list
    # domain usa will use only one hostname
    remoteauth_mapping usa ldap.usa.com

    # fallback server to connect if no domain found in domain mapping
    remoteauth_default_realm ldap.paris.com

    # number of retries attempted
    remoteauth_retry_count 1

    # store the password in case of successfull bind?
    remoteauth_store off


For example, with these LDAP data

.. code-block::

    dn: uid=test,ou=people,dc=my-domain,dc=com
    objectClass: inetOrgPerson
    objectClass: organizationalPerson
    objectClass: person
    objectClass: top
    objectClass: domainRelatedObject
    cn: test
    givenName: test
    mail: test@my-example.com
    sn: test
    uid: test
    seeAlso: uid=myuser,ou=users,dc=example,dc=com
    associatedDomain: europe

an authentication with::

    ldapwhoami -x -H 'ldap://localhost:389' -D 'uid=test,ou=people,dc=my-domain,dc=com' -w secret

will result in a successful authentication of user ``uid=myuser,ou=users,dc=example,dc=com`` on first remote directory found in ``europe.list`` file (or second remote directory if the first one doesn't answer in time)




.. rubric:: Footnotes

.. [#f1] example is given for a `slapd.conf <https://www.openldap.org/software/man.cgi?query=slapo-remoteauth>`_ configuration. See `slapd-config manual <https://www.openldap.org/software/man.cgi?query=slapd-config>`_ for more information about corresponding cn=config configuration
