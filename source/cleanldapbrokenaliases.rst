*************************
Clean LDAP broken aliases
*************************

Presentation
============

This script will browse LDAP directory, find aliases, search target entry and delete alias if the target entry was removed.

This shell script must be run as a cronjob. You can run it daily.

It requires:

     * awk
     * sed
     * perl
     * openldap utils (ldapsearch, ldapdelete)

Tested on GNU/Linux.

Usage
=====

Command line parameters:

     * ``-b <basedn>``: search base

Run:

.. code-block:: console

   sh cleanLdapBrokenAliases.sh -b "ou=structures,dc=example,dc=com"

Configuration
=============

Edit the script to adapt configuration:

     * ``MY_LDAP_URI``: LDAP URI
     * ``MY_LDAP_BINDDN``: DN to use to bind
     * ``MY_LDAP_BINDPW``: Password
     * ``MY_LOG_HEADER``: Log header

The PATH must be set to include all shell commands used by the script.

