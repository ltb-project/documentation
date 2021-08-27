===================================
OpenLDAP DEBs [LDAP Tool Box (LTB)]
===================================

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
            `Documentation <../documentation>`__ » `OpenLDAP DEBs`_

         --------------

      documentation:openldap-deb

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

                              `Introduction`_

                        -  

                           .. container:: li

                              `Installation`_

                           -  

                              .. container:: li

                                 `APT repository`_

               .. rubric:: OpenLDAP DEBs
                  :name: openldap_debs
                  :class: sectionedit1

               .. container:: level1

               .. rubric:: Introduction
                  :name: introduction
                  :class: sectionedit2

               .. container:: level2

                  LTB project provides 7 Debian packages:

                  -  

                     .. container:: li

                        BerkeleyDB

                  -  

                     .. container:: li

                        OpenLDAP

                  -  

                     .. container:: li

                        OpenLDAP contributed overlays

                  -  

                     .. container:: li

                        Check password policy module - check_password
                        (deprecated)

                  -  

                     .. container:: li

                        Password policy module - ppm

                  -  

                     .. container:: li

                        Overlay explockout

                  -  

                     .. container:: li

                        OpenLDAP debuginfo

                  We try to keep package up to date with the latest
                  OpenLDAP version.

                  Our packages include:

                  -  

                     .. container:: li

                        SSL/TLS with OpenSSL

                  -  

                     .. container:: li

                        SASL (including SASL passwords)

                  -  

                     .. container:: li

                        All official overlays

                  -  

                     .. container:: li

                        HDB/BDB backend

                  -  

                     .. container:: li

                        MDB backend

                  -  

                     .. container:: li

                        LDAP backend

                  -  

                     .. container:: li

                        META backend

                  -  

                     .. container:: li

                        SOCK backend

                  -  

                     .. container:: li

                        SLAPI support

                  -  

                     .. container:: li

                        CRYPT password

                  -  

                     .. container:: li

                        `LTB-project OpenLDAP init script`_

                  -  

                     .. container:: li

                        `LTB project check_password`_

                  -  

                     .. container:: li

                        `LTB project ppm`_

                  -  

                     .. container:: li

                        `Overlay explockout`_

                  -  

                     .. container:: li

                        Logrotate script

                  -  

                     .. container:: li

                        Preconfigured DB_CONFIG

                  -  

                     .. container:: li

                        MDB utils

                  -  

                     .. container:: li

                        Schema expose (SLAP_SCHEMA_EXPOSE)

                  -  

                     .. container:: li

                        ARGON2, SHA2 and PBKDF2 password schemes

                  -  

                     .. container:: li

                        Contributed overlays:

                     -  

                        .. container:: li

                           lastbind

                     -  

                        .. container:: li

                           smbk5pwd (without Heimdal Kerberos support)

                     -  

                        .. container:: li

                           autogroup

                     -  

                        .. container:: li

                           nssov

                     -  

                        .. container:: li

                           noosrch

                  The installation is done under /usr/local, in order to
                  avoid conflicts with existing OpenLDAP installation.
                  In particular, we do not touch the ldap system
                  libraries, which are linked in by many other programs.

               .. rubric:: Installation
                  :name: installation
                  :class: sectionedit3

               .. container:: level2

               .. rubric:: APT repository
                  :name: apt_repository
                  :class: sectionedit4

               .. container:: level3

                  .. container:: noteimportant

                     You need to set up the repository for your version:

                     -  

                        .. container:: li

                           lenny (deprecated)

                     -  

                        .. container:: li

                           squeeze (deprecated)

                     -  

                        .. container:: li

                           wheezy (deprecated since 2.4.52, 2.4.51 is
                           the last version available)

                     -  

                        .. container:: li

                           jessie (deprecated since 2.4.52, 2.4.51 is
                           the last version available)

                     -  

                        .. container:: li

                           stretch

                     -  

                        .. container:: li

                           buster

                     For Ubuntu systems you can check which Debian
                     release to choose in /etc/debian_version

                  Authorize downloading of packages in https
                  repositories:

                  .. code:: code

                     # apt-get install apt-transport-https

                  Configure the repository:

                  .. code:: code

                     # vi /etc/apt/sources.list.d/ltb-project.list

                  .. code:: file

                     deb [arch=amd64] https://ltb-project.org/debian/buster buster main

                  The public key can be downloaded here:
                  `https://ltb-project.org/lib/RPM-GPG-KEY-LTB-project`_

                  To import this key:

                  .. code:: code

                     # wget -O - https://ltb-project.org/lib/RPM-GPG-KEY-LTB-project | sudo apt-key add -

                  Then update:

                  .. code:: code

                     # apt update

                  You are now ready to install:

                  .. code:: code

                     # apt install openldap-ltb

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

.. _Home: ../start
.. _Documentation: ../documentation
.. _Download: ../download
.. _Community: ../community
.. _Login: openldap-deb?do=login&sectok=39fb3f9b54a1ecdb3c46340f395d6940
.. _Welcome on LDAP Tool Box project: ../start
.. _OpenLDAP DEBs: openldap-deb
.. _Introduction: openldap-deb#introduction
.. _Installation: openldap-deb#installation
.. _APT repository: openldap-deb#apt_repository
.. _LTB-project OpenLDAP init script: openldap-initscript
.. _LTB project check_password: openldap-ppolicy-check-password
.. _LTB project ppm: https://github.com/ltb-project/ppm
.. _Overlay explockout: https://github.com/davidcoutadeur/explockout
.. _`https://ltb-project.org/lib/RPM-GPG-KEY-LTB-project`: ../lib/RPM-GPG-KEY-LTB-project
.. _: javascript:void(0)
.. _CC Attribution-Noncommercial-Share Alike 3.0 Unported: http://creativecommons.org/licenses/by-nc-sa/3.0/

.. |LDAP Tool Box (LTB)| image:: ../_media/wiki/logo.png
   :class: pull-left
   :name: dw__logo
   :width: 32px
   :height: 32px
   :target: ../start
.. |image1| image:: ../lib/exe/indexer.php?id=documentation:openldap-deb&1630081866
   :width: 2px
   :height: 1px
