======================================
Check LDAP query [LDAP Tool Box (LTB)]
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
            » `Check LDAP query`_

         --------------

      documentation:nagios-plugins:check_ldap_query

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

                              `Download <check_ldap_query#download>`__

               .. rubric:: Check LDAP query
                  :name: check_ldap_query
                  :class: sectionedit1

               .. container:: level1

               .. rubric:: Presentation
                  :name: presentation
                  :class: sectionedit2

               .. container:: level2

                  This Nagios plugin counts entries returned by an LDAP
                  search.

                  You can configure base, filter and scope of the
                  search.

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

                     $ perl check_ldap_query.pl -H hostname [-p port] [-D binddn -P bindpw] -F filter -b base -s scope -m mode

               .. rubric:: Mandatory Options
                  :name: mandatory_options
                  :class: sectionedit5

               .. container:: level3

                  -  

                     .. container:: li

                        **-H**: LDAP server hostname or IP, or LDAP URI

                  -  

                     .. container:: li

                        **-b**: Base of the LDAP search

                  -  

                     .. container:: li

                        **-w**: Warning threshold

                  -  

                     .. container:: li

                        **-c**: Critical threshold

                  -  

                     .. container:: li

                        **-m**: Mode:

                     -  

                        .. container:: li

                           lesser: error is returned if found value is
                           inferior to warning or critical level

                     -  

                        .. container:: li

                           greater: error is returned if found value is
                           superior to warning or critical level

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
.. _Login: check_ldap_query?do=login&sectok=39fb3f9b54a1ecdb3c46340f395d6940
.. _Welcome on LDAP Tool Box project: ../../start
.. _nagios-plugins: https://ltb-project.org/documentation/nagios-plugins/start
.. _Check LDAP query: check_ldap_query
.. _Presentation: check_ldap_query#presentation
.. _Configuration: check_ldap_query#configuration
.. _Usage: check_ldap_query#usage
.. _Mandatory Options: check_ldap_query#mandatory_options
.. _Other options: check_ldap_query#other_options
.. _downloaded: ../../download#monitoring
.. _: javascript:void(0)
.. _CC Attribution-Noncommercial-Share Alike 3.0 Unported: http://creativecommons.org/licenses/by-nc-sa/3.0/

.. |LDAP Tool Box (LTB)| image:: ../../_media/wiki/logo.png
   :class: pull-left
   :name: dw__logo
   :width: 32px
   :height: 32px
   :target: ../../start
.. |image1| image:: ../../lib/exe/indexer.php?id=documentation:nagios-plugins:check_ldap_query&1630081866
   :width: 2px
   :height: 1px
