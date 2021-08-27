====================================================
OpenLDAP operations statistics [LDAP Tool Box (LTB)]
====================================================

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
            `OpenLDAP operations statistics`_

         --------------

      documentation:cacti-plugins:openldap_operations

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

                              `Download <openldap_operations#download>`__

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

               .. rubric:: OpenLDAP operations statistics
                  :name: openldap_operations_statistics
                  :class: sectionedit1

               .. container:: level1

               .. rubric:: Presentation
                  :name: presentation
                  :class: sectionedit2

               .. container:: level2

                  This Cacti script displays the number of initiated
                  LDAP operations on an OpenLDAP server:

                  -  

                     .. container:: li

                        abandon

                  -  

                     .. container:: li

                        bind

                  -  

                     .. container:: li

                        unbind

                  -  

                     .. container:: li

                        compare

                  -  

                     .. container:: li

                        search

                  -  

                     .. container:: li

                        add

                  -  

                     .. container:: li

                        delete

                  -  

                     .. container:: li

                        modify

                  -  

                     .. container:: li

                        modrdn

                  -  

                     .. container:: li

                        extended

                  It uses statistics collected in OpenLDAP Monitor
                  backend (*cn=monitor*).

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

                  You have to copy the Perl script in the Cacti scripts
                  directory (for example /usr/share/cacti/site/scripts/
                  on Debian):

                  .. code:: code

                     $ cp openldap_operations.pl /usr/share/cacti/site/scripts/

                  Then go to the Cacti administration panel and choose
                  “Import template”. Select the XML local file shipped
                  with the script and “save”.

               .. rubric:: Configuration
                  :name: configuration
                  :class: sectionedit5

               .. container:: level2

                  You can edit the values of command line parameters by
                  modifying the Data source template.

                  Choose “Data Templates” and click on “LDAP - initiated
                  operations”. You can see at the bottom the “Custom
                  Data” table. Parameters are:

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

               .. rubric:: Data source creation
                  :name: data_source_creation
                  :class: sectionedit6

               .. container:: level2

                  In the Cacti admin panel, choose “Data Sources” and
                  click on “Add”.

                  Select the “LDAP - initiated operations” Data
                  template, the host, and “save”.

               .. rubric:: Graph creation
                  :name: graph_creation
                  :class: sectionedit7

               .. container:: level2

                  In the Cacti admin panel, choose “Graph Management”
                  and click on “Add”.

                  Select the “LDAP - initiated operations” Graph
                  template, the host, associate the data sources and
                  “save”.

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
.. _Login: openldap_operations?do=login&sectok=39fb3f9b54a1ecdb3c46340f395d6940
.. _Welcome on LDAP Tool Box project: ../../start
.. _cacti-plugins: https://ltb-project.org/documentation/cacti-plugins/start
.. _OpenLDAP operations statistics: openldap_operations
.. _Presentation: openldap_operations#presentation
.. _Installation: openldap_operations#installation
.. _Configuration: openldap_operations#configuration
.. _Data source creation: openldap_operations#data_source_creation
.. _Graph creation: openldap_operations#graph_creation
.. _downloaded: ../../download#monitoring
.. _: javascript:void(0)
.. _CC Attribution-Noncommercial-Share Alike 3.0 Unported: http://creativecommons.org/licenses/by-nc-sa/3.0/

.. |LDAP Tool Box (LTB)| image:: ../../_media/wiki/logo.png
   :class: pull-left
   :name: dw__logo
   :width: 32px
   :height: 32px
   :target: ../../start
.. |image1| image:: ../../_media/documentation/cacti-plugins/openldap_operations.png
   :class: media
   :target: ../../_detail/documentation/cacti-plugins/openldap_operations.png?id=documentation:cacti-plugins:openldap_operations
.. |image2| image:: ../../lib/exe/indexer.php?id=documentation:cacti-plugins:openldap_operations&1630081866
   :width: 2px
   :height: 1px
