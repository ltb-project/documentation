===========================================
Check Syncrepl status [LDAP Tool Box (LTB)]
===========================================

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
            » `Check Syncrepl status`_

         --------------

      documentation:nagios-plugins:check_ldap_syncrepl_status

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

                              `Download <check_ldap_syncrepl_status#download>`__

               .. rubric:: Check Syncrepl status
                  :name: check_syncrepl_status
                  :class: sectionedit1

               .. container:: level1

               .. rubric:: Presentation
                  :name: presentation
                  :class: sectionedit2

               .. container:: level2

                  This Nagios script checks syncrepl status. Syncrepl
                  has replaced slurpd in OpenLDAP for data replication.
                  It should be implemented in other Open Source LDAP
                  directories.

                  No temporary files are used to check the state of the
                  replication, just cookies with timestamps (the
                  *contextCSN* attribute). The script will read the
                  status cookies of the LDAP servers and display if they
                  are in sync or not.

               .. rubric:: Configuration
                  :name: configuration
                  :class: sectionedit3

               .. container:: level2

                  Required Perl modules:

                  -  

                     .. container:: li

                        Getopt::Long

                  -  

                     .. container:: li

                        File::Basename

                  -  

                     .. container:: li

                        POSIX

                  -  

                     .. container:: li

                        Net::LDAP

                  -  

                     .. container:: li

                        Date::Manip

                  -  

                     .. container:: li

                        Time::Piece

               .. rubric:: Usage
                  :name: usage
                  :class: sectionedit4

               .. container:: level2

                  .. code:: code

                     check_ldap_syncrepl_status.pl -H <hostname> [-h] [-v] [-V]

               .. rubric:: Mandatory options
                  :name: mandatory_options
                  :class: sectionedit5

               .. container:: level3

                  -  

                     .. container:: li

                        **-H**: IP, host or LDAP URI of the **slave**
                        server.

                  -  

                     .. container:: li

                        **-w**: lag in seconds to raise a WARNING alert.

                  -  

                     .. container:: li

                        **-c**: lag in seconds to raise a CRITICAL
                        alert.

               .. rubric:: Other options
                  :name: other_options
                  :class: sectionedit6

               .. container:: level3

                  -  

                     .. container:: li

                        **-v**, **-vv**, **-vvv**: debugging level.

                  -  

                     .. container:: li

                        **-V**: print version and exit.

                  -  

                     .. container:: li

                        **-h**: print help and quit.

                  -  

                     .. container:: li

                        **-p**: **slave** server port (not used if LDAP
                        URI in **-H**).

                  -  

                     .. container:: li

                        **-f**: output performance data.

                  -  

                     .. container:: li

                        **-t**: timeout.

                  -  

                     .. container:: li

                        **-D**: DN to connect to **master** and
                        **slave**.

                  -  

                     .. container:: li

                        **-P**: password for connection DN.

                  -  

                     .. container:: li

                        **-U**: LDAP URI of **master** server. If not
                        given, a search is done in cn=monitor.

                  -  

                     .. container:: li

                        **-S**: Suffix of servers (must contains the
                        contextCSN attribute). If not given, a search in
                        RootDSE is done.

                  -  

                     .. container:: li

                        **-I**: server ID (SID), mandatory for mirror
                        mode. Default value: 000.

                  **Remark**: To use SSL/TLS, write ldaps: *or
                  ldap+tls:* in LDAP URI.

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
.. _Login: check_ldap_syncrepl_status?do=login&sectok=39fb3f9b54a1ecdb3c46340f395d6940
.. _Welcome on LDAP Tool Box project: ../../start
.. _nagios-plugins: https://ltb-project.org/documentation/nagios-plugins/start
.. _Check Syncrepl status: check_ldap_syncrepl_status
.. _Presentation: check_ldap_syncrepl_status#presentation
.. _Configuration: check_ldap_syncrepl_status#configuration
.. _Usage: check_ldap_syncrepl_status#usage
.. _Mandatory options: check_ldap_syncrepl_status#mandatory_options
.. _Other options: check_ldap_syncrepl_status#other_options
.. _downloaded: ../../download#monitoring
.. _: javascript:void(0)
.. _CC Attribution-Noncommercial-Share Alike 3.0 Unported: http://creativecommons.org/licenses/by-nc-sa/3.0/

.. |LDAP Tool Box (LTB)| image:: ../../_media/wiki/logo.png
   :class: pull-left
   :name: dw__logo
   :width: 32px
   :height: 32px
   :target: ../../start
.. |image1| image:: ../../lib/exe/indexer.php?id=documentation:nagios-plugins:check_ldap_syncrepl_status&1630081866
   :width: 2px
   :height: 1px
