************************
Check LDAP response time
************************

Presentation
============

This Nagios plugin checks the response time of an LDAP directory.

To get a sharper time measure, the script use threads and returns a mean.

Configuration
=============

Required Perl modules:

    * Net::LDAP
    * Getopt::Std
    * Time::HiRes
    * threads

Edit the script to modify some default parameters:

    * version: LDAP version to use (default: 3)

Other parameters are set as script options (see below).

Usage
=====

.. code-block:: console

   $ perl check_ldap_time.pl -H hostname [-p port] [-D binddn -P bindpw] [-n nb_threads] [-w warning_time] [-c critical_time]

Mandatory Options
-----------------

-H     LDAP server hostname or IP, or LDAP URI

Other options
-------------

-p    LDAP server port (not working if LDAP URI is set in -H)
-D    Bind DN
-P    Bind password
-n    threads number (default: 0)
-w    warning time in seconds (default: 20)
-c    critical time in seconds (default: 60)
-f    display performance data
-F    LDAP filter
-b    LDAP base
-s    LDAP scope

Download
========

This plugin, along with all other Nagios plugins from this site, can be `downloaded <https://ltb-project.org/download#monitoring>`_ in a single archive.

