*********************
Check Syncrepl status
*********************

Presentation

This Nagios script checks syncrepl status. Syncrepl has replaced slurpd in OpenLDAP for data replication. It should be implemented in other Open Source LDAP directories.

No temporary files are used to check the state of the replication, just cookies with timestamps (the contextCSN attribute). The script will read the status cookies of the LDAP servers and display if they are in sync or not.
Configuration

Required Perl modules:

    Getopt::Long
    File::Basename
    POSIX
    Net::LDAP
    Date::Manip
    Time::Piece

Usage

check_ldap_syncrepl_status.pl -H <hostname> [-h] [-v] [-V]

Mandatory options

    -H: IP, host or LDAP URI of the slave server.
    -w: lag in seconds to raise a WARNING alert.
    -c: lag in seconds to raise a CRITICAL alert.

Other options

    -v, -vv, -vvv: debugging level.
    -V: print version and exit.
    -h: print help and quit.
    -p: slave server port (not used if LDAP URI in -H).
    -f: output performance data.
    -t: timeout.
    -D: DN to connect to master and slave.
    -P: password for connection DN.
    -U: LDAP URI of master server. If not given, a search is done in cn=monitor.
    -S: Suffix of servers (must contains the contextCSN attribute). If not given, a search in RootDSE is done.
    -I: server ID (SID), mandatory for mirror mode. Default value: 000.

Remark: To use SSL/TLS, write ldaps: or ldap+tls: in LDAP URI.
Download

This plugin, along with all other Nagios plugins from this site, can be downloaded in a single archive.

