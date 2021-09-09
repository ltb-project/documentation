****************
Check LDAP query
****************

Presentation
============

This Nagios plugin counts entries returned by an LDAP search.

You can configure base, filter and scope of the search.

Configuration
=============

Required Perl modules:

     * Net::LDAP
     * Getopt::Std
     * File::Basename

Usage
=====

.. code-block:: console

    $ perl check_ldap_query.pl -H hostname [-p port] [-D binddn -P bindpw] -F filter -b base -s scope -m mode

Mandatory Options
-----------------

-H    LDAP server hostname or IP, or LDAP URI
-b    Base of the LDAP search
-w    Warning threshold
-c    Critical threshold
-m    Mode:

       * lesser: error is returned if found value is inferior to warning or critical level
       * greater: error is returned if found value is superior to warning or critical level

Other options
-------------

-p    LDAP server port (not working if LDAP URI is set in -H)
-D    Bind DN
-P    Bind password
-v    Verbose
-V    Print version and exit
-h    Print help and exit
-f    Performance data
-t    Timeout
-F    Filter of the LDAP search
-s    Scope of the LDAP search

.. include:: download-plugins.rst
