.. documentation-ltb documentation master file, created by
   sphinx-quickstart on Fri Aug 27 19:12:12 2021.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.


LDAP Tool Box project documentation
===================================


.. image:: images/ltb-project-long.png
   :alt: LTB logo
   :align: center
   :target: https://www.ltb-project.org

Presentation
------------

`LTB (LDAP Tool Box) project <https://www.ltb-project.org>`_ is a set of tools around LDAP. It is made of:

* OpenLDAP packages and overlays
* Plugins for monitoring and statistics
* Web applications: Self Service Password, White Pages and Service Desk
* LDAP scripts
* LDAP Howtos


.. toctree::
   :caption: OpenLDAP LTB
   :maxdepth: 1

   openldap-packages
   openldap-rpm
   openldap-deb
   slapd-cli
   ansible-role


.. toctree::
   :caption: Monitoring
   :maxdepth: 1

   check_ldap_dn
   check_ldap_time
   check_ldap_syncrepl_status
   check_ldap_query
   check_ldap_monitor
   check_ldap_monitor_389ds
   check_lmdb_usage
   restart_slapd
   ldap_response_time
   openldap_operations


.. toctree::
   :caption: LDAP Howtos
   :maxdepth: 1

   auth_ldap_best_practices
   active_directory_certificates
   sasl_delegation
   remoteauth_delegation
   migrate_slapd_conf_cn_config
   openldap_ssl_tls_mutual_authentication
   migrate_openldap_ltb_24_openldap_ltb_25
   haproxy_openldap_proxy_protocol
   meta_directory_rwm_overlay


.. toctree::
   :caption: OpenLDAP overlays and extensions
   :maxdepth: 1

   openldap-ppm
   openldap-noopsrch


.. toctree::
   :caption: Web applications
   :maxdepth: 1

   self-service-password
   white-pages
   service-desk


.. toctree::
   :caption: LDAP scripts
   :maxdepth: 1

   checkldappwdexpiration
   cleanldapbrokenaliases
   file2ldif
   ldap-stats
