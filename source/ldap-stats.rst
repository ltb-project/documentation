*******************
OpenLDAP statistics
*******************

Presentation
============

The ``ldap-stats.pl`` script will parse OpenLDAP log files and print some statistics:

     * Total operations
     * Total connections
     * Total authentication failures
     * Total binds
     * Total unbinds
     * Total searches
     * Total compares
     * Total modifications
     * Total modrdns
     * Total additions
     * Total deletions
     * Unindexed attribute requests
     * Operations per connection
     * Client hostname list
     * Repartition per hours / days / months
     * Search bases list
     * Filters list
     * Searched attributes list
     * Bind DN list

This script requires ``Getopt::Long`` perl module.

You must configure OpenLDAP with ``loglevel stats`` (``olcLogLevel stats`` for cn=config) to get the right log lines expected by this script.

Usage
=====

Run the script on one or many log files:

.. code-block:: console

   $ ldap-stats.pl [ -s ] [ -c <count> ] [ -l <count> ] [ -h ] <logfile> ...

Options:

-c <count>               Number of lines to display for each report [25]
-d                       Display all available days in the day of month report
-h                       Display a usage help screen
-l <count>               Print status message after processing <count> lines [0]
-m                       Display all available months in the month of year report
-n                       Resolve IP addresses to hostnames
-o <ops>                 Operations to print in the reports [ALL] (multiple ``-o <ops>`` are allowed)


.. TIP::
   Valid operations are: ``CONNECT``, ``FAILURES``, ``BIND``, ``UNBIND``, ``SRCH``, ``CMP``, ``ADD``, ``MOD``, ``MODRDN``, ``DEL`` Predefined reports are: ``ALL``, ``READ``, ``WRITE``

-s                       Split attributes found used in searches
-D                       Use RFC5424 date format

Sample output
=============

::

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


