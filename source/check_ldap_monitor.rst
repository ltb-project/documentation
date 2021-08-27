===========================================================
Check OpenLDAP cn=monitor information [LDAP Tool Box (LTB)]
===========================================================

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
            » `Check OpenLDAP cn=monitor information`_

         --------------

      documentation:nagios-plugins:check_ldap_monitor

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

                              `Download <check_ldap_monitor#download>`__

               .. rubric:: Check OpenLDAP cn=monitor information
                  :name: check_openldap_cn_monitor_information
                  :class: sectionedit1

               .. container:: level1

               .. rubric:: Presentation
                  :name: presentation
                  :class: sectionedit2

               .. container:: level2

                  This Nagios plugin gets different information from
                  OpenLDAP cn=monitor backend like:

                  -  

                     .. container:: li

                        Current connections

                  -  

                     .. container:: li

                        Total connections

                  -  

                     .. container:: li

                        LDAP operations

                  -  

                     .. container:: li

                        BDB backend caches

                  -  

                     .. container:: li

                        MDB used and free pages

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

               .. rubric:: Usage
                  :name: usage
                  :class: sectionedit4

               .. container:: level2

                  .. code:: code

                     $ perl check_ldap_monitor.pl -T type -H hostname [-p port] [-D binddn -P bindpw] [-m mode]

               .. rubric:: Mandatory Options
                  :name: mandatory_options
                  :class: sectionedit5

               .. container:: level3

                  -  

                     .. container:: li

                        **-H**: LDAP server hostname or IP, or LDAP URI

                  -  

                     .. container:: li

                        **-w**: Warning threshold

                  -  

                     .. container:: li

                        **-c**: Critical threshold

                  -  

                     .. container:: li

                        **-T**: Type of information to check:

                     -  

                        .. container:: li

                           currentconnections: current established
                           connections

                     -  

                        .. container:: li

                           totalconnections: total established
                           connections

                     -  

                        .. container:: li

                           dncache: total DN in cache

                     -  

                        .. container:: li

                           entrycache: total entries in cache

                     -  

                        .. container:: li

                           idlcache: total IDL in cache

                     -  

                        .. container:: li

                           totaloperations: total operations

                     -  

                        .. container:: li

                           totalabandon: total ABANDON operation

                     -  

                        .. container:: li

                           totaladd: total ADD operations

                     -  

                        .. container:: li

                           totalbind: total BIND operations

                     -  

                        .. container:: li

                           totalcompare: total COMPARE operations

                     -  

                        .. container:: li

                           totaldelete: total DELETE operations

                     -  

                        .. container:: li

                           totalextended: total EXTENDED operations

                     -  

                        .. container:: li

                           totalmodify: total MODIFY operations

                     -  

                        .. container:: li

                           totalmodrdn: total MODRDN operations

                     -  

                        .. container:: li

                           totalsearch: total SEARCH operations

                     -  

                        .. container:: li

                           totalunbind: total UNBIND operations

                     -  

                        .. container:: li

                           mdbpagesmax: maximum pages in MDB database

                     -  

                        .. container:: li

                           mdbpageused: used pages in MDB database

                     -  

                        .. container:: li

                           mdbpagesfree: free pages in MDB database

               .. rubric:: Other options
                  :name: other_options
                  :class: sectionedit6

               .. container:: level3

                  -  

                     .. container:: li

                        **-p**: LDAP server port (not working if LDAP
                        URI is set in **-H**)

                  -  

                     .. container:: li

                        **-D**: Bind DN

                  -  

                     .. container:: li

                        **-P**: Bind password

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

                        **-t**: Timeout

                  -  

                     .. container:: li

                        **-F**: Filter of the LDAP search

                  -  

                     .. container:: li

                        **-s**: Scope of the LDAP search

                  -  

                     .. container:: li

                        **-b**: Base of the LDAP search

                  -  

                     .. container:: li

                        **-m**: Mode (default: lesser):

                     -  

                        .. container:: li

                           lesser: error is returned if found value is
                           inferior to warning or critical level

                     -  

                        .. container:: li

                           greater: error is returned if found value is
                           superior to warning or critical level

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
.. _Login: check_ldap_monitor?do=login&sectok=39fb3f9b54a1ecdb3c46340f395d6940
.. _Welcome on LDAP Tool Box project: ../../start
.. _nagios-plugins: https://ltb-project.org/documentation/nagios-plugins/start
.. _Check OpenLDAP cn=monitor information: check_ldap_monitor
.. _Presentation: check_ldap_monitor#presentation
.. _Configuration: check_ldap_monitor#configuration
.. _Usage: check_ldap_monitor#usage
.. _Mandatory Options: check_ldap_monitor#mandatory_options
.. _Other options: check_ldap_monitor#other_options
.. _downloaded: ../../download#monitoring
.. _: javascript:void(0)
.. _CC Attribution-Noncommercial-Share Alike 3.0 Unported: http://creativecommons.org/licenses/by-nc-sa/3.0/

.. |LDAP Tool Box (LTB)| image:: ../../_media/wiki/logo.png
   :class: pull-left
   :name: dw__logo
   :width: 32px
   :height: 32px
   :target: ../../start
.. |image1| image:: ../../lib/exe/indexer.php?id=documentation:nagios-plugins:check_ldap_monitor&1630081866
   :width: 2px
   :height: 1px
