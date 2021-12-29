.. documentation-ltb documentation master file, created by
   sphinx-quickstart on Fri Aug 27 19:12:12 2021.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.


LDAP Tool Box project documentation
===================================


.. image:: images/ltb-project-long.png
   :alt: LTB logo
   :align: center

Presentation
------------

LTB (LDAP Tool Box) project is a set of tools around LDAP. It is made of:

* :doc:`OpenLDAP packages and overlays <openldap-packages>` 
* documentation for OpenLDAP and overlays packages
* Plugins for monitoring and statistics
* web applications: Self service password, white pages and service desk
* LDAP Howtos



Install OpenLDAP LTB
--------------------

.. toctree::
   :maxdepth: 1

   openldap-rpm
   openldap-deb


Manage OpenLDAP LTB
-------------------

.. toctree::
   :maxdepth: 1

   slapd-cli


Monitor your directory
----------------------

You can use the following Nagios plugins to monitor your directory:

.. toctree::
   :maxdepth: 1

   check_ldap_dn
   check_ldap_time
   check_ldap_syncrepl_status
   check_ldap_query
   check_ldap_monitor
   check_ldap_monitor_389ds
   check_lmdb_usage
   restart_slapd


General LDAP Howtos
-------------------

.. toctree::
   :maxdepth: 1

   auth_ldap_best_practices
   active_directory_certificates
   sasl_delegation
   migrate_slapd_conf_cn_config
   openldap_ssl_tls_mutual_authentication


OpenLDAP overlays and extensions
--------------------------------

.. toctree::
   :maxdepth: 1

   openldap-ppm
   openldap-noopsrch


Web applications
----------------

.. toctree::
   :maxdepth: 1

   self-service-password
   white-pages
   service-desk

Statistics with Cacti
---------------------

.. toctree::
   :maxdepth: 1

   ldap_response_time
   openldap_operations


LDAP scripts
------------

.. toctree::
   :maxdepth: 1

   checkldappwdexpiration
   cleanldapbrokenaliases
   file2ldif
   ldap-stats


.. raw:: html

   <!--
   Hook for all files to be virtually included in a toctree

.. toctree::
   :maxdepth: 1

   openldap-packages


.. raw:: html

   -->

