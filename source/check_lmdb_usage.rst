****************
Check LMDB Usage
****************

Presentation
============

This plugin checks percent of pages used and pages free in an LMDB database.

The calculation is based on this formula:

.. image:: images/mdb_stat.png
   :alt: mdb_stat graphic
   :align: center

.. math::

$$really\\,used = \\frac{ pages\\,used - pages\\,free}{max\\,pages}$$

For example:

.. code-block:: console

    $ perl check_lmdb_usage.pl -H /usr/local/openldap/var/openldap-data -w 30 -c 20 -r
    OK - 65% pages used / 34% pages free

With performance data, it allows to create graph to follow evolution of this indicator.

Configuration
=============

Required Perl modules:

    * Getopt::Std
    * File::Basename

You also require the mdb_stat utility.

Usage
=====

.. code-block:: console

    $ perl check_lmdb_usage.pl -H <db_home> [-S <mdb_stat>] [-h] [-v] [-V]

Mandatory Options

-H    Home of MDB files
-w    Warning threshold in percent
-c    Critical threshold in percent

Other options

-S    Path to mdb_stat utility
-v    Verbose
-V    Print version and exit
-h    Print help and exit
-f    Performance data
-r    Reverse mode, use warning and critical levels for free pages instead of used pages

.. include:: download-plugins.rst

