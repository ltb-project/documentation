===============================================
Clean LDAP broken aliases [LDAP Tool Box (LTB)]
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
            `Documentation <../../documentation>`__ » `ldap-scripts`_ »
            `Clean LDAP broken aliases`_

         --------------

      documentation:ldap-scripts:cleanldapbrokenaliases

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

                              `Prsentation`_

                        -  

                           .. container:: li

                              `Usage`_

                        -  

                           .. container:: li

                              `Configuration`_

               .. rubric:: Clean LDAP broken aliases
                  :name: clean_ldap_broken_aliases
                  :class: sectionedit1

               .. container:: level1

               .. rubric:: Prsentation
                  :name: prsentation
                  :class: sectionedit2

               .. container:: level2

                  This script will browse LDAP directory, find aliases,
                  search target entry and delete alias if the target
                  entry was removed.

                  This shell script must be run as a cronjob. You can
                  run it daily.

                  It requires:

                  -  

                     .. container:: li

                        awk

                  -  

                     .. container:: li

                        sed

                  -  

                     .. container:: li

                        perl

                  -  

                     .. container:: li

                        openldap utils (ldapsearch, ldapdelete)

                  Tested on GNU/Linux.

               .. rubric:: Usage
                  :name: usage
                  :class: sectionedit3

               .. container:: level2

                  Command line parameters:

                  -  

                     .. container:: li

                        ``-b <basedn>``: search base

                  Run:

                  .. code:: code

                     sh cleanLdapBrokenAliases.sh -b "ou=structures,dc=example,dc=com"

               .. rubric:: Configuration
                  :name: configuration
                  :class: sectionedit4

               .. container:: level2

                  Edit the script to adapt configuration:

                  -  

                     .. container:: li

                        ``MY_LDAP_URI``: LDAP URI

                  -  

                     .. container:: li

                        ``MY_LDAP_BINDDN``: DN to use to bind

                  -  

                     .. container:: li

                        ``MY_LDAP_BINDPW``: Password

                  -  

                     .. container:: li

                        ``MY_LOG_HEADER``: Log header

                  The PATH must be set to include all shell commands
                  used by the script.

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
.. _Login: cleanldapbrokenaliases?do=login&sectok=39fb3f9b54a1ecdb3c46340f395d6940
.. _Welcome on LDAP Tool Box project: ../../start
.. _ldap-scripts: https://ltb-project.org/documentation/ldap-scripts/start
.. _Clean LDAP broken aliases: cleanldapbrokenaliases
.. _Prsentation: cleanldapbrokenaliases#prsentation
.. _Usage: cleanldapbrokenaliases#usage
.. _Configuration: cleanldapbrokenaliases#configuration
.. _: javascript:void(0)
.. _CC Attribution-Noncommercial-Share Alike 3.0 Unported: http://creativecommons.org/licenses/by-nc-sa/3.0/

.. |LDAP Tool Box (LTB)| image:: ../../_media/wiki/logo.png
   :class: pull-left
   :name: dw__logo
   :width: 32px
   :height: 32px
   :target: ../../start
.. |image1| image:: ../../lib/exe/indexer.php?id=documentation:ldap-scripts:cleanldapbrokenaliases&1630081866
   :width: 2px
   :height: 1px
