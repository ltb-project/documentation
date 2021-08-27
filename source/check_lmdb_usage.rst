======================================
Check LMDB Usage [LDAP Tool Box (LTB)]
======================================

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
            » `Check LMDB Usage`_

         --------------

      documentation:nagios-plugins:check_lmdb_usage

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

                              `Download <check_lmdb_usage#download>`__

               .. rubric:: Check LMDB Usage
                  :name: check_lmdb_usage
                  :class: sectionedit1

               .. container:: level1

               .. rubric:: Presentation
                  :name: presentation
                  :class: sectionedit2

               .. container:: level2

                  This plugin checks percent of pages used and pages
                  free in an LMDB database.

                  For example:

                  .. code:: code

                     $ perl check_lmdb_usage.pl -H /var/lib/ldap/ -w 3 -c 1 -r
                     OK - 66% pages used / 16% pages free

                  With performance data, it allows to create graph to
                  follow evolution of this indicator.

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

                        File::Basename

                  You also require the mdb_stat utility.

               .. rubric:: Usage
                  :name: usage
                  :class: sectionedit4

               .. container:: level2

                  .. code:: code

                     $ perl check_lmdb_usage.pl -H <db_home> [-S <mdb_stat>] [-h] [-v] [-V]

               .. rubric:: Mandatory Options
                  :name: mandatory_options
                  :class: sectionedit5

               .. container:: level3

                  -  

                     .. container:: li

                        **-H**: Home of MDB files

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

                        **-S**: Path to mdb_stat utility

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

                        **-r**: Reverse mode, use warning and critical
                        levels for free pages instead of used pages

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
.. _Login: check_lmdb_usage?do=login&sectok=39fb3f9b54a1ecdb3c46340f395d6940
.. _Welcome on LDAP Tool Box project: ../../start
.. _nagios-plugins: https://ltb-project.org/documentation/nagios-plugins/start
.. _Check LMDB Usage: check_lmdb_usage
.. _Presentation: check_lmdb_usage#presentation
.. _Configuration: check_lmdb_usage#configuration
.. _Usage: check_lmdb_usage#usage
.. _Mandatory Options: check_lmdb_usage#mandatory_options
.. _Other options: check_lmdb_usage#other_options
.. _downloaded: ../../download#monitoring
.. _: javascript:void(0)
.. _CC Attribution-Noncommercial-Share Alike 3.0 Unported: http://creativecommons.org/licenses/by-nc-sa/3.0/

.. |LDAP Tool Box (LTB)| image:: ../../_media/wiki/logo.png
   :class: pull-left
   :name: dw__logo
   :width: 32px
   :height: 32px
   :target: ../../start
.. |image1| image:: ../../lib/exe/indexer.php?id=documentation:nagios-plugins:check_lmdb_usage&1630081866
   :width: 2px
   :height: 1px
