*************************
Check LDAP entry presence
*************************


Presentation
============

This Nagios plugin checks if a given entry is present in an LDAP directory.

It does a simple search with the entry DN as base value, and base as scope value.

Configuration
=============

Required Perl modules:

    * Net::LDAP
    * Getopt::Std

Edit the script to modify some default parameters:

    * timeout: time in second for LDAP connection timeout (default: 5)
    * version: LDAP version to use (default: 3)

Other parameters are set as script options (see below).

Usage
=====

.. code-block:: console

   $ perl check_ldap_dn.pl -H hostname [-p port] [-D binddn -W bindpw] -b dn

Mandatory Options
-----------------

-H   LDAP server hostname or IP, or LDAP URI
-b   DN of the entry to check (base of the LDAP search)

Other options
-------------

-p   LDAP server port (not working if LDAP URI is set in -H)
-D   Bind DN
-W   Bind password

.. include:: download-plugins.rst
