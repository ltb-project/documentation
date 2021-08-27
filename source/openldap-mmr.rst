========================================
OpenLDAP MMR Tools [LDAP Tool Box (LTB)]
========================================

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
            `Documentation <../documentation>`__ » `OpenLDAP MMR Tools`_

         --------------

      documentation:openldap-mmr

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

                              `Installation`_

                        -  

                           .. container:: li

                              `Configuration`_

                        -  

                           .. container:: li

                              `Usage`_

                           -  

                              .. container:: li

                                 `Initialize the first provider`_

                           -  

                              .. container:: li

                                 `Initialize other provider(s) (called
                                 nodes)`_

                        -  

                           .. container:: li

                              `Recommandations`_

                           -  

                              .. container:: li

                                 `Adapt Openldap settings`_

               .. rubric:: OpenLDAP MMR Tools
                  :name: openldap_mmr_tools
                  :class: sectionedit1

               .. container:: level1

               .. rubric:: Presentation
                  :name: presentation
                  :class: sectionedit2

               .. container:: level2

                  This tools are designed to help system administrator
                  to deploy a multimaster cluster with OpenLDAP 2.4.

               .. rubric:: Installation
                  :name: installation
                  :class: sectionedit3

               .. container:: level2

               .. rubric:: Configuration
                  :name: configuration
                  :class: sectionedit4

               .. container:: level2

                  Edit the configuration file (openldap-mmr.conf), to
                  fit your installation.

                  .. container:: table sectionedit5

                     +------------------------+--------------------------------------------+
                     | *Parameter*            | *Description*                              |
                     +------------------------+--------------------------------------------+
                     | LDAP_MIGRATE_IP        | OpenLDAP 2.3 server to migrate data from   |
                     +------------------------+--------------------------------------------+
                     | LDAP_MIGRATE_TLS       | Is migration replication link use TLS or   |
                     |                        | not                                        |
                     +------------------------+--------------------------------------------+
                     | LDAP_PROVIDER_IP       | Main default provider IP                   |
                     +------------------------+--------------------------------------------+
                     | LDAP_USERNAME          | System user which own OpenLDAP database    |
                     |                        | and configuration files                    |
                     +------------------------+--------------------------------------------+
                     | LDAP_GROUPNAME         | System group which own OpenLDAP database   |
                     |                        | and configuration files                    |
                     +------------------------+--------------------------------------------+
                     | LDAP_TLS               | Use TLS                                    |
                     +------------------------+--------------------------------------------+
                     | LDAP_TLS_REQCERT       | Verify certificate                         |
                     +------------------------+--------------------------------------------+
                     | OPENLDAP_INSTALL_DIR   | Where OpenLDAP is installed                |
                     +------------------------+--------------------------------------------+
                     | OPENLDAP_DATA_DIR      | Main OpenLDAP database directory           |
                     +------------------------+--------------------------------------------+
                     | OPENLDAP_DBLOG_DIR     | Main BerkeleyDB log directory              |
                     +------------------------+--------------------------------------------+
                     | OPENLDAP_PASSWD_SCHEME | Scheme to hash generated passwords         |
                     +------------------------+--------------------------------------------+
                     | BOOTSTRAP_PROVIDER     | Bootstrap file for first provider          |
                     +------------------------+--------------------------------------------+
                     | BOOTSTRAP_NODE         | Bootstrap file for nodes                   |
                     +------------------------+--------------------------------------------+

                  Then, take care of a few needs, such as the following:

                  -  

                     .. container:: li

                        Create all missing directories on the system;

                  -  

                     .. container:: li

                        Allowed directories should be own by appropriate
                        user/group.

               .. rubric:: Usage
                  :name: usage
                  :class: sectionedit6

               .. container:: level2

               .. rubric:: Initialize the first provider
                  :name: initialize_the_first_provider
                  :class: sectionedit7

               .. container:: level3

                  Then, choose a server. It will be used as the first
                  provider. Type the following command, and follow
                  instructions:

                  .. code:: code

                     ./mmr-initprov

                  It will ask you:

                  -  

                     .. container:: li

                        The local IP to use for this first provider;

                  -  

                     .. container:: li

                        The new password for the cn=config backend.

                  Once you have answer to all questions, it will:

                  -  

                     .. container:: li

                        Create a boostrap file for your provider
                        installation;

                  -  

                     .. container:: li

                        Replace all variables into this bootstrap file;

                  -  

                     .. container:: li

                        Create the slapd.d directory, which will store
                        files for cn=config;

                  -  

                     .. container:: li

                        Fixe rights on few directories (databases,
                        etc.).

               .. rubric:: Initialize other provider(s) (called nodes)
                  :name: initialize_other_provider_s_called_nodes
                  :class: sectionedit8

               .. container:: level3

                  On a provider (not the first one), type the following
                  command, and follow instructions:

                  .. code:: code

                     ./mmr-addnode

                  It will ask you:

                  -  

                     .. container:: li

                        The local IP to use for this new node;

                  -  

                     .. container:: li

                        The remote IP to use to connect to the first
                        provider;

                  -  

                     .. container:: li

                        The password for the cn=config backend;

                  -  

                     .. container:: li

                        The serverID for this node (automatically
                        calculated from the provider).

                  Once you have answer to all questions, it will:

                  -  

                     .. container:: li

                        Create a simple boostrap file for your node
                        installation;

                  -  

                     .. container:: li

                        Replace all variables into this bootstrap file;

                  -  

                     .. container:: li

                        Create the slapd.d directory, which will store
                        files for cn=config;

                  -  

                     .. container:: li

                        Fixe rights on few directories (databases,
                        etc.).

                  When you will run your Openldap server, replication
                  should work and all configuration should be
                  synchronized. I recommand you to stop your Openldap
                  server one time, and restarting it, to make databases
                  replications work.

               .. rubric:: Recommandations
                  :name: recommandations
                  :class: sectionedit9

               .. container:: level2

               .. rubric:: Adapt Openldap settings
                  :name: adapt_openldap_settings
                  :class: sectionedit10

               .. container:: level3

                  Once all of the above command was successfully
                  executed, adapt settings of Openldap, so that it will
                  use the new configuration directory, instead of the
                  classical configuration file.

                  If you use ltb RPM packages, you could modify the
                  SLAPD_CONF_DIR parameter into the /etc/default/slapd
                  file. For example:

                  .. code:: code

                     #SLAPD_CONF="$SLAPD_PATH/etc/openldap/slapd.conf"
                     SLAPD_CONF_DIR="$SLAPD_PATH/etc/openldap/slapd.d"

                  You should also fix IP into each server configuration,
                  in /etc/default/slapd too (simple and SSL).

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
.. _Login: openldap-mmr?do=login&sectok=39fb3f9b54a1ecdb3c46340f395d6940
.. _Welcome on LDAP Tool Box project: ../start
.. _OpenLDAP MMR Tools: openldap-mmr
.. _Presentation: openldap-mmr#presentation
.. _Installation: openldap-mmr#installation
.. _Configuration: openldap-mmr#configuration
.. _Usage: openldap-mmr#usage
.. _Initialize the first provider: openldap-mmr#initialize_the_first_provider
.. _Initialize other provider(s) (called nodes): openldap-mmr#initialize_other_provider_s_called_nodes
.. _Recommandations: openldap-mmr#recommandations
.. _Adapt Openldap settings: openldap-mmr#adapt_openldap_settings
.. _: javascript:void(0)
.. _CC Attribution-Noncommercial-Share Alike 3.0 Unported: http://creativecommons.org/licenses/by-nc-sa/3.0/

.. |LDAP Tool Box (LTB)| image:: ../_media/wiki/logo.png
   :class: pull-left
   :name: dw__logo
   :width: 32px
   :height: 32px
   :target: ../start
.. |image1| image:: ../lib/exe/indexer.php?id=documentation:openldap-mmr&1630081866
   :width: 2px
   :height: 1px
