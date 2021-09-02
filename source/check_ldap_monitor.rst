*************************************
Check OpenLDAP cn=monitor information
*************************************

Presentation

This Nagios plugin gets different information from OpenLDAP cn=monitor backend like:

    Current connections
    Total connections
    LDAP operations
    BDB backend caches
    MDB used and free pages

With performance data, it allows to create graph to follow evolution of these indicators.
Configuration

Required Perl modules:

    Net::LDAP
    Getopt::Std
    File::Basename

Usage

$ perl check_ldap_monitor.pl -T type -H hostname [-p port] [-D binddn -P bindpw] [-m mode]

Mandatory Options

    -H: LDAP server hostname or IP, or LDAP URI
    -w: Warning threshold
    -c: Critical threshold
    -T: Type of information to check:
        currentconnections: current established connections
        totalconnections: total established connections
        dncache: total DN in cache
        entrycache: total entries in cache
        idlcache: total IDL in cache
        totaloperations: total operations
        totalabandon: total ABANDON operation
        totaladd: total ADD operations
        totalbind: total BIND operations
        totalcompare: total COMPARE operations
        totaldelete: total DELETE operations
        totalextended: total EXTENDED operations
        totalmodify: total MODIFY operations
        totalmodrdn: total MODRDN operations
        totalsearch: total SEARCH operations
        totalunbind: total UNBIND operations
        mdbpagesmax: maximum pages in MDB database
        mdbpageused: used pages in MDB database
        mdbpagesfree: free pages in MDB database

Other options

    -p: LDAP server port (not working if LDAP URI is set in -H)
    -D: Bind DN
    -P: Bind password
    -v: Verbose
    -V: Print version and exit
    -h: Print help and exit
    -f: Performance data
    -t: Timeout
    -F: Filter of the LDAP search
    -s: Scope of the LDAP search
    -b: Base of the LDAP search
    -m: Mode (default: lesser):
        lesser: error is returned if found value is inferior to warning or critical level
        greater: error is returned if found value is superior to warning or critical level

Download

This plugin, along with all other Nagios plugins from this site, can be downloaded in a single archive.

