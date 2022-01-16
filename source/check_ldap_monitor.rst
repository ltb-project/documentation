*************************************
Check OpenLDAP cn=monitor information
*************************************

Presentation
============

This Nagios plugin gets different information from OpenLDAP cn=monitor backend like:

     * Current connections
     * Total connections
     * LDAP operations
     * BDB backend caches
     * MDB used and free pages

With performance data, it allows to create graph to follow evolution of these indicators.

Configuration
=============

Required Perl modules:

     * Net::LDAP
     * Getopt::Std
     * File::Basename

Usage
=====

.. code-block:: console

    $ perl check_ldap_monitor.pl -T type -H hostname [-p port] [-D binddn -P bindpw] [-m mode]

Mandatory Options

-H    LDAP server hostname or IP, or LDAP URI
-w    Warning threshold
-c    Critical threshold
-T    Type of information to check:

         * **currentconnections**: current established connections
         * **totalconnections**: total established connections
         * **dncache**: total DN in cache
         * **entrycache**: total entries in cache
         * **idlcache**: total IDL in cache
         * **totaloperations**: total operations
         * **totalabandon**: total ABANDON operation
         * **totaladd**: total ADD operations
         * **totalbind**: total BIND operations
         * **totalcompare**: total COMPARE operations
         * **totaldelete**: total DELETE operations
         * **totalextended**: total EXTENDED operations
         * **totalmodify**: total MODIFY operations
         * **totalmodrdn**: total MODRDN operations
         * **totalsearch**: total SEARCH operations
         * **totalunbind**: total UNBIND operations
         * **mdbpagesmax**: maximum pages in MDB database
         * **mdbpagesused**: used pages in MDB database
         * **mdbpagesfree**: free pages in MDB database
         * **mdbpagesusedrelative**: percentage of used pages in MDB database
         * **mdbpagesfreerelative**: percentage of free pages in MDB database

Other options

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
-b    Base of the LDAP search
-m    Mode (default: lesser):

        * **lesser**: error is returned if found value is inferior to warning or critical level
        * **greater**: error is returned if found value is superior to warning or critical level

.. include:: download-plugins.rst

For example:

.. code-block:: console

    $ perl check_ldap_monitor.pl -H ldap+tls://ldap.example.org -Duid=monitor,cn=users,dc=example,dc=org -Pabc -b "cn=Database 2,cn=Databases,cn=Monitor"  -T mdbpagesfreerelative -w 90 -c 95  -s base -m greater
    OK - 19.2708333333333 percent of used pages in MDB database returned
