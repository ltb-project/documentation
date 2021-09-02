************************************
Migrate from slapd.conf to cn=config
************************************

This documentation was written for OpenLDAP LTB packages

Stop OpenLDAP:

# service slapd stop

Create cn=config directory:

# mkdir /usr/local/openldap/etc/openldap/slapd.d

Convert configuration file:

# slaptest -f /usr/local/openldap/etc/openldap/slapd.conf -F /usr/local/openldap/etc/openldap/slapd.d -d 256
563b227f bdb_monitor_db_open: monitoring disabled; configure monitor database to enable
config file testing succeeded

# chown -R ldap.ldap /usr/local/openldap/etc/openldap/slapd.d

Edit and update /usr/local/openldap/etc/openldap/slapd-cli.conf with:

SLAPD_CONF_DIR="$SLAPD_PATH/etc/openldap/slapd.d"

Start OpenLDAP:

# service slapd start


