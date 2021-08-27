===================================
OpenLDAP RPMs [LDAP Tool Box (LTB)]
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
            `Documentation <../documentation>`__ » `OpenLDAP RPMs`_

         --------------

      documentation:openldap-rpm

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

                                 `Yum repository`_

                           -  

                              .. container:: li

                                 `Manual download`_

                        -  

                           .. container:: li

                              `Rebuild RPMs`_

               .. rubric:: OpenLDAP RPMs
                  :name: openldap_rpms
                  :class: sectionedit1

               .. container:: level1

               .. rubric:: Introduction
                  :name: introduction
                  :class: sectionedit2

               .. container:: level2

                  LTB project provides 7 RPMs:

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

                  Our RPMs includes:

                  -  

                     .. container:: li

                        SSL/TLS with OpenSSL

                  -  

                     .. container:: li

                        SASL (including SASL passwords)

                  -  

                     .. container:: li

                        All overlays

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

                        TCP wrappers

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

               .. rubric:: Yum repository
                  :name: yum_repository
                  :class: sectionedit4

               .. container:: level3

                  .. container:: noteimportant

                     Yum repositories are available for this release
                     versions (``$releasever``):

                     -  

                        .. container:: li

                           5/5Server (deprecated)

                     -  

                        .. container:: li

                           6/6Server (deprecated since 2.4.52)

                     -  

                        .. container:: li

                           7/7Server

                     -  

                        .. container:: li

                           8/8Server

                  Configure the yum repository :

                  .. code:: code

                     # vi /etc/yum.repos.d/ltb-project.repo

                  .. code:: file

                     [ltb-project]
                     name=LTB project packages
                     baseurl=https://ltb-project.org/rpm/$releasever/$basearch
                     enabled=1
                     gpgcheck=1
                     gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-LTB-project

                  Then update:

                  .. code:: code

                     # yum update

                  The public key can be downloaded here:
                  `https://ltb-project.org/lib/RPM-GPG-KEY-LTB-project`_

                  To import this key:

                  .. code:: code

                     # rpm --import https://ltb-project.org/lib/RPM-GPG-KEY-LTB-project

                  You are now ready to install:

                  .. code:: code

                     # yum install openldap-ltb

               .. rubric:: Manual download
                  :name: manual_download
                  :class: sectionedit5

               .. container:: level3

                  You can download the RPMs here:
                  `Download <../download>`__.

                  The public key can be downloaded here:
                  `https://ltb-project.org/lib/RPM-GPG-KEY-LTB-project`_

                  To import this key:

                  .. code:: code

                     # rpm --import https://ltb-project.org/lib/RPM-GPG-KEY-LTB-project

                  Just run this command to install them (with dependency
                  management):

                  .. code:: code

                     # yum localinstall berkeleydb-ltb* openldap-ltb*

               .. rubric:: Rebuild RPMs
                  :name: rebuild_rpms
                  :class: sectionedit6

               .. container:: level2

                  You can download the source rpm to build your own
                  OpenLDAP RPMs.

                  Install source RPMs:

                  .. code:: code

                     # rpm -Uvh openldap-ltb-VERSION.src.rpm

                  Do your job and rebuild RPMs:

                  .. code:: code

                     # cd /usr/src/rpm
                     # rpmbuild -ba SPECS/openldap-ltb.spec

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
.. _Login: openldap-rpm?do=login&sectok=39fb3f9b54a1ecdb3c46340f395d6940
.. _Welcome on LDAP Tool Box project: ../start
.. _OpenLDAP RPMs: openldap-rpm
.. _Introduction: openldap-rpm#introduction
.. _Installation: openldap-rpm#installation
.. _Yum repository: openldap-rpm#yum_repository
.. _Manual download: openldap-rpm#manual_download
.. _Rebuild RPMs: openldap-rpm#rebuild_rpms
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
.. |image1| image:: ../lib/exe/indexer.php?id=documentation:openldap-rpm&1630081866
   :width: 2px
   :height: 1px
