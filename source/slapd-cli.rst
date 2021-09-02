****************
slapd-cli
****************

Presentation

The script slapd-cli provide start, stop and other commands for OpenLDAP daemon. It requires:

    Logger, to forward messages to syslog
    Awk, for regular expression management
    BerkeleyDB, for recover and archive tools
    OpenLDAP, for save, index, ... tools

Configuration of this script can be done in an external file, with the same name as the slapd-cli script in /usr/local/openldap/etc/openldap.

A backup feature allows to save all data or configuration in an LDIF file, compressed or not. The restore feature import the last backup in the directory.
This script is included in LTB OpenLDAP RPMS and LTB OpenLDAP DEBS
Usage of CLI

Run the script like that:

# /usr/local/openldap/sbin/slapd-cli <action>

With action in:

    start:
        Test configuration
        Start slurpd if needed
        Start slapd with data recover if needed
    stop:
        Stop slapd and save data if needed
        Stop slurpd if needed
    forcestop:
        If script can read PID, do a kill -KILL PID
        Else killall -KILL on binaries name
    restart:
        Launch stop
        Launch start
    force-reload:
        Force stop
        Config test
        Start
    configtest: test configuration
    db_recover: data recover (slapd must be stopped)
    reindex: data index (slapd must be stopped)
    removelogs: archive old BerkeleyDB logs (slapd must be stopped)
    backup: LDIF export of all data
    restore: Remove current data and restore last backup
    backupconfig: LDIF export of configuration or copy of slapd.conf
    restoreconfig: Remove current configuration and restore last backup
    status: Display running status and naming contexts
    debug: Stop OpenLDAP and restart it in debug mode (level can be configured), with output on the console
    checksync: Try to find configured providers and check synchronization status

Installation of CLI

Copy script in /usr/local/openldap/sbin:

# mv slapd-cli /usr/local/openldap/sbin
# chmod +x /usr/local/openldap/sbin/slapd

Configuration file must be installed in /usr/local/openldap/etc/openldap:

# mkdir -p /usr/local/openldap/etc/openldap
# mv slapd-cli.conf /usr/local/openldap/etc/openldap
# chmod 600 /usr/local/openldap/etc/openldap/slapd-cli.conf

Configuration of CLI

Use the external file in /usr/local/openldap/etc/openldap rather than editing directly the script.

    Following parameters are mandatory:

Parameter 	Description
IP 	Listen address for standard LDAP requests. Meta character * can be used for all interfaces
PORT 	Listen port for standard LDAP requests. Use SLAPD_SERVICES if you need several ports
SSLIP 	Listen address for LDAPS requests. Meta character * can be used for all interfaces
LDAPI_SOCKETDIR 	Directory where LDAPI socket is created (will be created if it does not exist)
LDAPI_SOCKETURL 	LDAPI socket URL (URL encoded value)
- 	
SLAPD_PATH 	OpenLDAP main directory
DATA_PATH 	Data directory. You can set auto to get directories configured in slapd.conf
SLAPD_PID_FILE 	The pidfile parameter of slapd.conf
SLAPD_CONF 	Main configuration file
SLAPD_SERVICES 	Listen URI LDAP list, separated by spaces
SLAPD_BIN 	slapd binary path
- 	
SLAPADD_BIN 	slapadd binary path
SLAPCAT_BIN 	slapcat binary path
SLAPINDEX_BIN 	slapindex binary path
SLAPTEST_BIN 	slaptest binary path
- 	
SLURPD_PID_FILE 	The replica-pidfile parameter of slapd.conf
SLURPD_BIN 	slurpd binary path
- 	
BDB_PATH 	BerkeleyDB main directory
DB_ARCHIVE_BIN 	db_archive binary path
DB_RECOVER_BIN 	db_recover binary path
RECOVER_AT_STARTUP 	Force data recover on startup. Should not be used for OpenLDAP > 2.2
- 	
BACKUP_AT_SHUTDOWN 	Backup data when slapd is stopped
BACKUP_PATH 	Backup directory
BACKUP_SUFFIX 	Backup file suffix
- 	
TIMEOUT 	Stop slapd timeout. After that, you need to use the forcestop rule
FD_LIMIT 	Maximum opened file descriptor

    Following parameters are not mandatory (they can contain “”) :

Parameter 	Description
SLAPD_PARAMS 	Additional options forslapd. options -h, -f, -u et -g are already managed
SLAPD_CONF_DIR 	Main configuration dir (cancel SLAPD_CONF parameter)
SLAPD_USER 	Owner user of slapd andslurpd process
SLAPD_GROUP 	Owner group of slapd andslurpd process
SLAPD_SYSLOG_LOCAL_USER 	Syslog local user (by default local4)
- 	
SLURPD_PARAMS 	Additional options for slurpd. Option -f is already managed
- 	
BACKUP_COMPRESS_EXT 	Extension of LDIF compressed file. No compression is done if this is empty
BACKUP_COMPRESS_BIN 	Binary used to compress LDIF file
BACKUP_UNCOMPRESS_BIN 	Binary used to uncompress LDIF file
DEBUG_LEVEL 	OpenLDAP log level to use in debug mode. Default is 256 (stats)
Startup script
initd script

The slapd-cli command is used in an initd script.

Installation:

# cp slapd.init /etc/init.d/slapd
# chmod +x /etc/init.d/slapd

For RedHat based systems:

# chkconfig --add slapd

For Debian based systems:

# update-rc.d slapd defaults

systemd script

The slapd-cli command is used in an systemd script.

Installation:

# cp slapd.service /etc/systemd/system/
# systemctl --system daemon-reload
# systemctl enable slapd.service

Run several OpenLDAP instances

You can run several OpenLDAP daemons on the same server.
initd script

    Copy initd script:

# cp /etc/init.d/slapd /etc/init.d/slapd2

    Change CLI_BIN value:

CLI_BIN="/usr/local/openldap/sbin/slapd2-cli"

    Link slapd-cli command:

# ln -s /usr/local/openldap/sbin/slapd-cli /usr/local/openldap/sbin/slapd2-cli

    Copy and edit slapd-cli configuration to change at least the ports and PID file:

# cp /usr/local/openldap/etc/openldap/slapd-cli.conf /usr/local/openldap/etc/openldap/slapd2-cli.conf

systemd script

    Copy systemd script:

# cp /etc/systemd/system/slapd.service /etc/systemd/system/slapd2.service

    Change PIDFile, ExecStart, ExecRestart, ExecStop values:

PIDFile=/usr/local/openldap/var/run/slapd2.pid
ExecStart=/usr/local/openldap/sbin/slapd2-cli start
ExecRestart=/usr/local/openldap/sbin/slapd2-cli restart
ExecStop=/usr/local/openldap/sbin/slapd2-cli stop

    Link slapd-cli command:

# ln -s /usr/local/openldap/sbin/slapd-cli /usr/local/openldap/sbin/slapd2-cli

    Copy and edit slapd-cli configuration to change at least the ports and PID file:

# cp /usr/local/openldap/etc/openldap/slapd-cli.conf /usr/local/openldap/etc/openldap/slapd2-cli.conf


