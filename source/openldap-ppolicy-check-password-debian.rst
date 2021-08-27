========================================================
Compile check_password.so on Lenny [LDAP Tool Box (LTB)]
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
            `Documentation <../documentation>`__ » `Compile
            check_password.so on Lenny`_

         --------------

      documentation:openldap-ppolicy-check-password-debian

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

                              `Debian Installation`_

                        -  

                           .. container:: li

                              `Package prerequisite`_

                        -  

                           .. container:: li

                              `Opendlap compilation prerequisite`_

                        -  

                           .. container:: li

                              `Compile check_password module`_

               .. rubric:: Compile check_password.so on Lenny
                  :name: compile_check_passwordso_on_lenny
                  :class: sectionedit1

               .. container:: level1

               .. rubric:: Presentation
                  :name: presentation
                  :class: sectionedit2

               .. container:: level2

                  In this page we show howto compile it on debian Lenny
                  with distribution package

                  |:!:| Becareful they are lot of bug in 2.4.11 OpenLDAP
                  version, use it at your own risk

               .. rubric:: Debian Installation
                  :name: debian_installation
                  :class: sectionedit3

               .. container:: level2

                  This documentation apply on Lenny 32 bits only and
                  compile the module less cracklib dictionary.

               .. rubric:: Package prerequisite
                  :name: package_prerequisite
                  :class: sectionedit4

               .. container:: level2

                  Install the following package

                  .. code:: code

                      aptitude install gcc libldap2-dev dpkg-dev cracklib-dev libdb4.6-dev

                  Verify path for src package

                  .. code:: code

                      vi /etc/apt/sources.list
                      ... ...
                      deb-src http://security.debian.org/debian-security lenny/updates main contrib non-free
                      ... ...

                  get source of slapd package

                  .. code:: code

                      cd /root
                      apt-get update
                      apt-get source slapd

               .. rubric:: Opendlap compilation prerequisite
                  :name: opendlap_compilation_prerequisite
                  :class: sectionedit5

               .. container:: level2

                  To compile the check_password module we need of some
                  header file that aren't exist into the source tree,
                  but create on **configure and make step**

                  .. code:: code

                     cd /root/openldap-2.4.11
                     ./configure
                     make

               .. rubric:: Compile check_password module
                  :name: compile_check_password_module
                  :class: sectionedit6

               .. container:: level2

                  Get module

                  .. code:: code

                      wget DOWNLOADURL/ltb-project-openldap-ppolicy-check-password-1.1.tar.gz
                      tar -xvzf ltb-project-openldap-ppolicy-check-password-1.1.tar.gz
                      cd ltb-project-openldap-ppolicy-check-password-1.1.tar.gz

                  Compile it

                  .. code:: code

                      make CONFIG="/etc/ldap/check_password.conf" LDAP_INC="-I/root/openldap-2.4.11/include/ -I/root/openldap-2.4.11/servers/slapd"

      ``_

      .. container:: text-center

         .. container:: license

            Except where otherwise noted, content on this wiki is
            licensed under the following license: `CC
            Attribution-Noncommercial-Share Alike 3.0 Unported`_

   .. container:: no

      |image2|

   .. container:: no
      :name: screen__mode

.. _Home: ../start
.. _Documentation: ../documentation
.. _Download: ../download
.. _Community: ../community
.. _Login: openldap-ppolicy-check-password-debian?do=login&sectok=39fb3f9b54a1ecdb3c46340f395d6940
.. _Welcome on LDAP Tool Box project: ../start
.. _Compile check_password.so on Lenny: openldap-ppolicy-check-password-debian
.. _Presentation: openldap-ppolicy-check-password-debian#presentation
.. _Debian Installation: openldap-ppolicy-check-password-debian#debian_installation
.. _Package prerequisite: openldap-ppolicy-check-password-debian#package_prerequisite
.. _Opendlap compilation prerequisite: openldap-ppolicy-check-password-debian#opendlap_compilation_prerequisite
.. _Compile check_password module: openldap-ppolicy-check-password-debian#compile_check_password_module
.. _: javascript:void(0)
.. _CC Attribution-Noncommercial-Share Alike 3.0 Unported: http://creativecommons.org/licenses/by-nc-sa/3.0/

.. |LDAP Tool Box (LTB)| image:: ../_media/wiki/logo.png
   :class: pull-left
   :name: dw__logo
   :width: 32px
   :height: 32px
   :target: ../start
.. |:!:| image:: ../lib/images/smileys/icon_exclaim.gif
   :class: icon
.. |image2| image:: ../lib/exe/indexer.php?id=documentation:openldap-ppolicy-check-password-debian&1630081875
   :width: 2px
   :height: 1px
