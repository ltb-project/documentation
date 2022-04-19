
Pass-Through authentication is a mechanism used by some LDAP directories to delegate authentication operations (BIND) to other backends.

It should be distinguished from the external authentication methods, that are managed by the LDAP client to authenticate on a trusted source and then connect to the directory.

Pass-Through authentication is purely transparent for LDAP clients, as they send standard authentication operations to the LDAP directory, which will then handle the delegation and forward the response to the client, as if the authentication had occured locally.

A real world use case is the coexistence between OpenLDAP and Active Directory: a notable scenario could be to let the password into AD, and configure a pass-through authentication between OpenLDAP and AD. With this setup, authentications done on the OpenLDAP are actually delegated to Active Directory.

There are two different solutions for setting up delegation of authentication:

* :doc:`SASL delegation<sasl_delegation>`
* :doc:`remoteauth delegation<remoteauth_delegation>`

There are some differences between these solutions:

* SASL method has 3 layers: **OpenLDAP — SASL daemon — 3rd party LDAP**, whereas remoteauth has 2: **OpenLDAP — 3rd party LDAP**
* SASL method allows more fine-grain configuration: domain set-up in the user password, LDAP search options to the 3rd party LDAP, timeout,..., but requires the meta or LDAP backend for dealing with multiple directories
* remoteauth method is designed for managing multiple directories, grouped by domain. This requires constraints on the LDAP data: delegation is triggered globally for every entry with no userPassword and requires additional attributes for storing the user domain and DN
* remoteauth is recommended by OpenLDAP core team
