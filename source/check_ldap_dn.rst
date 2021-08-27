===============================================
Check LDAP entry presence [LDAP Tool Box (LTB)]
===============================================

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
            » `Check LDAP entry presence`_

         --------------

      documentation:nagios-plugins:check_ldap_dn

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

                              `Download <check_ldap_dn#download>`__

               .. rubric:: Check LDAP entry presence
                  :name: check_ldap_entry_presence
                  :class: sectionedit1

               .. container:: level1

               .. rubric:: Presentation
                  :name: presentation
                  :class: sectionedit2

               .. container:: level2

                  This Nagios plugin checks if a given entry is present
                  in an LDAP directory.

                  It does a simple search with the entry DN as base
                  value, and base as scope value.

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

                  Edit the script to modify some default parameters:

                  -  

                     .. container:: li

                        timeout: time in second for LDAP connection
                        timeout (default: 5)

                  -  

                     .. container:: li

                        version: LDAP version to use (default: 3)

                  Other parameters are set as script options (see
                  below).

               .. rubric:: Usage
                  :name: usage
                  :class: sectionedit4

               .. container:: level2

                  .. code:: code

                     $ perl check_ldap_dn.pl -H hostname [-p port] [-D binddn -W bindpw] -b dn

               .. rubric:: Mandatory Options
                  :name: mandatory_options
                  :class: sectionedit5

               .. container:: level3

                  -  

                     .. container:: li

                        **-H**: LDAP server hostname or IP, or LDAP URI

                  -  

                     .. container:: li

                        **-b**: DN of the entry to check (base of the
                        LDAP search)

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

                        **-W**: Bind password

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
.. _Login: check_ldap_dn?do=login&sectok=39fb3f9b54a1ecdb3c46340f395d6940
.. _Welcome on LDAP Tool Box project: ../../start
.. _nagios-plugins: https://ltb-project.org/documentation/nagios-plugins/start
.. _Check LDAP entry presence: check_ldap_dn
.. _Presentation: check_ldap_dn#presentation
.. _Configuration: check_ldap_dn#configuration
.. _Usage: check_ldap_dn#usage
.. _Mandatory Options: check_ldap_dn#mandatory_options
.. _Other options: check_ldap_dn#other_options
.. _downloaded: ../../download#monitoring
.. _: javascript:void(0)
.. _CC Attribution-Noncommercial-Share Alike 3.0 Unported: http://creativecommons.org/licenses/by-nc-sa/3.0/

.. |LDAP Tool Box (LTB)| image:: ../../_media/wiki/logo.png
   :class: pull-left
   :name: dw__logo
   :width: 32px
   :height: 32px
   :target: ../../start
.. |image1| image:: ../../lib/exe/indexer.php?id=documentation:nagios-plugins:check_ldap_dn&1630081866
   :width: 2px
   :height: 1px
