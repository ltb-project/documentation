************************************
Migrate from slapd.conf to cn=config
************************************

.. TIP::
   This documentation is generic

Assumptions:

    :<SLAPD_CONF>: the path to the ``slapd.conf`` OpenLDAP configuration file
    :<SLAPD_CONF_DIR>: the path to the ``slapd.d`` folder that is going to store the future cn=config configuration
    :<SLAPD_USER>: the user that owns the slapd process
    :<SLAPD_GROUP>: the group that owns the slapd process

1. Stop OpenLDAP::

    systemctl stop slapd-ltb

2. Create cn=config directory::

    mkdir <SLAPD_CONF_DIR>

3. Convert configuration file::

    slaptest -f <SLAPD_CONF> -F <SLAPD_CONF_DIR> -d 256

    # set correct permissions
    chown -R <SLAPD_USER>:<SLAPD_GROUP> <SLAPD_CONF_DIR>
    find <SLAPD_CONF_DIR> -type d -exec chmod 750 {} \;
    find <SLAPD_CONF_DIR> -type f -exec chmod 640 {} \;

4. Update the arguments for your OpenLDAP launch command. It can be in any of these paths:

    * the systemd configuration file,
    * ``/etc/default/slapd``,
    * ``/etc/sysconfig/slapd``,
    * ``/usr/local/openldap/etc/openldap/slapd-cli.conf`` for OpenLDAP LTB packages

You should replace the argument: ``-f <SLAPD_CONF>`` by ``-F <SLAPD_CONF_DIR>``

5. Start OpenLDAP::

    systemctl start slapd-ltb


