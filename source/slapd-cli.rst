****************************
Manage OpenLDAP with the CLI
****************************

Presentation
============

The script ``slapd-cli`` provide start, stop and other commands for OpenLDAP daemon. It requires:

    * Logger, to forward messages to syslog
    * Awk, for regular expression management
    * OpenLDAP, for save, index,... tools

Configuration of this script can be done in an external file, with the same name as the slapd-cli program

The main features are:

   * start / stop / status of OpenLDAP daemon
   * check configuration
   * debug: start OpenLDAP in debug mode (stay attached)
   * reindex
   * backup / restore data
   * backup / restore configuration
   * check synchronization status
   * import test data / test configuration

.. TIP::
   This script is included by default in debian and red-hat OpenLDAP LTB packages. You can also get it from the `main repository <https://github.com/ltb-project/slapd-cli>`_.


Usage of slapd-cli
==================

The script can be launched like this::

    slapd-cli action [optional arguments]

.. TIP::
   In OpenLDAP LTB packages, the script is available in ``/usr/local/openldap/sbin/slapd-cli``.
   Anyway, with the PATH updated by ``/etc/profile.d/openldap-profile.sh``, you can just run ``slapd-cli``.

Action is a keyword between:

    :start: start the slapd server
    :stop: stop the slapd server
    :forcestop: kill the slapd server if it can't stop
    :restart: restart the slapd server
    :debug: start the slapd server in debug mode (stay attached)
    :force-restart: forcestop + start
    :status: get the status of currently running slapd server
    :configtest: test configuration syntax
    :reindex: index or reindex database
    :backup: backup the data
    :restore: restore the data
    :backupconfig: backup the configuration
    :restoreconfig: restore the configuration
    :checksync: check the synchronization state of the current instance to every provider found in configuration
    :importflatconfigtemplate: import the flat template configuration file, after setting the variables
    :importldifconfigtemplate: import the ldif template configuration file, after setting the variables
    :convertconfig [inputfile.conf] [outputfile.ldif]: convert the input slapd configuration file into the equivalent ldif configuration
    :buildconfigtemplate [inputfile.ldif] [outputfile.ldif]: Get the input ldif configuration file and transform it into a template configuration
    :importdatatemplate: import the template data file, after setting the variables
    :lloadstart: start the load-balancer
    :lloadstop: stop the load-balancer
    :lloadstatus: get the status of currently running load-balancer
    :removeoldbackups: remove old configuration and data backup files (also done when calling backup and backupconfig actions)

.. TIP::
   ``slapd-cli`` provides autocompletion with ``slapd-cli-prompt`` configuration file, which is deployed by default in OpenLDAP LTB packages.
   That way, you just have to use the tab key to find out the actions and autocomplete file names.

.. NOTE::
   This script uses the last modification time of files to know which one to restore or to remove. If you modify a file directly in the backup
   directory, it will impact these actions.

Installation of slapd-cli
=========================

.. NOTE::
   The OpenLDAP installation path is assumed to be ``/usr/local/openldap``.

Copy script in /usr/local/openldap/sbin:

.. code-block:: console

    # mv slapd-cli /usr/local/openldap/sbin
    # chmod +x /usr/local/openldap/sbin/slapd

Configuration file must be installed into configuration folder:

.. code-block:: console

    # mkdir -p /usr/local/openldap/etc/openldap
    # mv slapd-cli.conf /usr/local/openldap/etc/openldap/
    # chmod 600 /usr/local/openldap/etc/openldap/slapd-cli.conf

Deploy template files into configuration folder:

.. code-block:: console

    # mv *-template.{conf,ldif} /usr/local/openldap/etc/openldap/

Optionally, deploy load-balancer configuration file:

.. code-block:: console

    # mv lload.conf /usr/local/openldap/etc/openldap/
    # chmod 600 /usr/local/openldap/etc/openldap/lload.conf

Optionally, enable autocomplete:

.. code-block:: console

    # mv slapd-cli-prompt /etc/bash_completion.d/

Finally, you can decide to use the systemd services for slapd or lload:

.. code-block:: console

    # mv slapd-ltb.service /lib/systemd/system/
    # systemctl --system daemon-reload
    # systemctl enable slapd-ltb.service

    # mv lload-ltb.service /lib/systemd/system/
    # systemctl --system daemon-reload
    # systemctl enable lload-ltb.service

Configuration of slapd-cli
==========================

Use the external file in ``/usr/local/openldap/etc/openldap`` rather than editing directly the script.


Following parameters are about network:

+----------------------------+--------------------------------------------------------------------------------------------+
| Parameter                  | Description                                                                                |
+============================+============================================================================================+
| ``IP``                     | Listen address for LDAP requests. Meta character ``*`` can be used for all interfaces      |
+----------------------------+--------------------------------------------------------------------------------------------+
| ``PORT``                   | Listen port for LDAP requests. Use ``SLAPD_SERVICES`` if you need several ports            |
+----------------------------+--------------------------------------------------------------------------------------------+
| ``SSLIP``                  | Listen address for LDAPS requests. Meta character * can be used for all interfaces         |
+----------------------------+--------------------------------------------------------------------------------------------+
| ``SSLPORT``                | Listen port for LDAPS requests. Use ``SLAPD_SERVICES`` if you need several ports           |
+----------------------------+--------------------------------------------------------------------------------------------+
| ``LDAPI_SOCKETDIR``        | Directory where LDAPI socket is created (will be created if it does not exist)             |
+----------------------------+--------------------------------------------------------------------------------------------+
| ``LDAPI_SOCKETURL``        | LDAPI socket URL (URL encoded value)                                                       |
+----------------------------+--------------------------------------------------------------------------------------------+
| ``SLAPD_SERVICES``         | list of listen LDAP URIs, space-separated. It is made of all previous variables.           |
|                            | This parameter is corresponding to ``-h`` option in slapd launch command.                  |
+----------------------------+--------------------------------------------------------------------------------------------+

Following parameters are about OpenLDAP directories and files:

+----------------------------+--------------------------------------------------------------------------------------------+
| Parameter                  | Description                                                                                |
+============================+============================================================================================+
| ``SLAPD_PATH``             | OpenLDAP main directory                                                                    |
+----------------------------+--------------------------------------------------------------------------------------------+
| ``DATA_PATH``              | Data folder. You can set ``auto`` to let slapd-cli find out data paths in configuration    |
+----------------------------+--------------------------------------------------------------------------------------------+
| ``SLAPD_PID_FILE``         | Path to the pid file. It must match the olcPidFile configuration parameter                 |
+----------------------------+--------------------------------------------------------------------------------------------+
| ``SLAPD_CONF``             | Path to the flat slapd.conf configuration file                                             |
+----------------------------+--------------------------------------------------------------------------------------------+
| ``SLAPD_CONF_DIR``         | Path to the slapd.d folder. When defined, ``SLAPD_CONF`` won't be used anymore             |
+----------------------------+--------------------------------------------------------------------------------------------+
| ``SLAPD_BIN``              | slapd binary path                                                                          |
+----------------------------+--------------------------------------------------------------------------------------------+
| ``SLAPD_PARAMS``           | Additional options for slapd. Options ``-h``, ``-f``, ``-u`` and ``-g`` are already managed|
+----------------------------+--------------------------------------------------------------------------------------------+
| ``SLAPD_MODULEDIR``        | Path to the library module folder                                                          |
+----------------------------+--------------------------------------------------------------------------------------------+
| ``SLAPADD_BIN``            | slapadd binary path                                                                        |
+----------------------------+--------------------------------------------------------------------------------------------+
| ``SLAPADD_PARAMS``         | slapadd extra options                                                                      |
+----------------------------+--------------------------------------------------------------------------------------------+
| ``SLAPCAT_BIN``            | slapcat binary path                                                                        |
+----------------------------+--------------------------------------------------------------------------------------------+
| ``SLAPCAT_PARAMS``         | slapcat extra options                                                                      |
+----------------------------+--------------------------------------------------------------------------------------------+
| ``SLAPINDEX_BIN``          | slapindex binary path                                                                      |
+----------------------------+--------------------------------------------------------------------------------------------+
| ``SLAPTEST_BIN``           | slaptest binary path                                                                       |
+----------------------------+--------------------------------------------------------------------------------------------+
| ``LDAPSEARCH_BIN``         | ldapsearch binary path                                                                     |
+----------------------------+--------------------------------------------------------------------------------------------+

Following parameters are about other options for slapd launch:

+--------------------------------+--------------------------------------------------------------------------------------------+
| Parameter                      | Description                                                                                |
+================================+============================================================================================+
| ``SLAPD_USER``                 | Owner user of slapd process                                                                |
+--------------------------------+--------------------------------------------------------------------------------------------+
| ``SLAPD_GROUP``                | Owner group of slapd process                                                               |
+--------------------------------+--------------------------------------------------------------------------------------------+
| ``SLAPD_SYSLOG_LOCAL_USER``    | Syslog local user (by default ``local4``)                                                  |
+--------------------------------+--------------------------------------------------------------------------------------------+
| ``TIMEOUT``                    | Maximum delay waiting for slapd to stop. After, you need to use the ``forcestop`` action   |
+--------------------------------+--------------------------------------------------------------------------------------------+
| ``FD_LIMIT``                   | Maximum opened file descriptors                                                            |
+--------------------------------+--------------------------------------------------------------------------------------------+
| ``DEBUG_LEVEL``                | OpenLDAP log level to use in debug mode. Default is 256 (stats)                            |
+--------------------------------+--------------------------------------------------------------------------------------------+
| ``SYSTEMD_SERVICE_NAME``       | Name of slapd service in systemd. Default is slapd-ltb.                                    |
+--------------------------------+--------------------------------------------------------------------------------------------+
| ``SYSTEMD_LLOAD_SERVICE_NAME`` | Name of lload service in systemd. Default is lload-ltb.                                    |
+--------------------------------+--------------------------------------------------------------------------------------------+

Following parameters are about backup and restore:

+--------------------------------------+--------------------------------------------------------------------------------------------+
| Parameter                            | Description                                                                                |
+======================================+============================================================================================+
| ``BACKUP_AT_SHUTDOWN``               | Do a backup data when slapd is stopped                                                     |
+--------------------------------------+--------------------------------------------------------------------------------------------+
| ``BACKUP_PATH``                      | Backup folder                                                                              |
+--------------------------------------+--------------------------------------------------------------------------------------------+
| ``BACKUP_SUFFIX``                    | Backup file suffix                                                                         |
+--------------------------------------+--------------------------------------------------------------------------------------------+
| ``BACKUP_COMPRESS_EXT``              | Extension of LDIF compressed file. No compression is done if this is empty                 |
+--------------------------------------+--------------------------------------------------------------------------------------------+
| ``BACKUP_COMPRESS_BIN``              | Binary used to compress LDIF file                                                          |
+--------------------------------------+--------------------------------------------------------------------------------------------+
| ``BACKUP_UNCOMPRESS_BIN``            | Binary used to uncompress LDIF file                                                        |
+--------------------------------------+--------------------------------------------------------------------------------------------+
| ``BACKUP_CONFIG_DELETE_AFTER_DAYS``  | Maximum days to keep a configuration backup file                                           |
+--------------------------------------+--------------------------------------------------------------------------------------------+
| ``BACKUP_DATA_DELETE_AFTER_DAYS``    | Maximum days to keep a data backup file                                                    |
+--------------------------------------+--------------------------------------------------------------------------------------------+
| ``UMASK``                            | command used for running ``umask``                                                         |
+--------------------------------------+--------------------------------------------------------------------------------------------+
| ``MASK``                             | mask used for computing unix permissions while backuping                                   |
+--------------------------------------+--------------------------------------------------------------------------------------------+

Following parameters are about data provisioning:

+----------------------------+----------------------------------------------------------------------------------------------+
| Parameter                  | Description                                                                                  |
+============================+==============================================================================================+
| ``DATA_TEMPLATE_FILE``     | Path to template file used for data provisioning                                             |
+----------------------------+----------------------------------------------------------------------------------------------+
| ``DATA_SUFFIX``            | Suffix used for data provisioning. suffix is going to be replaced in ``DATA_TEMPLATE_FILE``  |
+----------------------------+----------------------------------------------------------------------------------------------+
| ``DATA_ORGANIZATION``      | Organization (``o`` attribute) used for the suffix in ``DATA_TEMPLATE_FILE``                 |
+----------------------------+----------------------------------------------------------------------------------------------+
| ``DATA_SERVICEACCOUNT_DN`` | Distinguished name for a service account.                                                    |
+----------------------------+----------------------------------------------------------------------------------------------+
| ``DATA_SERVICEACCOUNT_PW`` | Password for the latter service account. Password must be clear-text. It will be hashed      |
+----------------------------+----------------------------------------------------------------------------------------------+
| ``DATA_ADMIN_<USER>_DN``   | | Distinguished name for an admin account. ``<USER>`` must be replaced by any unique string. |
|                            | | You can add any number of admin accounts by choosing as many ``<USER>`` as you want.       |
|                            | | Admins are no different from user account except that they are member of an admin group    |
+----------------------------+----------------------------------------------------------------------------------------------+
| ``DATA_ADMIN_<USER>_PW``   | Password for the latter admin account. Password must be clear-text. It will be hashed        |
+----------------------------+----------------------------------------------------------------------------------------------+
| ``DATA_ADMIN_<USER>_UID``  | ``uid`` attribute value for the admin account                                                |
+----------------------------+----------------------------------------------------------------------------------------------+
| ``DATA_ADMIN_<USER>_SN``   | surname for the admin account                                                                |
+----------------------------+----------------------------------------------------------------------------------------------+
| ``DATA_ADMIN_<USER>_GN``   | givenname for the admin account                                                              |
+----------------------------+----------------------------------------------------------------------------------------------+
| ``DATA_ADMIN_<USER>_MAIL`` | mail for the admin account                                                                   |
+----------------------------+----------------------------------------------------------------------------------------------+
| ``DATA_USER_<USER>_DN``    | | Distinguished name for a user account. ``<USER>`` must be replaced by any unique string.   |
|                            | | You can add any number of user accounts by choosing as many ``<USER>`` as you want.        |
+----------------------------+----------------------------------------------------------------------------------------------+
| ``DATA_USER_<USER>_PW``    | Password for the corresponding user account. Password must be clear-text. It will be hashed  |
+----------------------------+----------------------------------------------------------------------------------------------+
| ``DATA_USER_<USER>_UID``   | ``uid`` attribute value for the user account                                                 |
+----------------------------+----------------------------------------------------------------------------------------------+
| ``DATA_USER_<USER>_SN``    | surname for the user account                                                                 |
+----------------------------+----------------------------------------------------------------------------------------------+
| ``DATA_USER_<USER>_GN``    | givenname for the user account                                                               |
+----------------------------+----------------------------------------------------------------------------------------------+
| ``DATA_USER_<USER>_MAIL``  | mail for the user account                                                                    |
+----------------------------+----------------------------------------------------------------------------------------------+

Following parameters are about configuration provisioning:

+-------------------------------+--------------------------------------------------------------------------------------------+
| Parameter                     | Description                                                                                |
+===============================+============================================================================================+
| ``CONFIG_FLAT_TEMPLATE_FILE`` | Path to the flat slapd.conf template file used for configuration provisioning              |
+-------------------------------+--------------------------------------------------------------------------------------------+
| ``CONFIG_LDIF_TEMPLATE_FILE`` | Path to the ldif template file used for configuration provisioning                         |
+-------------------------------+--------------------------------------------------------------------------------------------+
| ``CONFIG_SUFFIX``             | Main data base suffix                                                                      |
+-------------------------------+--------------------------------------------------------------------------------------------+
| ``CONFIG_FQDN``               | Full-qualified domain name of the machine hosting slapd (used for ``olcSaslHost``)         |
+-------------------------------+--------------------------------------------------------------------------------------------+
| ``CONFIG_LOGLEVEL``           | Log level, see OpenLDAP ``olcLogLevel`` directive                                          |
+-------------------------------+--------------------------------------------------------------------------------------------+
| ``CONFIG_LOGFILE``            | path of the log file, see OpenLDAP ``olcLogFile`` directive                                |
+-------------------------------+--------------------------------------------------------------------------------------------+
| ``CONFIG_MANAGERROOTDN``      | Distinguished name for the main data base superadmin                                       |
+-------------------------------+--------------------------------------------------------------------------------------------+
| ``CONFIG_MANAGERROOTPW``      | Password for the main data base superadmin. Password must be clear-text. It will be hashed |
+-------------------------------+--------------------------------------------------------------------------------------------+
| ``CONFIG_CONFIGROOTDN``       | Distinguished name for cn=config superadmin                                                |
+-------------------------------+--------------------------------------------------------------------------------------------+
| ``CONFIG_CONFIGROOTPW``       | Password for the cn=config superadmin. Password must be clear-text. It will be hashed      |
+-------------------------------+--------------------------------------------------------------------------------------------+
| ``CONFIG_MONITORROOTDN``      | Distinguished name for cn=monitor superadmin                                               |
+-------------------------------+--------------------------------------------------------------------------------------------+
| ``CONFIG_MONITORROOTPW``      | Password for the cn=monitor superadmin. Password must be clear-text. It will be hashed     |
+-------------------------------+--------------------------------------------------------------------------------------------+
| ``CONFIG_DATADIR``            | Path to the main data base folder                                                          |
+-------------------------------+--------------------------------------------------------------------------------------------+

Following parameters are about load balancer:

+----------------------------+--------------------------------------------------------------------------------------------+
| Parameter                  | Description                                                                                |
+============================+============================================================================================+
| ``LLOAD_IP``               | Listen address for LDAP requests. Meta character ``*`` can be used for all interfaces      |
+----------------------------+--------------------------------------------------------------------------------------------+
| ``LLOAD_PORT``             | Listen port for LDAP requests. Use ``LLOAD_SERVICES`` if you need several ports            |
+----------------------------+--------------------------------------------------------------------------------------------+
| ``LLOAD_SSLIP``            | Listen address for LDAPS requests. Meta character * can be used for all interfaces         |
+----------------------------+--------------------------------------------------------------------------------------------+
| ``LLOAD_SSLPORT``          | Listen port for LDAPS requests. Use ``LLOAD_SERVICES`` if you need several ports           |
+----------------------------+--------------------------------------------------------------------------------------------+
| ``LLOAD_SOCKETURL``        | socket URL for load balancer (URL encoded value)                                           |
+----------------------------+--------------------------------------------------------------------------------------------+
| ``LLOAD_SERVICES``         | | list of listen LDAP URIs, space-separated. It is made of all previous variables.         |
|                            | | This parameter is corresponding to ``-h`` option in slapd launch command.                |
+----------------------------+--------------------------------------------------------------------------------------------+
| ``LLOAD_PID_FILE``         | Path to the pid file. It must match the olcPidFile configuration parameter                 |
+----------------------------+--------------------------------------------------------------------------------------------+
| ``LLOAD_CONF``             | Path to the flat lload.conf configuration file                                             |
+----------------------------+--------------------------------------------------------------------------------------------+
| ``LLOAD_CONF_DIR``         | Path to the slapd.d lload conf folder. When defined, ``LLOAD_CONF`` won't be used anymore  |
+----------------------------+--------------------------------------------------------------------------------------------+


Run several OpenLDAP instances
==============================

You can run several OpenLDAP daemons on the same server.

Choose an instance name. 

Link slapd-cli command: (replace <instance> by your instance name)

.. code-block:: console

    # ln -s /usr/local/openldap/sbin/slapd-cli /usr/local/openldap/sbin/slapd-<instance>-cli

Copy slapd-cli configuration file: (replace <instance> by your instance name)

.. code-block:: console

   # cp /usr/local/openldap/etc/openldap/slapd-cli.conf /usr/local/openldap/etc/openldap/slapd-<instance>-cli.conf

Edit new ``slapd-<instance>-cli.conf`` and change at least the following parameters:

* ``PORT`` and ``SSLPORT``
* ``SLAPD_PID_FILE`` must be changed to: ``/usr/local/openldap/var/run/slapd-<instance>.pid``. Take care to also change the PID file into OpenLDAP configuration (parameter olcPidFile)
* ``SLAPD_CONF_DIR`` or ``SLAPD_CONF`` to a specific configuration directory or file. Typically, for a directory: ``SLAPD_CONF_DIR="/usr/local/openldap/etc/openldap/slapd.d-<instance>"``
* ``SYSTEMD_SERVICE_NAME`` to ``slapd-<instance>-ltb`` (and optionnally ``SYSTEMD_LLOAD_SERVICE_NAME`` to ``lload-<instance>-ltb``)
* ``BACKUP_PATH`` to a dedicated backup directory: ``/var/backups/openldap-<instance>``


Run the openldap instance with: (replace <instance> by your instance name)

.. code-block:: console

   # systemctl start slapd-ltb@<instance>.service


You can also use the cli for running any command on the new instance:

.. code-block:: console

   # slapd-instance-cli backupconfig
   slapd-instance-cli: [INFO] Using /usr/local/openldap/etc/openldap/slapd-instance-cli.conf for configuration
   slapd-instance-cli: [INFO] Launching OpenLDAP configuration backup...
   slapd-instance-cli: [OK] Configuration saved in /var/backups/openldap-instance/config-20240523174022.ldif

