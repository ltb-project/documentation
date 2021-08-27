========================================================
Check 389DS cn=monitor information [LDAP Tool Box (LTB)]
========================================================

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
            » `Check 389DS cn=monitor information`_

         --------------

      documentation:nagios-plugins:check_ldap_monitor_389ds

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

                              `Download <check_ldap_monitor_389ds#download>`__

               .. rubric:: Check 389DS cn=monitor information
                  :name: check_389ds_cn_monitor_information
                  :class: sectionedit1

               .. container:: level1

               .. rubric:: Presentation
                  :name: presentation
                  :class: sectionedit2

               .. container:: level2

                  This Nagios plugin gets different information from
                  389DS cn=monitor backend like:

                  -  

                     .. container:: li

                        Current connections

                  -  

                     .. container:: li

                        Total connections

                  -  

                     .. container:: li

                        Performance informations

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

                     $ perl check_ldap_monitor_389DS.pl -T type -H hostname [-p port] [-D binddn -P bindpw] [-m mode]

               .. rubric:: Mandatory Options
                  :name: mandatory_options
                  :class: sectionedit5

               .. container:: level3

                  -  

                     .. container:: li

                        **-H**: LDAP server hostname or IP, or LDAP URI

                  -  

                     .. container:: li

                        **-w**: Warning threshold (except for version,
                        currenttime, starttime, nbackends, readonly,
                        maxentrycachesize, maxdncachesize types)

                  -  

                     .. container:: li

                        **-c**: Critical threshold (except for version,
                        currenttime, starttime, nbackends, readonly,
                        maxentrycachesize, maxdncachesize types)

                  -  

                     .. container:: li

                        **-T**: Type of information to check:

                     -  

                        .. container:: li

                           version: current version of the ldap server

                     -  

                        .. container:: li

                           threads: current number of active threads
                           used for handling requests.

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

                           dtablesize: the number of file descriptors
                           available to the directory. Essentially, this
                           value shows how many additional concurrent
                           connections can be serviced by the directory.

                     -  

                        .. container:: li

                           readwaiters: current number of threads
                           waiting to read data from a client.

                     -  

                        .. container:: li

                           opsinitiated: current number of operations
                           the server has initiated since it started.

                     -  

                        .. container:: li

                           opscompleted: current number of operations
                           the server has completed since it started.

                     -  

                        .. container:: li

                           entriessent: current number of entries sent
                           to clients since the server started.

                     -  

                        .. container:: li

                           bytessent: current number of bytes sent to
                           clients since the server started.

                     -  

                        .. container:: li

                           currenttime: current time of the server. The
                           time is displayed in Greenwich Mean Time
                           (GMT) in UTC format.

                     -  

                        .. container:: li

                           starttime: time when the server started. The
                           time is displayed in Greenwich Mean Time
                           (GMT) in UTC format.

                     -  

                        .. container:: li

                           nbackends: current number of back ends
                           (databases) the server services.

                  -  

                     .. container:: li

                        LMBD cache specific checks, theses needs
                        Directory Manager user (don't do this) or
                        specific ACL for your monitoring user.

                     -  

                        .. container:: li

                           readonly: Indicates whether the database is
                           in read-only mode; 0 means that the server is
                           not in read-only mode, 1 means that it is in
                           read-only mode.

                     -  

                        .. container:: li

                           entrycachehits: The total number of
                           successful entry cache lookups. That is, the
                           total number of times the server could
                           process a search request by obtaining data
                           from the cache rather than by going to disk.

                     -  

                        .. container:: li

                           entrycachetries: The total number of entry
                           cache lookups since the directory was last
                           started. That is, the total number of search
                           operations performed against the server since
                           server startup.

                     -  

                        .. container:: li

                           entrycachehitratio: Ratio that indicates the
                           number of entry cache tries to successful
                           entry cache lookups. This number is based on
                           the total lookups and hits since the
                           directory was last started. The closer this
                           value is to 100%, the better.

                     -  

                        .. container:: li

                           currententrycachecount: The number of entries
                           currently present in the entry cache.

                     -  

                        .. container:: li

                           currententrycachesize: The total size, in
                           bytes, of directory entries currently present
                           in the entry cache.

                     -  

                        .. container:: li

                           maxentrycachesize: The maximum size, in
                           bytes, of directory entries that can be
                           maintained in the entry cache.

                     -  

                        .. container:: li

                           dncachehitratio: Ratio that indicates the
                           number of DN cache tries to successful DN
                           cache lookups. This number is based on the
                           total lookups and hits since the directory
                           was last started. The closer this value is to
                           100%, the better.

                     -  

                        .. container:: li

                           dncachehits: The total number of successful
                           DN cache lookups. That is, the total number
                           of times the server could process a search
                           request by obtaining data from the cache
                           rather than by going to disk.

                     -  

                        .. container:: li

                           dncachetries: The total number of DNs cache
                           lookups since the directory was last started.
                           That is, the total number of search
                           operations performed against the server since
                           server startup.

                     -  

                        .. container:: li

                           currentdncachecount: The number of entries
                           currently present in the DN cache.

                     -  

                        .. container:: li

                           currentdncachesize: The total size, in bytes,
                           of directory entries currently present in the
                           DN cache.

                     -  

                        .. container:: li

                           maxdncachesize: The maximum size, in bytes,
                           of directory entries that can be maintained
                           in the DN cache.

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
.. _Login: check_ldap_monitor_389ds?do=login&sectok=39fb3f9b54a1ecdb3c46340f395d6940
.. _Welcome on LDAP Tool Box project: ../../start
.. _nagios-plugins: https://ltb-project.org/documentation/nagios-plugins/start
.. _Check 389DS cn=monitor information: check_ldap_monitor_389ds
.. _Presentation: check_ldap_monitor_389ds#presentation
.. _Configuration: check_ldap_monitor_389ds#configuration
.. _Usage: check_ldap_monitor_389ds#usage
.. _Mandatory Options: check_ldap_monitor_389ds#mandatory_options
.. _Other options: check_ldap_monitor_389ds#other_options
.. _downloaded: ../../download#monitoring
.. _: javascript:void(0)
.. _CC Attribution-Noncommercial-Share Alike 3.0 Unported: http://creativecommons.org/licenses/by-nc-sa/3.0/

.. |LDAP Tool Box (LTB)| image:: ../../_media/wiki/logo.png
   :class: pull-left
   :name: dw__logo
   :width: 32px
   :height: 32px
   :target: ../../start
.. |image1| image:: ../../lib/exe/indexer.php?id=documentation:nagios-plugins:check_ldap_monitor_389ds&1630081866
   :width: 2px
   :height: 1px
