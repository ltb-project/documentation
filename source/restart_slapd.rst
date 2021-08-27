====================================================
Restart OpenLDAP event handler [LDAP Tool Box (LTB)]
====================================================

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
            `Documentation <../../documentation>`__ » `nagios-plugins`_
            » `Restart OpenLDAP event handler`_

         --------------

      documentation:nagios-plugins:restart_slapd

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

                              `Configuration`_

                        -  

                           .. container:: li

                              `Download <restart_slapd#download>`__

                        -  

                           .. container:: li

                              `Installation`_

               .. rubric:: Restart OpenLDAP event handler
                  :name: restart_openldap_event_handler
                  :class: sectionedit1

               .. container:: level1

               .. rubric:: Presentation
                  :name: presentation
                  :class: sectionedit2

               .. container:: level2

                  The script ``restart_slapd.sh`` is an `event handler
                  designed for Nagios`_.

                  It restart OpenLDAP if the service is CRITICAL in HARD
                  state. OpenLDAP is killed with force if a normal kill
                  takes too much time.

                  **Warning**: this script requires root privileges,
                  because it uses the kill command. You have to run
                  Nagios as root or set a SUID bit on the script.

               .. rubric:: Configuration
                  :name: configuration
                  :class: sectionedit3

               .. container:: level2

                  Edit the scrpt to set these parameters:

                  -  

                     .. container:: li

                        SLAPD_PID_FILE: File where OpenLDAP stores its
                        PID

                  -  

                     .. container:: li

                        SLAPD_START_CMD: How OpenLDAP is startes

                  -  

                     .. container:: li

                        TIMEOUT: time to wait before doing a kill -KILL

               .. rubric:: Download
                  :name: download
                  :class: sectionedit4

               .. container:: level2

                  This plugin, along with all other Nagios plugins from
                  this site, can be `downloaded`_ in a single archive.

               .. rubric:: Installation
                  :name: installation
                  :class: sectionedit5

               .. container:: level2

                  Copy the script with other Nagios eventhandlers, for
                  example in /usr/local/nagios/libexec/eventhandlers/:

                  .. code:: code

                     # cp restart_slapd.sh /usr/local/nagios/libexec/eventhandlers/
                     # chmod +x /usr/local/nagios/libexec/eventhandlers/restart_slapd.sh

                  Edit Nagios commands file and add:

                  .. code:: file

                     define command{
                         command_name    restart_slapd
                         command_line    /usr/local/nagios/libexec/eventhandlers/restart_slapd.sh  $SERVICESTATE$ $SERVICESTATETYPE$ $SERVICEATTEMPT$
                         }

                  Add the event handkler to an LDAP check service:

                  .. code:: file

                     define service{
                         host_name           somehost
                         service_description     LDAP
                         max_check_attempts      4
                         event_handler           restart_slapd
                         ...other service variables...
                         }

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

.. _Home: ../../start
.. _Documentation: ../../documentation
.. _Download: ../../download
.. _Community: ../../community
.. _Login: restart_slapd?do=login&sectok=39fb3f9b54a1ecdb3c46340f395d6940
.. _Welcome on LDAP Tool Box project: ../../start
.. _nagios-plugins: https://ltb-project.org/documentation/nagios-plugins/start
.. _Restart OpenLDAP event handler: restart_slapd
.. _Presentation: restart_slapd#presentation
.. _Configuration: restart_slapd#configuration
.. _Installation: restart_slapd#installation
.. _event handler designed for Nagios: http://nagios.sourceforge.net/docs/2_0/eventhandlers.html#example
.. _downloaded: ../../download#monitoring
.. _: javascript:void(0)
.. _CC Attribution-Noncommercial-Share Alike 3.0 Unported: http://creativecommons.org/licenses/by-nc-sa/3.0/

.. |LDAP Tool Box (LTB)| image:: ../../_media/wiki/logo.png
   :class: pull-left
   :name: dw__logo
   :width: 32px
   :height: 32px
   :target: ../../start
.. |image1| image:: ../../lib/exe/indexer.php?id=documentation:nagios-plugins:restart_slapd&1630081866
   :width: 2px
   :height: 1px
