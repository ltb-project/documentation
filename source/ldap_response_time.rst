========================================
LDAP response time [LDAP Tool Box (LTB)]
========================================

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
            `Documentation <../../documentation>`__ » `cacti-plugins`_ »
            `LDAP response time`_

         --------------

      documentation:cacti-plugins:ldap_response_time

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

                              `Download <ldap_response_time#download>`__

                        -  

                           .. container:: li

                              `Installation`_

                        -  

                           .. container:: li

                              `Configuration`_

                        -  

                           .. container:: li

                              `Data source creation`_

                        -  

                           .. container:: li

                              `Graph creation`_

               .. rubric:: LDAP response time
                  :name: ldap_response_time
                  :class: sectionedit1

               .. container:: level1

               .. rubric:: Presentation
                  :name: presentation
                  :class: sectionedit2

               .. container:: level2

                  This Cacti script measures LDAP response times on 3
                  operations:

                  -  

                     .. container:: li

                        A bind

                  -  

                     .. container:: li

                        A search on the RootDSE

                  -  

                     .. container:: li

                        A search on a naming context

                  Here is a generated graph example:

                  |image1|

               .. rubric:: Download
                  :name: download
                  :class: sectionedit3

               .. container:: level2

                  This plugin, along with all other Cacti plugins from
                  this site, can be `downloaded`_ in a single archive.

               .. rubric:: Installation
                  :name: installation
                  :class: sectionedit4

               .. container:: level2

                  You have to copy the perl script in Cacti scripts
                  directory (for example /usr/share/cacti/site/scripts/
                  on Debian):

                  .. code:: code

                     $ cp ldap_response_time.pl /usr/share/cacti/site/scripts/

                  Then go on Cacti administration panel and choose
                  “Import template”. Select the XML local file shipped
                  with the script and “save”.

               .. rubric:: Configuration
                  :name: configuration
                  :class: sectionedit5

               .. container:: level2

                  You can edit the values of command line parameters by
                  modifying the Data source template.

                  Choose “Data Templates” and click on “LDAP - response
                  time”. You can see at the bottom the “Custom Data”
                  table. Parameters are:

                  -  

                     .. container:: li

                        Host or IP

                  -  

                     .. container:: li

                        Port

                  -  

                     .. container:: li

                        Connection account: anonymous bind if not
                        defined

                  -  

                     .. container:: li

                        Connection password

                  -  

                     .. container:: li

                        Timeout

                  -  

                     .. container:: li

                        LDAP protocol version

                  -  

                     .. container:: li

                        Suffix: “auto” means the script will discover
                        the naming context from the rootDSE. You can
                        also specify one naming context here (for
                        example dc=example,dc=com), or use “none” to
                        disable searching on the suffix (useful for LDAP
                        proxies).

               .. rubric:: Data source creation
                  :name: data_source_creation
                  :class: sectionedit6

               .. container:: level2

                  In the Cacti admin panel, choose “Data Sources” and
                  click on “Add”.

                  Select the “LDAP - response time” Data template, the
                  host, and “save”.

               .. rubric:: Graph creation
                  :name: graph_creation
                  :class: sectionedit7

               .. container:: level2

                  In the Cacti admin panel, choose “Graph Management”
                  and click on “Add”.

                  Select the “LDAP - response time” Graph template, the
                  host, associate the data sources and “save”.

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

.. _Home: ../../start
.. _Documentation: ../../documentation
.. _Download: ../../download
.. _Community: ../../community
.. _Login: ldap_response_time?do=login&sectok=39fb3f9b54a1ecdb3c46340f395d6940
.. _Welcome on LDAP Tool Box project: ../../start
.. _cacti-plugins: https://ltb-project.org/documentation/cacti-plugins/start
.. _LDAP response time: ldap_response_time
.. _Presentation: ldap_response_time#presentation
.. _Installation: ldap_response_time#installation
.. _Configuration: ldap_response_time#configuration
.. _Data source creation: ldap_response_time#data_source_creation
.. _Graph creation: ldap_response_time#graph_creation
.. _downloaded: ../../download#monitoring
.. _: javascript:void(0)
.. _CC Attribution-Noncommercial-Share Alike 3.0 Unported: http://creativecommons.org/licenses/by-nc-sa/3.0/

.. |LDAP Tool Box (LTB)| image:: ../../_media/wiki/logo.png
   :class: pull-left
   :name: dw__logo
   :width: 32px
   :height: 32px
   :target: ../../start
.. |image1| image:: ../../_media/documentation/cacti-plugins/openldap_response_time.png
   :class: media
   :target: ../../_detail/documentation/cacti-plugins/openldap_response_time.png?id=documentation:cacti-plugins:ldap_response_time
.. |image2| image:: ../../lib/exe/indexer.php?id=documentation:cacti-plugins:ldap_response_time&1630081866
   :width: 2px
   :height: 1px
