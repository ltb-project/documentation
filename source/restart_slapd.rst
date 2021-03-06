******************************
Restart OpenLDAP event handler
******************************

Presentation
============

The script ``restart_slapd.sh`` is an `event handler designed for Nagios <https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/3/en/eventhandlers.html>`_.

It restart OpenLDAP if the service is CRITICAL in HARD state. OpenLDAP is killed with force if a normal kill takes too much time.

.. WARNING::
   This script requires root privileges, because it uses the kill command. You have to run Nagios as root or set a SUID bit on the script.

Configuration
=============

Edit the script to set these parameters:

    * ``SLAPD_PID_FILE``: File where OpenLDAP stores its PID
    * ``SLAPD_START_CMD``: How OpenLDAP is started
    * ``TIMEOUT``: time to wait before doing a kill -KILL

.. include:: download-plugins.rst

Installation
============

Copy the script with other Nagios eventhandlers, for example in ``/usr/local/nagios/libexec/eventhandlers/``:

.. code-block:: console

   # cp restart_slapd.sh /usr/local/nagios/libexec/eventhandlers/
   # chmod +x /usr/local/nagios/libexec/eventhandlers/restart_slapd.sh

Edit Nagios commands file and add::

    define command{
        command_name    restart_slapd
        command_line    /usr/local/nagios/libexec/eventhandlers/restart_slapd.sh  $SERVICESTATE$ $SERVICESTATETYPE$ $SERVICEATTEMPT$
    }


Add the event handler to an LDAP check service::

    define service{
        host_name                somehost
        service_description      LDAP
        max_check_attempts       4
        event_handler            restart_slapd
        ...other service variables...
    }


