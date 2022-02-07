************
File to LDIF
************

Presentation
============

This script can map any CSV field or LDIF entries attributes to one or more LDIF entries attributes, with specific rules for DN generation and multi-values management.

This is written in Perl and uses:

     * Net::LDAP::LDIF
     * Text::CSV (only if CSV as input file)
     * Text::Unaccent (only if (fmail) macro is used)

Configuration
=============

You have to edit the script to modify the configuration:

.. code-block:: console

   $ vi file2ldif.pl

Parameters are:

    * ``csv_delimiter``: separator of CSV fields
    * ``csv_strip_headers``: set to 1 if CSV file has columns name at first line
    * ``beginc``: begin delimiter for field container
    * ``endc``: end delimiter for field container
    * ``map``: all task and mapping rules (see below)

You can define tasks to manage different CSV file structures. For example you can have one CSV file for users and another for groups. So the task name is the first level in the hash map, such as *"person"* and *"group"* in this example:

::

    my $map => {
        person => { ... }
        group => { ... }
    };

The task name is important because it will be used as a command line parameter to the script.

Then, in each task, you will define the mapping with the `Net::LDAP::Entry <https://metacpan.org/dist/perl-ldap/view/lib/Net/LDAP/Entry.pod>`_ syntax.

You will map fields with ``{i}``, i being the field number for CSV, and the attribute name for LDIF (you can adjust begin and end delimiter in parameters $beginc and $endc).

CSV example
-----------

If you have a CSV file with 3 columns, you can use {0}, {1} and {2} to map them. Here are two CSV file examples:

* ``example-users.csv``::

    Login;"First Name";"Last Name"
    coudot;Clément;OUDOT
    jclarke;Jonathan;CLARKE

* ``example-groups.csv``::

    Group name;Default member
    group1;coudot
    group2;jclarke

Below is a sample configuration to parse those files::

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

LDIF example
------------

Here is a sample entry from an LDIF extract of users:

::

    dn: cn=clide,ou=users,dc=acme,dc=com
    objectClass: top
    objectClass: person
    cn: clide
    sn: barrow
    employeeType: gangster

You can create one task to reformat the user entry, and another to add the user in a group (whose name depends on *employeeType* attribute)::

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

Change operations
=================

By default, generated LDIF uses a ``changetype: add``, this means you want to add complete entries.

You can set a third command line parameter to use other changetypes:

     * modify
     * delete
     * modrdn

In ``modify`` case, you can add the ``change_op`` field inside a task to determine which change operation will be performed:

     * add
     * delete
     * replace

Macros
======

You can use macros in mapping, for example to lower-case values.

Available macros are:

     * ``lc``: lower case
     * ``lcfirst``: lower case first letter
     * ``uc``: upper case
     * ``ucfirst``: upper case first letter
     * ``ucfirstlc``: lower case all and upper case fisrt letter
     * ``fmail``: format string to fit mail address (lower case, replace spaces by ``-`` and remove accents)

Example::

    $map => {
        person => {
            change_op => replace,
            dn => 'uid={(lc)uid},ou=users,dc=example,dc=com,
            mail => '{(fmail)givenname}.{(fmail}sn}@example.com',
        }
    };

Run
===

You can run the script like this:

.. code-block:: console

   $ perl file2ldif.pl <taskname> <file> <changetype>

It will produce a ``taskname.ldif`` file.

For our CSV examples, this will be:

.. code-block:: console

   $ perl file2ldif.pl person example-users.csv
   $ perl file2ldif.pl group example-groups.csv

And resulting LDIF are:

* person.ldif::

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

* group.ldif::

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

Real life use cases
===================

Create test entries
-------------------

Imagine you want to create 1000 test entries with different login and password.

First, use a simple loop to generate a CSV file:

.. code-block:: console

   $ echo "login;password" > test-users.csv
   $ for i in `seq 1 1000`; do echo "user$i;password$i" >>  test-users.csv; done

Then configure the mapping in ``file2ldif.pl`` script::

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

.. code-block:: console

   $ perl file2ldif.pl test test-users.csv

Add the users in you directory:

.. code-block:: console

   $ ldapadd -D cn=manager,dc=example,dc=com -W -f test.ldif 

Replace an attribute for all users
----------------------------------

Imagine you want to change to employeeType value of some users from *"gangster"* to *"cop"*.

First you will get an LDIF of concerned users:

.. code-block:: console

   $ ldapsearch -b ou=users,dc=example,dc=com '(employeeType=gangster)' -LLL > gangsters.ldif

Then configure the mapping in file2ldif.pl script::

    my $map = {
        justice => {
            change_op => 'replace',
            dn => '{dn}',
            employeeType => 'cop',
        },
    };

And run:

.. code-block:: console

   $ perl file2ldif.pl justice gangsters.ldif modify

Apply changes in your directory:

.. code-block:: console

   $ ldapmodify -D cn=manager,dc=example,dc=com -W -f justice.ldif 


.. include:: download-scripts.rst

