************************************
Pass-Trough authentication with SASL
************************************

Presentation

Pass-Trough authentication is a mechanism used by some LDAP directories to delegate authentication operations (BIND) to other backends.

It should be distinguished from the external authentication methods, that are managed by the LDAP client to authenticate on a trusted source and then connect to the directory.

Pass-Trough authentication is purely transparent for LDAP clients, as they send standard authentication operations to the LDAP directory, which will then handle the delegation and forward the response to the client, as the authentication was done locally.

A real world use case is the coexistence between OpenLDAP and Active Directory: on choice can be to let the password into AD, and configure a pass-trough authentication between OpenLDAP and AD. With this setup, authentications done on the OpenLDAP part will use the AD password.
Technical description

OpenLDAP is known to be able to use pass-trough authentication. This option should be compiled into it. If not, get the source and use this option in the configure step:

./configure --enable-spasswd --with-cyrus-sasl

This will allow you to store password with this syntax in userPassword attribute:

userPassword: {SASL}user@domain

This option is enabled in LDAP Tool Box OpenLDAP RPMs.

You then need the saslauthd daemon, which is available on most Linux distributions.

The pass-trough authentication will then work like this:

    A BIND operation is received by OpenLDAP with parameters DN1 and PWD1
    OpenLDAP get DN1 entry and read userPassword attribute
    DN1 password is a SASL password so OpenLDAP do an SASL authentication with user@domain and PWD1 credentials
    SASL authentication daemon use the credentials to look for the user into the backend (for example Active Directory) and gets the matching DN, DN2
    SASL do a BIND operation with DN2 and PWD1
    The backend manage the BIND and return response to SASL
    SASL return response to OpenLDAP (yes/no)
    OpenLDAP return response to the LDAP client

Pass-Trough authentication on one LDAP directory

This is the standard use case: the password is stored in a directory and other LDAP directories delegate authentication to it.
This chapter allows you to use several LDAP directories as authentication backend, but only for redundancy problems: all directories will have the same data inside. To see how use several directories with different data model, go to next chapter.
Step 1: connection to the backend

You need to get all connection parameters to the authentication backend. An example with Active Directory:

    Server address: ldap://ad.example.com
    Bind DN: CN=Administrator,CN=Users,DC=example,DC=com
    Bind Password: ADpassword
    Users branch: CN=DomainUsers,DC=example,DC=com

You can check these settings with an ldapsearch:

ldapsearch -x -H ldap://ad.example.com -D CN=Administrator,CN=Users,DC=example,DC=com -w ADpassword -b CN=DomainUsers,DC=example,DC=com

Step 2: configure saslauthd

First, check the your SASL daemon supports LDAP:

saslauthd -v

If not, reinstall an LDAP aware saslauthd daemon.

Then to activate LDAP as SASL mechanism:

vi /etc/sysconfig/saslauthd

# Directory in which to place saslauthd's listening socket, pid file, and so
# on.  This directory must already exist.
SOCKETDIR=/var/run/saslauthd

# Mechanism to use when checking passwords.  Run "saslauthd -v" to get a list
# of which mechanism your installation was compiled with the ablity to use.
MECH=ldap

# Additional flags to pass to saslauthd on the command line.  See saslauthd(8)
# for the list of accepted flags.
FLAGS="-O /etc/saslauthd.conf"

On RedHat systems, activate saslauthd on startup:

chkconfig saslauthd on

On Debian Buster systems, activate saslauthd -r option

At the end of /etc/default/saslauthd

OPTIONS="-r -c -m /var/run/saslauthd"

To finish enter all connection information found at step one:

vi /etc/saslauthd.conf

ldap_servers: ldap://ad.example.com
ldap_search_base: CN=DomainUsers,DC=example,DC=com
ldap_timeout: 10
ldap_filter: sAMAccountName=%U
ldap_bind_dn: CN=Administrator,CN=Users,DC=example,DC=com
ldap_password: ADpassword
ldap_deref: never
ldap_restart: yes
ldap_scope: sub
ldap_use_sasl: no
ldap_start_tls: no
ldap_version: 3
ldap_auth_method: bind

Main parameters are:

    ldap_servers: LDAP URI, space separated for redundancy
    ldap_bind_dn: DN for connection
    ldap_password: Password for connection
    ldap_search_base: Search base
    ldap_filter: Search filter
    ldap_scope: Search scope

In parameters ldap_search_base and ldap_filter, you can use these variables (example for SASL password user@domain):

    %u: user@domain
    %U: user
    %d: domain

Restart saslauthd:

service saslauthd restart

Step 3: communication between OpenLDAP and saslauthd

The communication between the two daemons are done trough a mutex, configured like this:

vi /usr/lib/sasl2/slapd.conf

pwcheck_method: saslauthd
saslauthd_path: /var/run/saslauthd/mux

Add OpenLDAP user to sasl group (adapt names to your distribution settings):

usermod -a -G sasl ldap

Step 4: OpenLDAP configuration

Edit OpenLDAP configuration to configure the SASL paramters:

sasl-host       localhost
sasl-secprops   none

Restart OpenLDAP:

service slapd restart

Step 5: be proud

Now we can use the pass-trough authentication. To test it, you need an account in the backend, for example:

# Clement OUDOT, DomainUsers, example;com
dn: CN=Clement OUDOT,OU=DomainUsers,DC=example,DC=com
objectClass: top
objectClass: person
objectClass: organizationalPerson
objectClass: user
objectClass: inetOrgPerson
cn: Clement OUDOT
sn: OUDOT
givenName: Clement
distinguishedName: CN=Clement OUDOT,OU=DomainUsers,DC=example,DC=com
instanceType: 4
whenCreated: 20080617074258.0Z
whenChanged: 20080617081856.0Z
displayName: Clement OUDOT
uSNCreated: 77070
uSNChanged: 78687
name: Clement OUDOT
objectGUID:: TB3HuDzG8EOoUKBrMWRnyg==
userAccountControl: 66048
badPwdCount: 0
codePage: 0
countryCode: 0
badPasswordTime: 0
lastLogoff: 0
lastLogon: 0
pwdLastSet: 128581621788125000
primaryGroupID: 513
objectSid:: AQUAAAAAAAUVAAAAmtgimaPoR9Go86e7PQgAAA==
accountExpires: 9223372036854775807
logonCount: 0
sAMAccountName: coudot
sAMAccountType: 805306368
userPrincipalName: coudot@example.com
objectCategory: CN=Person,CN=Schema,CN=Configuration,DC=example,DC=com

You can test the SASL part with this command:

testsaslauthd -u coudot -p password

Then create an account in OpenLDAP, for example:

dn: uid=coudot,ou=users,dc=example,dc=com
objectClass: inetOrgPerson
objectClass: organizationalPerson
objectClass: person
objectClass: top
uid: coudot
cn: Clement OUDOT
sn: OUDOT
userPassword: {SASL}coudot@example.com

Now you can bind to OpenLDAP with AD password:

ldapsearch -x -H ldap://ldap.example.com -b dc=example,dc=com -D uid=coudot,ou=users,dc=example,dc=com -w password

Pass-Trough authentication on several LDAP directories - with OpenLDAP meta backend

This chapter explains how do Pass-Trough authentication on several LDAP backends with OpenLDAP meta backend. This adds complexity as SASL daemon can only be configured to connect a single remote directory, and OpenLDAP cannot use several SASL authentication daemon. The solution described here use a meta directory between SASL daemon and remote directories. The choice of the backend to contact will be done in the SASL password value, for example {SASL}user@LDAP1 and {SASL}user@LDAP2.
You need to install all the components of the previous chapter. This chapter will only describe the evolutions to do.
Step 1: create the meta directory

Configure a new OpenLDAP instance that will be a meta directory for the LDAP backends, for example:

# Database
database        meta
suffix          "dc=local"
rootdn          "cn=Manager,dc=local"
rootpw          secret

# LDAP 1
uri ldap://ldap1.example.com/ou=LDAP1,dc=local

lastmod       off
suffixmassage   "ou=LDAP1,dc=local" "dc=example1,dc=com"
idassert-bind bindmethod=simple
   binddn="cn=admin,dc=example1,dc=com"
   credentials="secret"
   mode=none
   flags=non-prescriptive
idassert-authzFrom "dn.exact:cn=Manager,dc=local"


# LDAP 2
uri  ldap://ldap2.example.com/ou=LDAP2,dc=local

lastmod       off
suffixmassage "ou=LDAP2,dc=local" "dc=example2,dc=com"
idassert-bind bindmethod=simple
  binddn="cn=admin,dc=example2,dc=com"
  credentials="secret"
  mode=none
  flags=non-prescriptive
idassert-authzFrom "dn.exact:cn=Manager,dc=local"

Launch this server on a new port (or another server), that will be accessible from SASL dameon. For example it will be launched on ldap://127.0.0.1:390/
Step 2: reconfigure saslauthd

Adapt SASL daemon configuration to contact the meta directory:

vi /etc/saslauthd.conf

ldap_servers: ldap://127.0.0.1:390/
ldap_search_base: ou=%d,dc=local
ldap_timeout: 10
ldap_filter: (|(uid=%U)(SAMACCOUNTNAME=%U))
ldap_bind_dn: cn=Manager,dc=local
ldap_password: secret
ldap_deref: never
ldap_restart: yes
ldap_scope: sub
ldap_use_sasl: no
ldap_start_tls: no
ldap_version: 3
ldap_auth_method: bind

The interesting changes are:

    ldap_search_base: we use the domain component (%d) to match to destination backend, trough the meta directory DIT
    ldap_filter: we mix the filters with an OR filter, so that the user (%U) will be found whatever backend is called

Restart saslauthd:

service saslauthd restart

Step 3: be really proud

Do the tests of the first chapter, with different users in LDAP1 and LDAP2, and appropriate users in the main OpenLDAP server. By playing with the SASL password value, you are able to choose the authentication backend for pass-trough authentication.
Pass-Trough authentication on several LDAP directories - with OpenLDAP ldap backend
This chapter explains how do Pass-Trough authentication on several LDAP backends with OpenLDAP ldap backend. The advantage over the meta backend is the possibility to use the rwm overlay with specific configuration for a backend directory, and for those using the cn=config backend, to manage the configuration into it (as these lines are written, backend meta is not supported in cn=config).
Step 1: create the proxy directory

Configure a new OpenLDAP instance that will be a proxy directory for the LDAP backends, for example:

# Database LDAP for local Manager authentication
database ldap
suffix "cn=manager,dc=local"
rootdn "cn=manager,dc=local"
rootpw secret

# Database LDAP for LDAP 1
database        ldap
suffix          "ou=LDAP1,dc=local"

uri ldap://ldap1.example.com

idassert-bind bindmethod=simple
   binddn="cn=admin,dc=example1,dc=com"
   credentials="secret"
   mode=none
   flags=non-prescriptive
idassert-authzFrom "dn.exact:cn=Manager,dc=local"

overlay rwm
rwm-suffixmassage   "ou=LDAP1,dc=local" "dc=example,dc=com"

# Database LDAP for LDAP 2
database        ldap
suffix          "ou=LDAP1,dc=local"

uri  ldap://ldap2.example.com

idassert-bind bindmethod=simple
  binddn="cn=admin,dc=example2,dc=com"
  credentials="secret"
  mode=none
  flags=non-prescriptive
idassert-authzFrom "dn.exact:cn=Manager,dc=local"

overlay rwm
rwm-suffixmassage   "ou=LDAP1,dc=local" "dc=example,dc=com"

# Example of rwm configuration for Active Directory
rwm-map attribute uid sAMAccountName
rwm-map attribute * *

Step 2: reconfigure saslauthd

Adapt SASL daemon configuration to contact the meta directory:

vi /etc/saslauthd.conf

ldap_servers: ldap://127.0.0.1:390/
ldap_search_base: ou=%d,dc=local
ldap_timeout: 10
ldap_filter: uid=%U
ldap_bind_dn: cn=Manager,dc=local
ldap_password: secret
ldap_deref: never
ldap_restart: yes
ldap_scope: sub
ldap_use_sasl: no
ldap_start_tls: no
ldap_version: 3
ldap_auth_method: bind

We just change the ldap_search_base parameter to use the domain component (%d) to match to destination backend, trough the meta directory DIT. You can keep a simple ldap_fitler parameter, as we use rwm overlay to match the login attribute in both directories.

Restart saslauthd:

service saslauthd restart

Step 3: be really proud (indeed, you are awesome)

Do the tests of the first chapter, with different users in LDAP1 and LDAP2, and appropriate users in the main OpenLDAP server. By playing with the SASL password value, you are able to choose the authentication backend for pass-trough authentication.

