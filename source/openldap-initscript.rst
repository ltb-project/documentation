==================================================
OpenLDAP init script and CLI [LDAP Tool Box (LTB)]
==================================================

.. container::
   :name: dokuwiki__site

   .. container:: site dokuwiki mode_show tpl_bootstrap3
      :name: dokuwiki__top

      .. container::
         :name: dokuwiki__header

         .. container:: container-fluid

            .. container:: navbar-header

               |LDAP Tool Box (LTB)|

            .. container:: collapse navbar-collapse

               -  `Home`_
               -  `Documentation`_
               -  `Download`_
               -  `Community`_

               .. container:: navbar-right

                  .. container:: no

                     .. container:: ajax_qsearch JSpopup
                        :name: qsearch__out

                  -  `Login`_

      .. container::
         :name: dw__breadcrumbs

         --------------

         .. container:: breadcrumb

            You are here:\ `Welcome on LDAP Tool Box project`_ »
            `Documentation <../documentation>`__ » `OpenLDAP init script
            and CLI`_

         --------------

      documentation:openldap-initscript

      .. container::
         :name: dw__msgarea

      .. container:: main row

         .. container:: panel panel-default

            .. container:: page group panel-body

               .. container:: pull-right hidden-print

                  .. container::
                     :name: dw__toc

                     .. rubric:: Table of Contents
                        :name: table-of-contents
                        :class: toggle

                     .. container::

                        -  

                           .. container:: li

                              `Presentation`_

                        -  

                           .. container:: li

                              `Usage of CLI`_

                        -  

                           .. container:: li

                              `Installation of CLI`_

                        -  

                           .. container:: li

                              `Configuration of CLI`_

                        -  

                           .. container:: li

                              `Startup script`_

                           -  

                              .. container:: li

                                 `initd script`_

                           -  

                              .. container:: li

                                 `systemd script`_

                        -  

                           .. container:: li

                              `Run several OpenLDAP instances`_

                           -  

                              .. container:: li

                                 `initd
                                 script <openldap-initscript#initd_script1>`__

                           -  

                              .. container:: li

                                 `systemd
                                 script <openldap-initscript#systemd_script1>`__

               .. rubric:: OpenLDAP init script and CLI
                  :name: openldap_init_script_and_cli
                  :class: sectionedit1

               .. container:: level1

               .. rubric:: Presentation
                  :name: presentation
                  :class: sectionedit2

               .. container:: level2

                  The script ``slapd-cli`` provide start, stop and other
                  commands for OpenLDAP daemon. It requires:

                  -  

                     .. container:: li

                        Logger, to forward messages to syslog

                  -  

                     .. container:: li

                        Awk, for regular expression management

                  -  

                     .. container:: li

                        BerkeleyDB, for recover and archive tools

                  -  

                     .. container:: li

                        OpenLDAP, for save, index, … tools

                  Configuration of this script can be done in an
                  external file, with the same name as the slapd-cli
                  script in ``/usr/local/openldap/etc/openldap``.

                  A backup feature allows to save all data or
                  configuration in an LDIF file, compressed or not. The
                  restore feature import the last backup in the
                  directory.

                  .. container:: notetip

                     This script is included in `LTB OpenLDAP RPMS`_ and
                     `LTB OpenLDAP DEBS`_

               .. rubric:: Usage of CLI
                  :name: usage_of_cli
                  :class: sectionedit3

               .. container:: level2

                  Run the script like that:

                  .. code:: code

                     # /usr/local/openldap/sbin/slapd-cli <action>

                  With action in:

                  -  

                     .. container:: li

                        ``start``:

                     -  

                        .. container:: li

                           Test configuration

                     -  

                        .. container:: li

                           Start slurpd if needed

                     -  

                        .. container:: li

                           Start slapd with data recover if needed

                  -  

                     .. container:: li

                        ``stop``:

                     -  

                        .. container:: li

                           Stop ``slapd`` and save data if needed

                     -  

                        .. container:: li

                           Stop ``slurpd`` if needed

                  -  

                     .. container:: li

                        ``forcestop``:

                     -  

                        .. container:: li

                           If script can read PID, do a
                           ``kill -KILL PID``

                     -  

                        .. container:: li

                           Else ``killall -KILL`` on binaries name

                  -  

                     .. container:: li

                        ``restart``:

                     -  

                        .. container:: li

                           Launch ``stop``

                     -  

                        .. container:: li

                           Launch ``start``

                  -  

                     .. container:: li

                        ``force-reload``:

                     -  

                        .. container:: li

                           Force stop

                     -  

                        .. container:: li

                           Config test

                     -  

                        .. container:: li

                           Start

                  -  

                     .. container:: li

                        ``configtest``: test configuration

                  -  

                     .. container:: li

                        ``db_recover``: data recover (slapd must be
                        stopped)

                  -  

                     .. container:: li

                        ``reindex``: data index (slapd must be stopped)

                  -  

                     .. container:: li

                        ``removelogs``: archive old BerkeleyDB logs
                        (slapd must be stopped)

                  -  

                     .. container:: li

                        ``backup``: LDIF export of all data

                  -  

                     .. container:: li

                        ``restore``: Remove current data and restore
                        last backup

                  -  

                     .. container:: li

                        ``backupconfig``: LDIF export of configuration
                        or copy of slapd.conf

                  -  

                     .. container:: li

                        ``restoreconfig``: Remove current configuration
                        and restore last backup

                  -  

                     .. container:: li

                        ``status``: Display running status and naming
                        contexts

                  -  

                     .. container:: li

                        ``debug``: Stop OpenLDAP and restart it in debug
                        mode (level can be configured), with output on
                        the console

                  -  

                     .. container:: li

                        ``checksync``: Try to find configured providers
                        and check synchronization status

               .. rubric:: Installation of CLI
                  :name: installation_of_cli
                  :class: sectionedit4

               .. container:: level2

                  Copy script in ``/usr/local/openldap/sbin``:

                  .. code:: code

                     # mv slapd-cli /usr/local/openldap/sbin
                     # chmod +x /usr/local/openldap/sbin/slapd

                  Configuration file must be installed in
                  ``/usr/local/openldap/etc/openldap``:

                  .. code:: code

                     # mkdir -p /usr/local/openldap/etc/openldap
                     # mv slapd-cli.conf /usr/local/openldap/etc/openldap
                     # chmod 600 /usr/local/openldap/etc/openldap/slapd-cli.conf

               .. rubric:: Configuration of CLI
                  :name: configuration_of_cli
                  :class: sectionedit5

               .. container:: level2

                  Use the external file in
                  ``/usr/local/openldap/etc/openldap`` rather than
                  editing directly the script.

                  -  

                     .. container:: li

                        Following parameters are mandatory:

                  .. container:: table sectionedit6

                     +------------------------+--------------------------------------------+
                     | *Parameter*            | *Description*                              |
                     +------------------------+--------------------------------------------+
                     | ``IP``                 | Listen address for standard LDAP requests. |
                     |                        | Meta character ``*`` can be used for all   |
                     |                        | interfaces                                 |
                     +------------------------+--------------------------------------------+
                     | ``PORT``               | Listen port for standard LDAP requests.    |
                     |                        | Use ``SLAPD_SERVICES`` if you need several |
                     |                        | ports                                      |
                     +------------------------+--------------------------------------------+
                     | ``SSLIP``              | Listen address for LDAPS requests. Meta    |
                     |                        | character ``*`` can be used for all        |
                     |                        | interfaces                                 |
                     +------------------------+--------------------------------------------+
                     | ``LDAPI_SOCKETDIR``    | Directory where LDAPI socket is created    |
                     |                        | (will be created if it does not exist)     |
                     +------------------------+--------------------------------------------+
                     | ``LDAPI_SOCKETURL``    | LDAPI socket URL (URL encoded value)       |
                     +------------------------+--------------------------------------------+
                     | -                      |                                            |
                     +------------------------+--------------------------------------------+
                     | ``SLAPD_PATH``         | OpenLDAP main directory                    |
                     +------------------------+--------------------------------------------+
                     | ``DATA_PATH``          | Data directory. You can set ``auto`` to    |
                     |                        | get directories configured in              |
                     |                        | ``slapd.conf``                             |
                     +------------------------+--------------------------------------------+
                     | ``SLAPD_PID_FILE``     | The ``pidfile`` parameter of               |
                     |                        | ``slapd.conf``                             |
                     +------------------------+--------------------------------------------+
                     | ``SLAPD_CONF``         | Main configuration file                    |
                     +------------------------+--------------------------------------------+
                     | ``SLAPD_SERVICES``     | Listen URI LDAP list, separated by spaces  |
                     +------------------------+--------------------------------------------+
                     | ``SLAPD_BIN``          | ``slapd`` binary path                      |
                     +------------------------+--------------------------------------------+
                     | -                      |                                            |
                     +------------------------+--------------------------------------------+
                     | ``SLAPADD_BIN``        | ``slapadd`` binary path                    |
                     +------------------------+--------------------------------------------+
                     | ``SLAPCAT_BIN``        | ``slapcat`` binary path                    |
                     +------------------------+--------------------------------------------+
                     | ``SLAPINDEX_BIN``      | ``slapindex`` binary path                  |
                     +------------------------+--------------------------------------------+
                     | ``SLAPTEST_BIN``       | ``slaptest`` binary path                   |
                     +------------------------+--------------------------------------------+
                     | -                      |                                            |
                     +------------------------+--------------------------------------------+
                     | ``SLURPD_PID_FILE``    | The ``replica-pidfile`` parameter of       |
                     |                        | ``slapd.conf``                             |
                     +------------------------+--------------------------------------------+
                     | ``SLURPD_BIN``         | ``slurpd`` binary path                     |
                     +------------------------+--------------------------------------------+
                     | -                      |                                            |
                     +------------------------+--------------------------------------------+
                     | ``BDB_PATH``           | BerkeleyDB main directory                  |
                     +------------------------+--------------------------------------------+
                     | ``DB_ARCHIVE_BIN``     | ``db_archive`` binary path                 |
                     +------------------------+--------------------------------------------+
                     | ``DB_RECOVER_BIN``     | ``db_recover`` binary path                 |
                     +------------------------+--------------------------------------------+
                     | ``RECOVER_AT_STARTUP`` | Force data recover on startup. Should not  |
                     |                        | be used for OpenLDAP > 2.2                 |
                     +------------------------+--------------------------------------------+
                     | -                      |                                            |
                     +------------------------+--------------------------------------------+
                     | ``BACKUP_AT_SHUTDOWN`` | Backup data when slapd is stopped          |
                     +------------------------+--------------------------------------------+
                     | ``BACKUP_PATH``        | Backup directory                           |
                     +------------------------+--------------------------------------------+
                     | ``BACKUP_SUFFIX``      | Backup file suffix                         |
                     +------------------------+--------------------------------------------+
                     | -                      |                                            |
                     +------------------------+--------------------------------------------+
                     | ``TIMEOUT``            | Stop slapd timeout. After that, you need   |
                     |                        | to use the ``forcestop`` rule              |
                     +------------------------+--------------------------------------------+
                     | ``FD_LIMIT``           | Maximum opened file descriptor             |
                     +------------------------+--------------------------------------------+

                  -  

                     .. container:: li

                        Following parameters are not mandatory (they can
                        contain ``“”``) :

                  .. container:: table sectionedit7

                     +-----------------------------+---------------------------------------+
                     | *Parameter*                 | *Description*                         |
                     +-----------------------------+---------------------------------------+
                     | ``SLAPD_PARAMS``            | Additional options for\ ``slapd``.    |
                     |                             | options ``-h``, ``-f``, ``-u`` et     |
                     |                             | ``-g`` are already managed            |
                     +-----------------------------+---------------------------------------+
                     | ``SLAPD_CONF_DIR``          | Main configuration dir (cancel        |
                     |                             | SLAPD_CONF parameter)                 |
                     +-----------------------------+---------------------------------------+
                     | ``SLAPD_USER``              | Owner user of ``slapd``               |
                     |                             | and\ ``slurpd`` process               |
                     +-----------------------------+---------------------------------------+
                     | ``SLAPD_GROUP``             | Owner group of ``slapd``              |
                     |                             | and\ ``slurpd`` process               |
                     +-----------------------------+---------------------------------------+
                     | ``SLAPD_SYSLOG_LOCAL_USER`` | Syslog local user (by default local4) |
                     +-----------------------------+---------------------------------------+
                     | -                           |                                       |
                     +-----------------------------+---------------------------------------+
                     | ``SLURPD_PARAMS``           | Additional options for ``slurpd``.    |
                     |                             | Option ``-f`` is already managed      |
                     +-----------------------------+---------------------------------------+
                     | -                           |                                       |
                     +-----------------------------+---------------------------------------+
                     | ``BACKUP_COMPRESS_EXT``     | Extension of LDIF compressed file. No |
                     |                             | compression is done if this is empty  |
                     +-----------------------------+---------------------------------------+
                     | ``BACKUP_COMPRESS_BIN``     | Binary used to compress LDIF file     |
                     +-----------------------------+---------------------------------------+
                     | ``BACKUP_UNCOMPRESS_BIN``   | Binary used to uncompress LDIF file   |
                     +-----------------------------+---------------------------------------+
                     | ``DEBUG_LEVEL``             | OpenLDAP log level to use in debug    |
                     |                             | mode. Default is 256 (stats)          |
                     +-----------------------------+---------------------------------------+

               .. rubric:: Startup script
                  :name: startup_script
                  :class: sectionedit8

               .. container:: level2

               .. rubric:: initd script
                  :name: initd_script
                  :class: sectionedit9

               .. container:: level3

                  The ``slapd-cli`` command is used in an initd script.

                  Installation:

                  .. code:: code

                     # cp slapd.init /etc/init.d/slapd
                     # chmod +x /etc/init.d/slapd

                  For RedHat based systems:

                  .. code:: code

                     # chkconfig --add slapd

                  For Debian based systems:

                  .. code:: code

                     # update-rc.d slapd defaults

               .. rubric:: systemd script
                  :name: systemd_script
                  :class: sectionedit10

               .. container:: level3

                  The ``slapd-cli`` command is used in an systemd
                  script.

                  Installation:

                  .. code:: code

                     # cp slapd.service /etc/systemd/system/
                     # systemctl --system daemon-reload
                     # systemctl enable slapd.service

               .. rubric:: Run several OpenLDAP instances
                  :name: run_several_openldap_instances
                  :class: sectionedit11

               .. container:: level2

                  You can run several OpenLDAP daemons on the same
                  server.

               .. rubric:: initd script
                  :name: initd_script1
                  :class: sectionedit12

               .. container:: level3

                  -  

                     .. container:: li

                        Copy initd script:

                  .. code:: code

                     # cp /etc/init.d/slapd /etc/init.d/slapd2

                  -  

                     .. container:: li

                        Change ``CLI_BIN`` value:

                  .. code:: file

                     CLI_BIN="/usr/local/openldap/sbin/slapd2-cli"

                  -  

                     .. container:: li

                        Link ``slapd-cli`` command:

                  .. code:: code

                     # ln -s /usr/local/openldap/sbin/slapd-cli /usr/local/openldap/sbin/slapd2-cli

                  -  

                     .. container:: li

                        Copy and edit ``slapd-cli`` configuration to
                        change at least the ports and PID file:

                  .. code:: code

                     # cp /usr/local/openldap/etc/openldap/slapd-cli.conf /usr/local/openldap/etc/openldap/slapd2-cli.conf

               .. rubric:: systemd script
                  :name: systemd_script1
                  :class: sectionedit13

               .. container:: level3

                  -  

                     .. container:: li

                        Copy systemd script:

                  .. code:: code

                     # cp /etc/systemd/system/slapd.service /etc/systemd/system/slapd2.service

                  -  

                     .. container:: li

                        Change ``PIDFile``, ``ExecStart``,
                        ``ExecRestart``, ``ExecStop`` values:

                  .. code:: file

                     PIDFile=/usr/local/openldap/var/run/slapd2.pid
                     ExecStart=/usr/local/openldap/sbin/slapd2-cli start
                     ExecRestart=/usr/local/openldap/sbin/slapd2-cli restart
                     ExecStop=/usr/local/openldap/sbin/slapd2-cli stop

                  -  

                     .. container:: li

                        Link ``slapd-cli`` command:

                  .. code:: code

                     # ln -s /usr/local/openldap/sbin/slapd-cli /usr/local/openldap/sbin/slapd2-cli

                  -  

                     .. container:: li

                        Copy and edit ``slapd-cli`` configuration to
                        change at least the ports and PID file:

                  .. code:: code

                     # cp /usr/local/openldap/etc/openldap/slapd-cli.conf /usr/local/openldap/etc/openldap/slapd2-cli.conf

      ``_

      .. container:: text-center

         .. container:: license

            Except where otherwise noted, content on this wiki is
            licensed under the following license: `CC
            Attribution-Noncommercial-Share Alike 3.0 Unported`_

   .. container:: no

      |image1|

   .. container:: no
      :name: screen__mode

.. _Home: ../start
.. _Documentation: ../documentation
.. _Download: ../download
.. _Community: ../community
.. _Login: openldap-initscript?do=login&sectok=39fb3f9b54a1ecdb3c46340f395d6940
.. _Welcome on LDAP Tool Box project: ../start
.. _OpenLDAP init script and CLI: openldap-initscript
.. _Presentation: openldap-initscript#presentation
.. _Usage of CLI: openldap-initscript#usage_of_cli
.. _Installation of CLI: openldap-initscript#installation_of_cli
.. _Configuration of CLI: openldap-initscript#configuration_of_cli
.. _Startup script: openldap-initscript#startup_script
.. _initd script: openldap-initscript#initd_script
.. _systemd script: openldap-initscript#systemd_script
.. _Run several OpenLDAP instances: openldap-initscript#run_several_openldap_instances
.. _LTB OpenLDAP RPMS: openldap-rpm
.. _LTB OpenLDAP DEBS: openldap-deb
.. _: javascript:void(0)
.. _CC Attribution-Noncommercial-Share Alike 3.0 Unported: http://creativecommons.org/licenses/by-nc-sa/3.0/

.. |LDAP Tool Box (LTB)| image:: ../_media/wiki/logo.png
   :class: pull-left
   :name: dw__logo
   :width: 32px
   :height: 32px
   :target: ../start
.. |image1| image:: ../lib/exe/indexer.php?id=documentation:openldap-initscript&1630081866
   :width: 2px
   :height: 1px
