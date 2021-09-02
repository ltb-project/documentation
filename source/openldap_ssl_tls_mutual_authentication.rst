*****************************************************
Configure SSL/TLS mutual authentication with OpenLDAP
*****************************************************

The goal is to be able to authenticate against OpenLDAP with a X509 client certificate and map identity of client certificate to an LDAP entry.

Certificates and test values
----------------------------

We use these variable names in the tutorial:

    :CA_SERVER: Certificate Authority that signed the CERT_SERVER
    :CERT_SERVER: Server certificate. Its Common Name must be the DNS name of OpenLDAP server
    :KEY_SERVER: Server key.
    :CA_CLIENT: Certificate Authority that signed the CERT_CLIENT
    :CERT_CLIENT: Client certificate. Its Common Name must be related to a user, with a least a field that exists in the corresponding LDAP entry
    :KEY_CLIENT: Client key.

.. NOTE::
   Remove password on KEY_CLIENT as it's not managed by LDAP client utilities (ldapsearch,...)

We also use these test values:

    * LDAP DNS name: ``ldap.example.com``
    * Client certificate Common Name: ``email=dwho@badwolf.org,cn=dwho,o=SFL,l=Lyon,st=Rhone,c=FR``
    * User LDAP entry: ``uid=dwho,ou=users,dc=example,dc=com``

OpenLDAP server configuration
-----------------------------

In cn=config entry [#f1]_, use these parameters::

    olcAuthzRegexp: {0}"EMAIL=([^,]*)," ldap:///ou=users,dc=example,dc=com??one?(MAIL=$1)
    olcTLSCACertificateFile: /path/to/CA_CLIENT
    olcTLSCertificateFile: /path/to/CERT_SERVER
    olcTLSCertificateKeyFile: /path/to/KEY_SERVER
    olcTLSCipherSuite: HIGH:MEDIUM:-SSLv2
    olcTLSCRLCheck: none
    olcTLSVerifyClient: allow 

Client configuration
--------------------

You can configure some LDAP client settings in ``$HOME/.ldaprc`` file::

    TLS_REQCERT try
    TLS_CACERT /path/to/CA_SERVER
    TLS_CERT /path/to/CERT_CLIENT
    TLS_KEY /path/to/KEY_CLIENT
    SASL_MECH external 

Test
----

You can now connect with client certificate and be identifed as the corresponding LDAP entry.

With STARTTLS::

    $ ldapwhoami -H ldap://ldap.example.com -Z
    SASL/EXTERNAL authentication started
    SASL username: email=dwho@badwolf.org,cn=dwho,o=SFL,l=Lyon,st=Rhone,c=FR
    SASL SSF: 0 
    dn:uid=dwho,ou=users,dc=example,dc=com 

With LDAPS::

    $ ldapwhoami -H ldaps://ldap.example.com
    SASL/EXTERNAL authentication started
    SASL username: email=dwho@badwolf.org,cn=dwho,o=SFL,l=Lyon,st=Rhone,c=FR
    SASL SSF: 0 
    dn:uid=dwho,ou=users,dc=example,dc=com 


.. rubric:: Footnotes

.. [#f1] Example is given for a `cn=config <https://www.openldap.org/software/man.cgi?query=slapd-config>`_ configuration. See `slapd.conf manual <https://www.openldap.org/software/man.cgi?query=slapd.conf>`_ for more information about corresponding flat OpenLDAP configuration.

