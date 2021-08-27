=================================================
OpenLDAP pwdChecker library [LDAP Tool Box (LTB)]
=================================================

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
            `Documentation <../documentation>`__ » `OpenLDAP pwdChecker
            library`_

         --------------

      documentation:openldap-ppolicy-check-password

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

                              `Password checks`_

                        -  

                           .. container:: li

                              `INSTALLATION`_

                        -  

                           .. container:: li

                              `USAGE`_

                        -  

                           .. container:: li

                              `Configuration`_

                        -  

                           .. container:: li

                              `Logs`_

                        -  

                           .. container:: li

                              `Caveats`_

               .. rubric:: OpenLDAP pwdChecker library
                  :name: openldap_pwdchecker_library
                  :class: sectionedit1

               .. container:: level1

               .. rubric:: Presentation
                  :name: presentation
                  :class: sectionedit2

               .. container:: level2

                  check_password.c is an OpenLDAP pwdPolicyChecker
                  module used to check the strength and quality of
                  user-provided passwords.

                  This module is used as an extension of the OpenLDAP
                  password policy controls.

                  check_password.c will run a number of checks on the
                  passwords to ensure minimum strength and quality
                  requirements are met. Passwords that do not meet these
                  requirements are rejected.

               .. rubric:: Password checks
                  :name: password_checks
                  :class: sectionedit3

               .. container:: level2

                  -  

                     .. container:: li

                        Passwords shorter than 6 characters are rejected
                        (because cracklib WILL reject them).

                  -  

                     .. container:: li

                        Syntactic checks controls how many different
                        character classes are used (lower, upper, digit
                        and punctuation characters). The minimum number
                        of classes is defined in a configuration file.

                  -  

                     .. container:: li

                        Passwords are checked against cracklib if
                        cracklib is enabled at compile time. It can be
                        disabled in configuration file.

               .. rubric:: INSTALLATION
                  :name: installation
                  :class: sectionedit4

               .. container:: level2

                  Build dependencies:

                  -  

                     .. container:: li

                        cracklib header files (link with -lcrack). The
                        Makefile does not look for cracklib; you may
                        need to provide the paths manually.

                  -  

                     .. container:: li

                        OpenLDAP header files

                  Copy check_password.c and Makefile in OpenLDAP source
                  directory and use the provided Makefile to build the
                  module:

                  .. code:: code

                     $ make PARAM1=VALUE PARAM2=VALUE ...

                  You can use those compilation parameters:

                  -  

                     .. container:: li

                        CC: compiler (default: gcc)

                  -  

                     .. container:: li

                        CC_FLAGS: compiler flags (default: -g -O2 -Wall
                        -fpic)

                  -  

                     .. container:: li

                        CONFIG_FILE: path to target configuration file
                        (default: /etc/openldap/check_password.conf)

                  -  

                     .. container:: li

                        CONFIG_OPT: compiler config option (default:
                        -DCONFIG_FILE=“\”$(CONFIG)\“”)

                  -  

                     .. container:: li

                        DEBUG_OPT: compiler debug option (default:
                        -DDEBUG)

                  -  

                     .. container:: li

                        CRACKLIB: path to cracklib dictionaries
                        (default: /usr/share/cracklib/pw_dict)

                  -  

                     .. container:: li

                        CRACKLIB_LIB: link to cracklib library (default:
                        -lcrack)

                  -  

                     .. container:: li

                        CRACKLIB_OPT: compiler cracklib option (default:
                        -DHAVE_CRACKLIB
                        -DCRACKLIB_DICTPATH=“\”$(CRACKLIB)\“”)

                  -  

                     .. container:: li

                        LDAP_INC: OpenLDAP includes (default:
                        -I/usr/include/openldap/include
                        -I/usr/include/openldap/servers/slapd)

                  -  

                     .. container:: li

                        LDAP_LIB: link to OpenLDAP libraries (default:
                        -lldap_r -llber)

                  -  

                     .. container:: li

                        LIBDIR: target installation directory (default:
                        /usr/lib/openldap/)

                  Compilation command example:

                  .. code:: code

                     $ make CONFIG="/usr/local/openldap/etc/openldap/check_password.conf" \
                     LDAP_INC="-I./include/ -I./servers/slapd/" \
                     CRACKLIB_OPT='' CRACKLIB_LIB=''

                  Install into the slapd server module path:

                  .. code:: code

                     make install LIBDIR='/usr/local/openldap/lib'

                  The module path may be defined with slapd.conf
                  parameter “modulepath”.

                  Ronan Lanore wrote a documentation for Debian Lenny:
                  `Compile check_password.so on Lenny`_

               .. rubric:: USAGE
                  :name: usage
                  :class: sectionedit5

               .. container:: level2

                  To use this module you need to add objectClass
                  pwdPolicyChecker with an attribute 'pwdCheckModule:
                  check_password.so' to a password policy entry.

                  The module depends on a working cracklib installation
                  including wordlist files. If the wordlist files are
                  not readable, the cracklib check will be skipped
                  silently.

                  Note: pwdPolicyChecker modules are loaded on \*every\*
                  password change operation.

               .. rubric:: Configuration
                  :name: configuration
                  :class: sectionedit6

               .. container:: level2

                  The configuration file
                  (/etc/openldap/check_passwd.conf by default) contains
                  parameters for the module. If the file is not found,
                  parameters are given their default value.

                  The syntax of the file is :

                  .. code:: file

                     parameter value

                  with spaces being delimiters. Parameter names ARE case
                  sensitive..

                  Current parameters :

                  -  

                     .. container:: li

                        minPoints : integer. Default value: 3. Minimum
                        number of quality points a new password must
                        have to be accepted. One quality point is
                        awarded for each character class used in the
                        password.

                  -  

                     .. container:: li

                        useCracklib : integer. Default value : 1. Set it
                        to 0 to disable cracklib verification. It has no
                        effect if cracklib is not included at compile
                        time.

                  -  

                     .. container:: li

                        minUpper: integer. Defaut value: 0. Minimum
                        upper characters expected.

                  -  

                     .. container:: li

                        minLower: integer. Defaut value: 0. Minimum
                        lower characters expected.

                  -  

                     .. container:: li

                        minDigit: integer. Defaut value: 0. Minimum
                        digit characters expected.

                  -  

                     .. container:: li

                        minPunct: integer. Defaut value: 0. Minimum
                        punctuation characters expected.

                  Example:

                  .. code:: file

                     minPoints 3
                     useCracklib 0
                     minUpper 2
                     minLower 4
                     minDigit 1
                     minPunct 0

               .. rubric:: Logs
                  :name: logs
                  :class: sectionedit7

               .. container:: level2

                  If a user password is rejected by an OpenLDAP
                  pwdChecker module, the user will **not** get a
                  detailed error message, this is by design.

                  Typical user message from ldappasswd(5):

                  .. code:: code

                       Result: Constraint violation (19)
                       Additional info: Password fails quality checking policy

                  A more detailed message is written to the server log.

                  Server log:

                  .. code:: code

                       check_password_quality: module error: (check_password.so)
                       Password for dn=".." does not pass required number of strength checks (2 of 3)

               .. rubric:: Caveats
                  :name: caveats
                  :class: sectionedit8

               .. container:: level2

                  Runtime errors with this module (such as cracklib
                  configuration problems) may bring down the slapd
                  process.

                  Use at your own risk.

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
.. _Login: openldap-ppolicy-check-password?do=login&sectok=39fb3f9b54a1ecdb3c46340f395d6940
.. _Welcome on LDAP Tool Box project: ../start
.. _OpenLDAP pwdChecker library: openldap-ppolicy-check-password
.. _Presentation: openldap-ppolicy-check-password#presentation
.. _Password checks: openldap-ppolicy-check-password#password_checks
.. _INSTALLATION: openldap-ppolicy-check-password#installation
.. _USAGE: openldap-ppolicy-check-password#usage
.. _Configuration: openldap-ppolicy-check-password#configuration
.. _Logs: openldap-ppolicy-check-password#logs
.. _Caveats: openldap-ppolicy-check-password#caveats
.. _Compile check_password.so on Lenny: openldap-ppolicy-check-password-debian
.. _: javascript:void(0)
.. _CC Attribution-Noncommercial-Share Alike 3.0 Unported: http://creativecommons.org/licenses/by-nc-sa/3.0/

.. |LDAP Tool Box (LTB)| image:: ../_media/wiki/logo.png
   :class: pull-left
   :name: dw__logo
   :width: 32px
   :height: 32px
   :target: ../start
.. |image1| image:: ../lib/exe/indexer.php?id=documentation:openldap-ppolicy-check-password&1630081866
   :width: 2px
   :height: 1px
