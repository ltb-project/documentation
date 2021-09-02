**************************************
Best practices for LDAP authentication
**************************************

Introduction
============

You will find here some best practices to code LDAP authentication in your applications:

* Use a filter to recover user DN: do not build DN with a concatenation of login and branch
* Use service account to query LDAP: some directories will not allow anonymous access

Search and Bind
===============

Here is a standard LDAP authentication workflow:

1. A bind is done with a Directory Service Account (that has read rights on user entries)
2. A search is done with the user identifier in the filter, for example:

  :Search base: ``ou=users,dc=example,dc=com``
  :Search filter: ``(&(uid=<user identifier>)(objectClass=person))``
  :Search scope: ``one``
  :Search attributes: ``uid``

3. The DN of the user is found in the result. If more of one entry is returned, or no entry is returned, there should be an error.
4. A bind is done with the DN found and the password submitted by the user. If the operation fails (error code 49), the password is wrong.


