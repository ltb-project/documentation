=====================================================
Account expiration mail warning [LDAP Tool Box (LTB)]
=====================================================

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
            `Account expiration mail warning`_

         --------------

      documentation:ldap-scripts:checkldappwdexpiration

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

                              `Usage`_

                        -  

                           .. container:: li

                              `Configuration`_

               .. rubric:: Account expiration mail warning
                  :name: account_expiration_mail_warning
                  :class: sectionedit1

               .. container:: level1

               .. rubric:: Presentation
                  :name: presentation
                  :class: sectionedit2

               .. container:: level2

                  This script will browse the LDAP directory a look for
                  entries that uses password policy. If the user's
                  password will expire soon, a mail is sent. It was only
                  tested with OpenLDAP (ppolicy overlay).

                  This shell script must be run as a cronjob. You can
                  run it daily.

                  It requires :

                  -  

                     .. container:: li

                        gawk (GNU awk)

                  -  

                     .. container:: li

                        ldapsearch

                  -  

                     .. container:: li

                        mailx

                  -  

                     .. container:: li

                        date

                  It was tested for GNU/Linux and SunOS 5.8.

               .. rubric:: Usage
                  :name: usage
                  :class: sectionedit3

               .. container:: level2

                  There is no command line parameter:

                  .. code:: code

                     sh checkLdapPwdExpiration.sh

                  Logs are sent through STDOUT and STDERR:

                  .. code:: code

                     sh checkLdapPwdExpiration.sh 1>result.log 2>audit.log

                  Sample log files:

                  -  

                     .. container:: li

                        *result.log*

                  .. code:: file

                     --- Statistics ---
                     Users checked: 5
                     Account expired: 1
                     Account in warning: 1

                  -  

                     .. container:: li

                        *audit.log*

                  .. code:: file

                     No password policy for coudot
                     Password expired for sbahloul
                     No password change date for tchemineau
                     No password change date for rouazana
                     Mail sent to user farmand (farmand@example.com)

               .. rubric:: Configuration
                  :name: configuration
                  :class: sectionedit4

               .. container:: level2

                  Edit the script to adapt configuration:

                  -  

                     .. container:: li

                        ``MY_LDAP_HOSTURI``: LDAP URI

                  -  

                     .. container:: li

                        ``MY_LDAP_ROOTDN`` (optional): DN to use to
                        bind. No DN means anonymous

                  -  

                     .. container:: li

                        ``MY_LDAP_ROOTPW``: Password

                  -  

                     .. container:: li

                        ``MY_LDAP_DEFAULTPWDPOLICYDN``: Default password
                        policy DN. Do not set if no default policy is
                        used. In this case, the script will ony affect
                        users with password policy in their entry
                        (*pwdPolicySubentry*)

                  -  

                     .. container:: li

                        ``MY_LDAP_SEARCHBASE``: Users search base

                  -  

                     .. container:: li

                        ``MY_LDAP_SEARCHFILTER``: Users search filter

                  -  

                     .. container:: li

                        ``MY_LDAP_SEARCHBIN``: Path to ldapsearch binary

                  -  

                     .. container:: li

                        ``MY_MAIL_DELAY``: Time before expiration where
                        a mail is sent. No mail sent after expiration.
                        If no value, the script will take the
                        *pwdExpireWarning* of the password policy

                  -  

                     .. container:: li

                        ``MY_LDAP_NAME_ATTR``: attribute containing
                        user's name

                  -  

                     .. container:: li

                        ``MY_LDAP_LOGIN_ATTR``: attribute containing
                        user's login

                  -  

                     .. container:: li

                        ``MY_LDAP_MAIL_ATTR``:attribute containing
                        user's name

                  -  

                     .. container:: li

                        ``MY_MAIL_BODY``: message body

                  -  

                     .. container:: li

                        ``MY_MAIL_SUBJECT``: message subject

                  -  

                     .. container:: li

                        ``MY_MAIL_BIN``: mail binary

                  -  

                     .. container:: li

                        ``MY_LOG_HEADER``: log header

                  -  

                     .. container:: li

                        ``MY_GAWK_BIN``: path to gawk binary

                  Mail content: you can edit ``MY_MAIL_BODY`` and use
                  the following variables:

                  -  

                     .. container:: li

                        ``name``

                  -  

                     .. container:: li

                        ``login``

                  -  

                     .. container:: li

                        ``expireTimeTZ``

                  -  

                     .. container:: li

                        ``expireDays``

                  -  

                     .. container:: li

                        ``pwdMinLength``

                  -  

                     .. container:: li

                        ``pwdInHistory``

                  Date localization: you can change the lang by
                  modifying this line:

                  .. code:: code

                     export LC_ALL=en_US.UTF-8

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
.. _Login: checkldappwdexpiration?do=login&sectok=39fb3f9b54a1ecdb3c46340f395d6940
.. _Welcome on LDAP Tool Box project: ../../start
.. _ldap-scripts: https://ltb-project.org/documentation/ldap-scripts/start
.. _Account expiration mail warning: checkldappwdexpiration
.. _Presentation: checkldappwdexpiration#presentation
.. _Usage: checkldappwdexpiration#usage
.. _Configuration: checkldappwdexpiration#configuration
.. _: javascript:void(0)
.. _CC Attribution-Noncommercial-Share Alike 3.0 Unported: http://creativecommons.org/licenses/by-nc-sa/3.0/

.. |LDAP Tool Box (LTB)| image:: ../../_media/wiki/logo.png
   :class: pull-left
   :name: dw__logo
   :width: 32px
   :height: 32px
   :target: ../../start
.. |image1| image:: ../../lib/exe/indexer.php?id=documentation:ldap-scripts:checkldappwdexpiration&1630081866
   :width: 2px
   :height: 1px
