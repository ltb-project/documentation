=========================================
OpenLDAP statistics [LDAP Tool Box (LTB)]
=========================================

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
            `OpenLDAP statistics`_

         --------------

      documentation:ldap-scripts:ldap-stats

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

                              `Sample output`_

               .. rubric:: OpenLDAP statistics
                  :name: openldap_statistics
                  :class: sectionedit1

               .. container:: level1

               .. rubric:: Presentation
                  :name: presentation
                  :class: sectionedit2

               .. container:: level2

                  The ldap-stats.pl script will parse OpenLDAP log files
                  and print some statistics:

                  -  

                     .. container:: li

                        Total operations

                  -  

                     .. container:: li

                        Total connections

                  -  

                     .. container:: li

                        Total authentication failures

                  -  

                     .. container:: li

                        Total binds

                  -  

                     .. container:: li

                        Total unbinds

                  -  

                     .. container:: li

                        Total searches

                  -  

                     .. container:: li

                        Total compares

                  -  

                     .. container:: li

                        Total modifications

                  -  

                     .. container:: li

                        Total modrdns

                  -  

                     .. container:: li

                        Total additions

                  -  

                     .. container:: li

                        Total deletions

                  -  

                     .. container:: li

                        Unindexed attribute requests

                  -  

                     .. container:: li

                        Operations per connection

                  -  

                     .. container:: li

                        Client hostname list

                  -  

                     .. container:: li

                        Repartition per hours / days / months

                  -  

                     .. container:: li

                        Search bases list

                  -  

                     .. container:: li

                        Filters list

                  -  

                     .. container:: li

                        Searched attributes list

                  -  

                     .. container:: li

                        Bind DN list

                  This script requires Getopt::Long perl module.

                  You must configure OpenLDAP with loglevel
                  (olcLogLevel) “stats” to get the right logs lines
                  expected by this script.

               .. rubric:: Usage
                  :name: usage
                  :class: sectionedit3

               .. container:: level2

                  Run the script on one or many log files:

                  .. code:: code

                     $ ldap-stats.pl [ -s ] [ -c <count> ] [ -l <count> ] [ -h ] <logfile> ...

                  Options:

                  -  

                     .. container:: li

                        -c <count> : Number of lines to display for each
                        report [25]

                  -  

                     .. container:: li

                        -d : Display all available days in the day of
                        month report

                  -  

                     .. container:: li

                        -h : Display a usage help screen

                  -  

                     .. container:: li

                        -l <count> : Print status message after
                        processing <count> lines [0]

                  -  

                     .. container:: li

                        -m : Display all available months in the month
                        of year report

                  -  

                     .. container:: li

                        -n : Resolve IP addresses to hostnames

                  -  

                     .. container:: li

                        -o <ops> -o <ops> … : Operations to print in the
                        reports [ALL]

                  .. container:: notetip

                     Valid operations are: CONNECT, FAILURES, BIND,
                     UNBIND, SRCH, CMP, ADD, MOD, MODRDN, DEL Predefined
                     reports are: ALL, READ, WRITE

                  -  

                     .. container:: li

                        -s : Split attributes found used in searches

                  -  

                     .. container:: li

                        -D : Use RFC5424 date format

               .. rubric:: Sample output
                  :name: sample_output
                  :class: sectionedit4

               .. container:: level2

                  .. code:: file

                     Report Generated on Mon Dec 11 14:29:45 2017
                     --------------------------------------------
                     Processed "/var/log/openldap.log":  Dec 11 11:37:16 - Dec 11 12:19:29


                     Operation totals
                     ----------------
                     Total operations              : 18
                     Total connections             : 3
                     Total authentication failures : 1
                     Total binds                   : 2
                     Total unbinds                 : 0
                     Total searches                : 15
                     Total compares                : 0
                     Total modifications           : 1
                     Total modrdns                 : 0
                     Total additions               : 0
                     Total deletions               : 0
                     Unindexed attribute requests  : 0
                     Operations per connection     : 6.00


                     Hostname         Connect Failed    Bind  Unbind   Search   Cmp   Add   Mod ModRDN  Del
                     --------------- -------- ------ ------- ------- -------- ----- ----- ----- ------ ----
                     127.0.0.1              3      1       2       0       15     0     0     1      0    0


                     Hour of Day    Connect Failed    Bind  Unbind   Search   Cmp   Add   Mod ModRDN  Del
                     ------------- -------- ------ ------- ------- -------- ----- ----- ----- ------ ----
                     11:00 - 11:59        3      1       2       0       15     0     0     1      0    0


                     Day of Month   Connect Failed    Bind  Unbind   Search   Cmp   Add   Mod ModRDN  Del
                     ------------- -------- ------ ------- ------- -------- ----- ----- ----- ------ ----
                       11                 3      1       2       0       15     0     0     1      0    0


                      Month         Connect Failed    Bind  Unbind   Search   Cmp   Add   Mod ModRDN  Del
                     ------------- -------- ------ ------- ------- -------- ----- ----- ----- ------ ----
                       Dec                3      1       2       0       15     0     0     1      0    0


                     # Searches    Search base
                     ----------    -----------------------------------------------------------
                       3           RootDSE                                                     
                       3           dc=example,dc=com                                           
                       3           cn=subschema                                                
                       2           ou=users,dc=example,dc=com                                  
                       2           uid=coudot,ou=users,dc=example,dc=com                       
                       1           cn=monitor                                                  
                       1           cn=config                                                   


                     # Uses        Filter
                     ----------    -----------------------------------------------------------
                       13          (objectClass=*)                                             
                       2           (objectClass=subschema)                                     


                     # Uses        Attributes explicitly requested in search string
                     ----------    -------------------------------------------------
                       6           hassubordinates objectclass                                 
                       4           * +                                                         
                       1           *                                                           
                       1           subschemasubentry                                           
                       1           objectclasses attributetypes ldapsyntaxes matchingrules matchingruleuse createtimestamp modifytimestamp
                       1           createtimestamp modifytimestamp                             
                       1           namingcontexts subschemasubentry supportedldapversion supportedsaslmechanisms supportedextension supportedcontrol supportedfeatures vendorname vendorversion + objectclass


                     # Binds       Bind DN
                     ----------    --------------------------------------------------------------
                       1           uid=coudot,ou=users,dc=example,dc=com                       
                       1           cn=admin,dc=example,dc=com

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
.. _Login: ldap-stats?do=login&sectok=39fb3f9b54a1ecdb3c46340f395d6940
.. _Welcome on LDAP Tool Box project: ../../start
.. _ldap-scripts: https://ltb-project.org/documentation/ldap-scripts/start
.. _OpenLDAP statistics: ldap-stats
.. _Presentation: ldap-stats#presentation
.. _Usage: ldap-stats#usage
.. _Sample output: ldap-stats#sample_output
.. _: javascript:void(0)
.. _CC Attribution-Noncommercial-Share Alike 3.0 Unported: http://creativecommons.org/licenses/by-nc-sa/3.0/

.. |LDAP Tool Box (LTB)| image:: ../../_media/wiki/logo.png
   :class: pull-left
   :name: dw__logo
   :width: 32px
   :height: 32px
   :target: ../../start
.. |image1| image:: ../../lib/exe/indexer.php?id=documentation:ldap-scripts:ldap-stats&1630081866
   :width: 2px
   :height: 1px
