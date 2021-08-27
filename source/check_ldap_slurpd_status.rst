=========================================
Check slurpd status [LDAP Tool Box (LTB)]
=========================================

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
            » `Check slurpd status`_

         --------------

      documentation:nagios-plugins:check_ldap_slurpd_status

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

                              `Usage`_

                           -  

                              .. container:: li

                                 `Mandatory options`_

                           -  

                              .. container:: li

                                 `Other options`_

                        -  

                           .. container:: li

                              `Download <check_ldap_slurpd_status#download>`__

               .. rubric:: Check slurpd status
                  :name: check_slurpd_status
                  :class: sectionedit1

               .. container:: level1

               .. rubric:: Presentation
                  :name: presentation
                  :class: sectionedit2

               .. container:: level2

                  This Nagios plugin check sluprd (OpenLDAP replication
                  dameon) status. It must be run on the sluprd physical
                  server to access to slurpd files. Use check_by_ssh or
                  NRPE to integrate it in Nagios.

                  Replicated entries can be in four states:

                  -  

                     .. container:: li

                        transition: between slapd and slurpd

                  -  

                     .. container:: li

                        waiting: in slurpd queue

                  -  

                     .. container:: li

                        rejected: not accepted by slave

                  -  

                     .. container:: li

                        propagated: accepted by slave

                  The script will allow to define warning and critical
                  levels for those states.

               .. rubric:: Configuration
                  :name: configuration
                  :class: sectionedit3

               .. container:: level2

                  Required Perl modules:

                  -  

                     .. container:: li

                        Getopt::Std

                  -  

                     .. container:: li

                        List::Util

                  Edit the script to modify some default parameters:

                  -  

                     .. container:: li

                        slurpd_tempdir: Directory where slurpd stores
                        his files (default: /var/openldap-slurp/replica)

                  -  

                     .. container:: li

                        slapd_replog_file: Replog file beetween slapd
                        and slurpd, as written in slapd.conf (default:
                        /var/replog)

               .. rubric:: Usage
                  :name: usage
                  :class: sectionedit4

               .. container:: level2

                  .. code:: code

                     $ perl check_ldap_slurpd_status -w warning_level -c critical_level [-h hostname] [-p hostport] [-v]

               .. rubric:: Mandatory options
                  :name: mandatory_options
                  :class: sectionedit5

               .. container:: level3

                  -  

                     .. container:: li

                        **-w**: warning level

                  -  

                     .. container:: li

                        **-c**: critical level

                  How to set levels:

                  -  

                     .. container:: li

                        The level must be given with 3 integers, for
                        exemple 100,5,30

                  -  

                     .. container:: li

                        The first integer are the entries in transition
                        (not picked up by slurpd)

                  -  

                     .. container:: li

                        The second integer are the rejected entries (not
                        accepted by the slave)

                  -  

                     .. container:: li

                        The third integer are the waiting entries
                        (picked up by slurpd but not sent to the slave)

                  -  

                     .. container:: li

                        If only one integer is given, the level will be
                        the max of all entries (in transition + rejected
                        + waiting)

               .. rubric:: Other options
                  :name: other_options
                  :class: sectionedit6

               .. container:: level3

                  -  

                     .. container:: li

                        **-h**: hostname as it is set in slurpd
                        configuration (default: localhost)

                  -  

                     .. container:: li

                        **-p**: port as it is set in slurpd
                        configuration (default: 0)

                  -  

                     .. container:: li

                        **-v**: verbose mode

               .. rubric:: Download
                  :name: download
                  :class: sectionedit7

               .. container:: level2

                  This plugin, along with all other Nagios plugins from
                  this site, can be `downloaded`_ in a single archive.

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
.. _Login: check_ldap_slurpd_status?do=login&sectok=39fb3f9b54a1ecdb3c46340f395d6940
.. _Welcome on LDAP Tool Box project: ../../start
.. _nagios-plugins: https://ltb-project.org/documentation/nagios-plugins/start
.. _Check slurpd status: check_ldap_slurpd_status
.. _Presentation: check_ldap_slurpd_status#presentation
.. _Configuration: check_ldap_slurpd_status#configuration
.. _Usage: check_ldap_slurpd_status#usage
.. _Mandatory options: check_ldap_slurpd_status#mandatory_options
.. _Other options: check_ldap_slurpd_status#other_options
.. _downloaded: ../../download#monitoring
.. _: javascript:void(0)
.. _CC Attribution-Noncommercial-Share Alike 3.0 Unported: http://creativecommons.org/licenses/by-nc-sa/3.0/

.. |LDAP Tool Box (LTB)| image:: ../../_media/wiki/logo.png
   :class: pull-left
   :name: dw__logo
   :width: 32px
   :height: 32px
   :target: ../../start
.. |image1| image:: ../../lib/exe/indexer.php?id=documentation:nagios-plugins:check_ldap_slurpd_status&1630081866
   :width: 2px
   :height: 1px
