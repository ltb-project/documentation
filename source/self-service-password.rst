===========================================
Self Service Password [LDAP Tool Box (LTB)]
===========================================

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
            `Documentation <../documentation>`__ » `Self Service
            Password`_

         --------------

      documentation:self-service-password

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

                              `Documentation <self-service-password#documentation>`__

                        -  

                           .. container:: li

                              `Screenshots`_

                           -  

                              .. container:: li

                                 `Version 1.0`_

                           -  

                              .. container:: li

                                 `From 0.6 to 0.9`_

                           -  

                              .. container:: li

                                 `Versions 0.4 and 0.5`_

                           -  

                              .. container:: li

                                 `Version 0.3`_

               .. rubric:: Self Service Password
                  :name: self_service_password
                  :class: sectionedit1

               .. container:: level1

               .. rubric:: Presentation
                  :name: presentation
                  :class: sectionedit2

               .. container:: level2

                  Self Service Password is a PHP application that allows
                  users to change their password in an LDAP directory.

                  The application can be used on standard LDAPv3
                  directories (OpenLDAP, OpenDS, ApacheDS, 389 DS, RHDS,
                  [STRIKEOUT:Sun] Oracle DSEE, Novell, etc.) and also on
                  Active Directory.

                  It has the following features:

                  -  

                     .. container:: li

                        Samba mode to change Samba passwords

                  -  

                     .. container:: li

                        Active directory mode

                  -  

                     .. container:: li

                        Local password policy:

                     -  

                        .. container:: li

                           Minimum/maximum length

                     -  

                        .. container:: li

                           Forbidden characters

                     -  

                        .. container:: li

                           Upper, Lower, Digit or Special characters
                           counters

                     -  

                        .. container:: li

                           Reuse old password check

                     -  

                        .. container:: li

                           Complexity (different class of characters)

                  -  

                     .. container:: li

                        Help messages

                  -  

                     .. container:: li

                        Reset by questions

                  -  

                     .. container:: li

                        Reset by mail challenge (token sent by mail)

                  -  

                     .. container:: li

                        Reset by SMS (through external Email 2 SMS
                        service)

                  -  

                     .. container:: li

                        reCAPTCHA (Google API)

                  -  

                     .. container:: li

                        Mail notification after password change

                  .. container:: notetip

                     Self Service Password code is now hosted on GitHub:
                     https://github.com/ltb-project/self-service-password

                  Vote for this software:

               .. rubric:: Documentation
                  :name: documentation
                  :class: sectionedit3

               .. container:: level2

                  -  

                     .. container:: li

                        `Latest release documentation`_

                  -  

                     .. container:: li

                        All releases:

                     -  

                        .. container:: li

                           `Self Service Password v1.4`_

                     -  

                        .. container:: li

                           `Self Service Password v1.3`_

                     -  

                        .. container:: li

                           `Self Service Password v1.2`_

                     -  

                        .. container:: li

                           `Self Service Password v1.1`_

                     -  

                        .. container:: li

                           `Self Service Password v1.0`_

                     -  

                        .. container:: li

                           `Self Service Password v0.9`_

                     -  

                        .. container:: li

                           `Self Service Password v0.8`_

                     -  

                        .. container:: li

                           `Self Service Password v0.7`_

                     -  

                        .. container:: li

                           `Self Service Password v0.6`_

                     -  

                        .. container:: li

                           `Self Service Password v0.5`_

                     -  

                        .. container:: li

                           `Self Service Password v0.4`_

                     -  

                        .. container:: li

                           `Self Service Password v0.3`_

               .. rubric:: Screenshots
                  :name: screenshots
                  :class: sectionedit4

               .. container:: level2

               .. rubric:: Version 1.0
                  :name: version_10
                  :class: sectionedit5

               .. container:: level3

                  .. container:: gallery gallery_center

                     +----------------------+----------------------+----------------------+
                     | |ssp_1_0_            | |ssp                 | |ssp_1_0_            |
                     | change_password.png| | _1_0_reset_mail.png| | reset_questions.png| |
                     +----------------------+----------------------+----------------------+
                     | |ss                  | |ssp_1_              |                      |
                     | p_1_0_reset_sms.png| | 0_set_questions.png| |                      |
                     +----------------------+----------------------+----------------------+

                     .. container:: clearer

               .. rubric:: From 0.6 to 0.9
                  :name: from_06_to_09
                  :class: sectionedit6

               .. container:: level3

                  .. container:: gallery gallery_center

                     ===============
                     |recaptcha.png|  
                     ===============

                     .. container:: clearer

               .. rubric:: Versions 0.4 and 0.5
                  :name: versions_04_and_05
                  :class: sectionedit7

               .. container:: level3

                  .. container:: gallery gallery_center

                     +----------------------+----------------------+----------------------+
                     | |ssp_cha             | |ssp_c               | |ssp_r               |
                     | nge_fulloptions.png| | hange_nooptions.png| | esetbyquestions.png| |
                     +----------------------+----------------------+----------------------+
                     | |ss                  | |ssp_sendtoken.png|  | |s                   |
                     | p_resetbytokens.png| |                      | sp_setquestions.png| |
                     +----------------------+----------------------+----------------------+

                     .. container:: clearer

               .. rubric:: Version 0.3
                  :name: version_03
                  :class: sectionedit8

               .. container:: level3

                  .. container:: gallery gallery_center

                     +----------------------+----------------------+----------------------+
                     | |self_s              | |                    | |                    |
                     | ervice_password.png| | self_service_passwor | self_service_passwor |
                     |                      | d_1266273082544.png| | d_1266273139157.png| |
                     +----------------------+----------------------+----------------------+
                     | |                    |                      |                      |
                     | self_service_passwor |                      |                      |
                     | d_1266273215596.png| |                      |                      |
                     +----------------------+----------------------+----------------------+

                     .. container:: clearer

      ``_

      .. container:: text-center

         .. container:: license

            Except where otherwise noted, content on this wiki is
            licensed under the following license: `CC
            Attribution-Noncommercial-Share Alike 3.0 Unported`_

   .. container:: no

      |image17|

   .. container:: no
      :name: screen__mode

.. _Home: ../start
.. _Documentation: ../documentation
.. _Download: ../download
.. _Community: ../community
.. _Login: self-service-password?do=login&sectok=39fb3f9b54a1ecdb3c46340f395d6940
.. _Welcome on LDAP Tool Box project: ../start
.. _Self Service Password: self-service-password
.. _Presentation: self-service-password#presentation
.. _Screenshots: self-service-password#screenshots
.. _Version 1.0: self-service-password#version_10
.. _From 0.6 to 0.9: self-service-password#from_06_to_09
.. _Versions 0.4 and 0.5: self-service-password#versions_04_and_05
.. _Version 0.3: self-service-password#version_03
.. _Latest release documentation: https://self-service-password.readthedocs.io/en/stable/
.. _Self Service Password v1.4: https://self-service-password.readthedocs.io/en/v1.4/
.. _Self Service Password v1.3: https://ltb-project.org/documentation/self-service-password/1.3/start
.. _Self Service Password v1.2: https://ltb-project.org/documentation/self-service-password/1.2/start
.. _Self Service Password v1.1: https://ltb-project.org/documentation/self-service-password/1.1/start
.. _Self Service Password v1.0: https://ltb-project.org/documentation/self-service-password/1.0/start
.. _Self Service Password v0.9: https://ltb-project.org/documentation/self-service-password/0.9/start
.. _Self Service Password v0.8: https://ltb-project.org/documentation/self-service-password/0.8/start
.. _Self Service Password v0.7: https://ltb-project.org/documentation/self-service-password/0.7/start
.. _Self Service Password v0.6: https://ltb-project.org/documentation/self-service-password/0.6/start
.. _Self Service Password v0.5: https://ltb-project.org/documentation/self-service-password/0.5/start
.. _Self Service Password v0.4: https://ltb-project.org/documentation/self-service-password/0.4/start
.. _Self Service Password v0.3: https://ltb-project.org/documentation/self-service-password/0.3/start
.. _: javascript:void(0)
.. _CC Attribution-Noncommercial-Share Alike 3.0 Unported: http://creativecommons.org/licenses/by-nc-sa/3.0/

.. |LDAP Tool Box (LTB)| image:: ../_media/wiki/logo.png
   :class: pull-left
   :name: dw__logo
   :width: 32px
   :height: 32px
   :target: ../start
.. |ssp_1_0_change_password.png| image:: ../_media/documentation/self-service-password/1.0/ssp_1_0_change_password.png?w=120&h=100&tok=a518ce
   :class: tn
   :width: 120px
   :height: 100px
   :target: ../_media/documentation/self-service-password/1.0/ssp_1_0_change_password.png?w=800&h=666&tok=abc22c
.. |ssp_1_0_reset_mail.png| image:: ../_media/documentation/self-service-password/1.0/ssp_1_0_reset_mail.png?w=120&h=100&tok=7948ca
   :class: tn
   :width: 120px
   :height: 100px
   :target: ../_media/documentation/self-service-password/1.0/ssp_1_0_reset_mail.png?w=800&h=666&tok=2ff6e3
.. |ssp_1_0_reset_questions.png| image:: ../_media/documentation/self-service-password/1.0/ssp_1_0_reset_questions.png?w=120&h=100&tok=8536ed
   :class: tn
   :width: 120px
   :height: 100px
   :target: ../_media/documentation/self-service-password/1.0/ssp_1_0_reset_questions.png?w=800&h=666&tok=1dd131
.. |ssp_1_0_reset_sms.png| image:: ../_media/documentation/self-service-password/1.0/ssp_1_0_reset_sms.png?w=120&h=100&tok=2e2eb6
   :class: tn
   :width: 120px
   :height: 100px
   :target: ../_media/documentation/self-service-password/1.0/ssp_1_0_reset_sms.png?w=800&h=666&tok=3b3f40
.. |ssp_1_0_set_questions.png| image:: ../_media/documentation/self-service-password/1.0/ssp_1_0_set_questions.png?w=120&h=100&tok=bd0f89
   :class: tn
   :width: 120px
   :height: 100px
   :target: ../_media/documentation/self-service-password/1.0/ssp_1_0_set_questions.png?w=800&h=666&tok=e895ed
.. |recaptcha.png| image:: ../_media/documentation/self-service-password/0.6/recaptcha.png?w=120&h=79&tok=ee7070
   :class: tn
   :width: 120px
   :height: 79px
   :target: ../_media/documentation/self-service-password/0.6/recaptcha.png?w=800&h=529&tok=fda8bb
.. |ssp_change_fulloptions.png| image:: ../_media/documentation/self-service-password/0.4/ssp_change_fulloptions.png?w=108&h=120&tok=8e3a79
   :class: tn
   :width: 108px
   :height: 120px
   :target: ../_media/documentation/self-service-password/0.4/ssp_change_fulloptions.png?w=541&h=600&tok=a838e5
.. |ssp_change_nooptions.png| image:: ../_media/documentation/self-service-password/0.4/ssp_change_nooptions.png?w=119&h=95&tok=775a64
   :class: tn
   :width: 119px
   :height: 95px
   :target: ../_media/documentation/self-service-password/0.4/ssp_change_nooptions.png?w=800&h=636&tok=77ac88
.. |ssp_resetbyquestions.png| image:: ../_media/documentation/self-service-password/0.4/ssp_resetbyquestions.png?w=119&h=98&tok=855933
   :class: tn
   :width: 119px
   :height: 98px
   :target: ../_media/documentation/self-service-password/0.4/ssp_resetbyquestions.png?w=800&h=653&tok=b80a2c
.. |ssp_resetbytokens.png| image:: ../_media/documentation/self-service-password/0.4/ssp_resetbytokens.png?w=119&h=95&tok=b6fcda
   :class: tn
   :width: 119px
   :height: 95px
   :target: ../_media/documentation/self-service-password/0.4/ssp_resetbytokens.png?w=800&h=636&tok=de4d01
.. |ssp_sendtoken.png| image:: ../_media/documentation/self-service-password/0.4/ssp_sendtoken.png?w=119&h=95&tok=d11184
   :class: tn
   :width: 119px
   :height: 95px
   :target: ../_media/documentation/self-service-password/0.4/ssp_sendtoken.png?w=800&h=636&tok=cf2cb6
.. |ssp_setquestions.png| image:: ../_media/documentation/self-service-password/0.4/ssp_setquestions.png?w=119&h=95&tok=153cf5
   :class: tn
   :width: 119px
   :height: 95px
   :target: ../_media/documentation/self-service-password/0.4/ssp_setquestions.png?w=800&h=636&tok=fe5e92
.. |self_service_password.png| image:: ../_media/documentation/self-service-password/0.3/self_service_password.png?w=120&h=62&tok=f32381
   :class: tn
   :width: 120px
   :height: 62px
   :target: ../_media/documentation/self-service-password/0.3/self_service_password.png?w=800&h=419&tok=938e16
.. |self_service_password_1266273082544.png| image:: ../_media/documentation/self-service-password/0.3/self_service_password_1266273082544.png?w=120&h=36&tok=9e322c
   :class: tn
   :width: 120px
   :height: 36px
   :target: ../_media/documentation/self-service-password/0.3/self_service_password_1266273082544.png?w=800&h=242&tok=097138
.. |self_service_password_1266273139157.png| image:: ../_media/documentation/self-service-password/0.3/self_service_password_1266273139157.png?w=120&h=61&tok=d9656a
   :class: tn
   :width: 120px
   :height: 61px
   :target: ../_media/documentation/self-service-password/0.3/self_service_password_1266273139157.png?w=800&h=408&tok=0e3096
.. |self_service_password_1266273215596.png| image:: ../_media/documentation/self-service-password/0.3/self_service_password_1266273215596.png?w=120&h=81&tok=04fc9b
   :class: tn
   :width: 120px
   :height: 81px
   :target: ../_media/documentation/self-service-password/0.3/self_service_password_1266273215596.png?w=800&h=543&tok=328afd
.. |image17| image:: ../lib/exe/indexer.php?id=documentation:self-service-password&1630081866
   :width: 2px
   :height: 1px
