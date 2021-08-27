============================================
Check BerkeleyDB locks [LDAP Tool Box (LTB)]
============================================

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
            » `Check BerkeleyDB locks`_

         --------------

      documentation:nagios-plugins:check_berkeleydb_locks

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

                                 `Mandatory Options`_

                           -  

                              .. container:: li

                                 `Other options`_

                        -  

                           .. container:: li

                              `Download <check_berkeleydb_locks#download>`__

               .. rubric:: Check BerkeleyDB locks
                  :name: check_berkeleydb_locks
                  :class: sectionedit1

               .. container:: level1

               .. rubric:: Presentation
                  :name: presentation
                  :class: sectionedit2

               .. container:: level2

                  This plugin checks locks used (current and maximum) in
                  a BerkeleyDB database. This allows to prevent running
                  out of locks, a well known issue in OpenLDAP with BDB
                  or HDB backend.

                  With performance data, it allows to create graph to
                  follow evolution of these indicators.

               .. rubric:: Configuration
                  :name: configuration
                  :class: sectionedit3

               .. container:: level2

                  Required Perl modules:

                  -  

                     .. container:: li

                        Net::LDAP

                  -  

                     .. container:: li

                        Getopt::Std

                  -  

                     .. container:: li

                        File::Basename

                  You also require the db_stat utility.

               .. rubric:: Usage
                  :name: usage
                  :class: sectionedit4

               .. container:: level2

                  .. code:: code

                     $ perl check_berkeley_db.pl -H <db_home> [-S <db_stat>] [-h] [-v] [-V]

               .. rubric:: Mandatory Options
                  :name: mandatory_options
                  :class: sectionedit5

               .. container:: level3

                  -  

                     .. container:: li

                        **-H**: Home of BDB files

                  -  

                     .. container:: li

                        **-w**: Warning threshold in percent

                  -  

                     .. container:: li

                        **-c**: Critical threshold in percent

               .. rubric:: Other options
                  :name: other_options
                  :class: sectionedit6

               .. container:: level3

                  -  

                     .. container:: li

                        **-S**: Path to db_stat utility

                  -  

                     .. container:: li

                        **-v**: Verbose

                  -  

                     .. container:: li

                        **-V**: Print version and exit

                  -  

                     .. container:: li

                        **-h**: Print help and exit

                  -  

                     .. container:: li

                        **-f**: Performance data

                  -  

                     .. container:: li

                        **–current**: Display performance data for
                        current locks/lockers/lock objects

                  -  

                     .. container:: li

                        **–maximum**: Display performance data for
                        maximum locks/lockers/lock objects

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
.. _Login: check_berkeleydb_locks?do=login&sectok=39fb3f9b54a1ecdb3c46340f395d6940
.. _Welcome on LDAP Tool Box project: ../../start
.. _nagios-plugins: https://ltb-project.org/documentation/nagios-plugins/start
.. _Check BerkeleyDB locks: check_berkeleydb_locks
.. _Presentation: check_berkeleydb_locks#presentation
.. _Configuration: check_berkeleydb_locks#configuration
.. _Usage: check_berkeleydb_locks#usage
.. _Mandatory Options: check_berkeleydb_locks#mandatory_options
.. _Other options: check_berkeleydb_locks#other_options
.. _downloaded: ../../download#monitoring
.. _: javascript:void(0)
.. _CC Attribution-Noncommercial-Share Alike 3.0 Unported: http://creativecommons.org/licenses/by-nc-sa/3.0/

.. |LDAP Tool Box (LTB)| image:: ../../_media/wiki/logo.png
   :class: pull-left
   :name: dw__logo
   :width: 32px
   :height: 32px
   :target: ../../start
.. |image1| image:: ../../lib/exe/indexer.php?id=documentation:nagios-plugins:check_berkeleydb_locks&1630081866
   :width: 2px
   :height: 1px
