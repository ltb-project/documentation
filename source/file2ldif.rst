==================================
File to LDIF [LDAP Tool Box (LTB)]
==================================

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
            `File to LDIF`_

         --------------

      documentation:ldap-scripts:file2ldif

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

                              `Configuration`_

                           -  

                              .. container:: li

                                 `CSV example`_

                           -  

                              .. container:: li

                                 `LDIF example`_

                        -  

                           .. container:: li

                              `Change operations`_

                        -  

                           .. container:: li

                              `Macros`_

                        -  

                           .. container:: li

                              `Run`_

                        -  

                           .. container:: li

                              `Real life use cases`_

                           -  

                              .. container:: li

                                 `Create test entries`_

                           -  

                              .. container:: li

                                 `Replace an attribute for all users`_

               .. rubric:: File to LDIF
                  :name: file_to_ldif
                  :class: sectionedit1

               .. container:: level1

               .. rubric:: Presentation
                  :name: presentation
                  :class: sectionedit2

               .. container:: level2

                  This script can map any CSV field or LDIF entries
                  attributes to one or more LDIF entries attributes,
                  with specific rules for DN generation and multi-values
                  management.

                  This is written in Perl and uses:

                  -  

                     .. container:: li

                        Net::LDAP::LDIF

                  -  

                     .. container:: li

                        Text::CSV (only if CSV as input file)

                  -  

                     .. container:: li

                        Text::Unaccent (only if (fmail) macro is used)

               .. rubric:: Configuration
                  :name: configuration
                  :class: sectionedit3

               .. container:: level2

                  You have to edit the script to modify the
                  configuration:

                  .. code:: code

                     $ vi file2ldif.pl

                  Parameters are:

                  -  

                     .. container:: li

                        csv_delimiter: separator of CSV fields

                  -  

                     .. container:: li

                        csv_strip_headers: set to 1 if CSV file has
                        columns name at first line

                  -  

                     .. container:: li

                        beginc: begin delimiter for field container

                  -  

                     .. container:: li

                        endc: end delimiter for field container

                  -  

                     .. container:: li

                        map: all task and mapping rules (see below)

                  You can define tasks to manage different CSV file
                  structures. For example you can have one CSV file for
                  users and another for groups. So the task name is the
                  first level in the hash map, such as “person” and
                  “group” in this example:

                  .. code:: file

                     my $map => {
                         person => { ... }
                         group => { ... }
                     };

                  The task name is important because it will be used as
                  a command line parameter to the script.

                  Then, in each task, you will define the mapping with
                  the `Net::LDAP::Entry`_ syntax.

                  You will map fields with {i}, i being the field number
                  for CSV, and the attribute name for LDIF (you can
                  adjust begin and end delimiter in parameters $beginc
                  and $endc).

               .. rubric:: CSV example
                  :name: csv_example
                  :class: sectionedit4

               .. container:: level3

                  If you have a CSV file with 3 columns, you can use
                  {0}, {1} and {2} to map them. Here are two CSV file
                  examples:

                  -  

                     .. container:: li

                        example-users.csv:

                  .. code:: file

                     Login;"First Name";"Last Name"
                     coudot;Clément;OUDOT
                     jclarke;Jonathan;CLARKE

                  -  

                     .. container:: li

                        example-groups.csv

                  .. code:: file

                     Group name;Default member
                     group1;coudot
                     group2;jclarke

                  Below is a sample configuration to parse those files:

                  .. code:: file

                     my $map = {
                         person => {
                             dn => 'uid={1},ou=users,dc=example,dc=com',
                             objectClass => [ 'top', 'person', 'organizationalPerson', 'inetOrgPerson' ],
                             uid => '{1}',
                             givenName => '{2}',
                             sn => '{3}',
                             cn => '{2} {3}',
                         },
                         group => {
                             dn => 'cn={1},ou=groups,dc=example,dc=com',
                             objectClass => [ 'top', 'groupOfUniqueNames' ],
                             cn => '{1}',
                             uniqueMember => 'uid={2},ou=users,dc=example,dc=com',
                         },
                     };

               .. rubric:: LDIF example
                  :name: ldif_example
                  :class: sectionedit5

               .. container:: level3

                  Here is a sample entry from an LDIF extract of users:

                  .. code:: file

                     dn: cn=clide,ou=users,dc=acme,dc=com
                     objectClass: top
                     objectClass: person
                     cn: clide
                     sn: barrow
                     employeeType: gangster

                  You can create one task to reformat the user entry,
                  and another to add the user in a group (whose name
                  depends on employeeType attribute):

                  .. code:: file

                     my $map = {
                         person => {
                             dn => 'uid={cn},ou=users,dc=example,dc=com',
                             objectClass => [ 'top', 'person', 'organizationalPerson', 'inetOrgPerson' ],
                             uid => '{cn}',,
                             sn => '{(uc)sn}',
                             cn => '{cn}',
                         },
                         group => {
                             change_op => 'add',
                             dn => 'cn={employeeType},ou=groups,dc=example,dc=com',
                             uniqueMember => 'uid={cn},ou=users,dc=example,dc=com',
                         },
                     };

               .. rubric:: Change operations
                  :name: change_operations
                  :class: sectionedit6

               .. container:: level2

                  By default, genertad LDIF uses a changetype 'add',
                  this means you want to add complete entries.

                  You can set a third command line parameter to use
                  other changetypes:

                  -  

                     .. container:: li

                        modify

                  -  

                     .. container:: li

                        delete

                  -  

                     .. container:: li

                        modrdn

                  In 'modify' case, you can add the 'change_op' field
                  inside a task to determine which change oepration will
                  be performed:

                  -  

                     .. container:: li

                        add

                  -  

                     .. container:: li

                        delete

                  -  

                     .. container:: li

                        replace

               .. rubric:: Macros
                  :name: macros
                  :class: sectionedit7

               .. container:: level2

                  You can use macros in mapping, for example to lower
                  case values.

                  Available macros are:

                  -  

                     .. container:: li

                        lc: lower case

                  -  

                     .. container:: li

                        lcfirst: lower case first letter

                  -  

                     .. container:: li

                        uc: upper case

                  -  

                     .. container:: li

                        ucfirst: upper case first letter

                  -  

                     .. container:: li

                        ucfirstlc: lower case all and upper case fisrt
                        letter

                  -  

                     .. container:: li

                        fmail: format string to fit mail address (lower
                        case, replace spaces by '-' and remove accents)

                  Example:

                  .. code:: file

                     $map => {
                         person => {
                             change_op => replace,
                             dn => 'uid={(lc)uid},ou=users,dc=example,dc=com,
                             mail => '{(fmail)givenname}.{(fmail}sn}@example.com',
                         }
                     };

               .. rubric:: Run
                  :name: run
                  :class: sectionedit8

               .. container:: level2

                  You can run the script like this:

                  .. code:: code

                     $ perl file2ldif.pl <taskname> <file> <changetype>

                  It will produce a *taskname*.ldif file.

                  For our CSV examples, this will be:

                  .. code:: code

                     $ perl file2ldif.pl person example-users.csv
                     $ perl file2ldif.pl group example-groups.csv

                  And resulting LDIF are:

                  -  

                     .. container:: li

                        person.ldif:

                  .. code:: file

                     dn: uid=coudot,ou=users,dc=example,dc=com
                     uid: coudot
                     cn:: Q2zDqW1lbnQgT1VET1Q=
                     sn: OUDOT
                     objectClass: top
                     objectClass: person
                     objectClass: organizationalPerson
                     objectClass: inetOrgPerson
                     givenName:: Q2zDqW1lbnQ=

                     dn: uid=jclarke,ou=users,dc=example,dc=com
                     uid: jclarke
                     cn: Jonathan CLARKE
                     sn: CLARKE
                     objectClass: top
                     objectClass: person
                     objectClass: organizationalPerson
                     objectClass: inetOrgPerson
                     givenName: Jonathan

                  -  

                     .. container:: li

                        group.ldif

                  .. code:: file

                     dn: cn=group1,ou=groups,dc=example,dc=com
                     cn: group1
                     uniqueMember: uid=coudot,ou=users,dc=example,dc=com
                     objectClass: top
                     objectClass: groupOfUniqueNames

                     dn: cn=group2,ou=groups,dc=example,dc=com
                     cn: group2
                     uniqueMember: uid=jclarke,ou=users,dc=example,dc=com
                     objectClass: top
                     objectClass: groupOfUniqueNames

               .. rubric:: Real life use cases
                  :name: real_life_use_cases
                  :class: sectionedit9

               .. container:: level2

               .. rubric:: Create test entries
                  :name: create_test_entries
                  :class: sectionedit10

               .. container:: level3

                  Imagine you want to create 1000 test entries with
                  different login and password.

                  First, use a simple loop to generate a CSV file:

                  .. code:: code

                     $ echo "login;password" > test-users.csv
                     $ for i in `seq 1 1000`; do echo "user$i;password$i" >>  test-users.csv; done

                  Then configure the mapping in file2ldif.pl script:

                  .. code:: file

                     my $map = {
                         test => {
                             dn => 'uid={1},ou=users,dc=example,dc=com',
                             objectClass => [ 'top', 'person', 'organizationalPerson', 'inetOrgPerson' ],
                             uid => '{1}',
                             sn => '{1}',
                             cn => '{1}',
                             userPassword => '{2}',
                         },
                     };

                  And run:

                  .. code:: code

                     $ perl file2ldif.pl test test-users.csv

                  Add the users in you directory:

                  .. code:: code

                     $ ldapadd -D cn=manager,dc=example,dc=com -W -f test.ldif 

               .. rubric:: Replace an attribute for all users
                  :name: replace_an_attribute_for_all_users
                  :class: sectionedit11

               .. container:: level3

                  Imagine you want to change to employeeType value of
                  some users from 'gangster' to 'cop'.

                  First you will get an LDIF of concerned users:

                  .. code:: code

                     $ ldapsearch -b ou=users,dc=example,dc=com '(employeeType=gangster)' -LLL > gangsters.ldif

                  Then configure the mapping in file2ldif.pl script:

                  .. code:: file

                     my $map = {
                         justice => {
                             change_op => 'replace',
                             dn => '{dn}',
                             employeeType => 'cop',
                         },
                     };

                  And run:

                  .. code:: code

                     $ perl file2ldif.pl justice gangsters.ldif modify

                  Apply changes in your directory:

                  .. code:: code

                     $ ldapmodify -D cn=manager,dc=example,dc=com -W -f justice.ldif 

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
.. _Login: file2ldif?do=login&sectok=39fb3f9b54a1ecdb3c46340f395d6940
.. _Welcome on LDAP Tool Box project: ../../start
.. _ldap-scripts: https://ltb-project.org/documentation/ldap-scripts/start
.. _File to LDIF: file2ldif
.. _Presentation: file2ldif#presentation
.. _Configuration: file2ldif#configuration
.. _CSV example: file2ldif#csv_example
.. _LDIF example: file2ldif#ldif_example
.. _Change operations: file2ldif#change_operations
.. _Macros: file2ldif#macros
.. _Run: file2ldif#run
.. _Real life use cases: file2ldif#real_life_use_cases
.. _Create test entries: file2ldif#create_test_entries
.. _Replace an attribute for all users: file2ldif#replace_an_attribute_for_all_users
.. _`Net::LDAP::Entry`: http://search.cpan.org/~gbarr/perl-ldap-0.39/lib/Net/LDAP/Entry.pod
.. _: javascript:void(0)
.. _CC Attribution-Noncommercial-Share Alike 3.0 Unported: http://creativecommons.org/licenses/by-nc-sa/3.0/

.. |LDAP Tool Box (LTB)| image:: ../../_media/wiki/logo.png
   :class: pull-left
   :name: dw__logo
   :width: 32px
   :height: 32px
   :target: ../../start
.. |image1| image:: ../../lib/exe/indexer.php?id=documentation:ldap-scripts:file2ldif&1630081866
   :width: 2px
   :height: 1px
