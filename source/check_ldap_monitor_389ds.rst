**********************************
Check 389DS cn=monitor information
**********************************

Presentation

This Nagios plugin gets different information from 389DS cn=monitor backend like:

    Current connections
    Total connections
    Performance informations

With performance data, it allows to create graph to follow evolution of these indicators.
Configuration

Required Perl modules:

    Net::LDAP
    Getopt::Std
    File::Basename

Usage

$ perl check_ldap_monitor_389DS.pl -T type -H hostname [-p port] [-D binddn -P bindpw] [-m mode]

Mandatory Options

    -H: LDAP server hostname or IP, or LDAP URI
    -w: Warning threshold (except for version, currenttime, starttime, nbackends, readonly, maxentrycachesize, maxdncachesize types)
    -c: Critical threshold (except for version, currenttime, starttime, nbackends, readonly, maxentrycachesize, maxdncachesize types)
    -T: Type of information to check:
        version: current version of the ldap server
        threads: current number of active threads used for handling requests.
        currentconnections: current established connections
        totalconnections: total established connections
        dtablesize: the number of file descriptors available to the directory. Essentially, this value shows how many additional concurrent connections can be serviced by the directory.
        readwaiters: current number of threads waiting to read data from a client.
        opsinitiated: current number of operations the server has initiated since it started.
        opscompleted: current number of operations the server has completed since it started.
        entriessent: current number of entries sent to clients since the server started.
        bytessent: current number of bytes sent to clients since the server started.
        currenttime: current time of the server. The time is displayed in Greenwich Mean Time (GMT) in UTC format.
        starttime: time when the server started. The time is displayed in Greenwich Mean Time (GMT) in UTC format.
        nbackends: current number of back ends (databases) the server services.
    LMBD cache specific checks, theses needs Directory Manager user (don't do this) or specific ACL for your monitoring user.
        readonly: Indicates whether the database is in read-only mode; 0 means that the server is not in read-only mode, 1 means that it is in read-only mode.
        entrycachehits: The total number of successful entry cache lookups. That is, the total number of times the server could process a search request by obtaining data from the cache rather than by going to disk.
        entrycachetries: The total number of entry cache lookups since the directory was last started. That is, the total number of search operations performed against the server since server startup.
        entrycachehitratio: Ratio that indicates the number of entry cache tries to successful entry cache lookups. This number is based on the total lookups and hits since the directory was last started. The closer this value is to 100%, the better.
        currententrycachecount: The number of entries currently present in the entry cache.
        currententrycachesize: The total size, in bytes, of directory entries currently present in the entry cache.
        maxentrycachesize: The maximum size, in bytes, of directory entries that can be maintained in the entry cache.
        dncachehitratio: Ratio that indicates the number of DN cache tries to successful DN cache lookups. This number is based on the total lookups and hits since the directory was last started. The closer this value is to 100%, the better.
        dncachehits: The total number of successful DN cache lookups. That is, the total number of times the server could process a search request by obtaining data from the cache rather than by going to disk.
        dncachetries: The total number of DNs cache lookups since the directory was last started. That is, the total number of search operations performed against the server since server startup.
        currentdncachecount: The number of entries currently present in the DN cache.
        currentdncachesize: The total size, in bytes, of directory entries currently present in the DN cache.
        maxdncachesize: The maximum size, in bytes, of directory entries that can be maintained in the DN cache.

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

