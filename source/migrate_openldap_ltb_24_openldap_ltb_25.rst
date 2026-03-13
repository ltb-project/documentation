***************************************************
Migration from OpenLDAP LTB 2.4 to OpenLDAP LTB 2.5
***************************************************

Migration from OpenLDAP 2.4 to OpenLDAP 2.5 is quite easy.
Here is a step by step documentation to follow if you are using LTB packages.

Backup
======

Use ``slapd-cli`` to backup data and configuration:

.. code-block:: console

    slapd-cli backup
    slapd-cli backupconfig

Deploy new version
==================

First, stop OpenLDAP process:

.. code-block:: console

    systemctl stop slapd

Then update package repository configuration, to use the ``openldap25`` repository.

* For Debian:

.. code-block:: ini

    deb [arch=amd64] https://ltb-project.org/debian/openldap25/bullseye bullseye main

* For CentOS:

.. code-block:: ini

    [ltb-project]
    name=LTB project packages
    baseurl=https://ltb-project.org/rpm/openldap25/$releasever/$basearch
    enabled=1
    gpgcheck=1
    gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-LTB-project

If ``openldap-ltb-ppm`` package is installed, remove it, as ``ppm`` will now be included in ``openldap-ltb-contrib-overlays`` package.

* For Debian:

.. code-block:: console

    apt remove openldap-ltb-ppm

* For CentOS:
 
.. code-block:: console

    yum remove openldap-ltb-ppm

And upgrade to latest version:

* For Debian:

.. code-block:: console

    apt update && apt upgrade

* For CentOS:
 
.. code-block:: console

    yum update

OpenLDAP 2.5 packages should now be installed

Configuration
=============

Some changes are required in your configuration, depending on which feature to you use.

Edit the configuration backup LDIF file you generated at the first step:

* Remove built-in schema definition in ``cn=schema,cn=config`` entry, keep only the 3 first lines:

.. code-block:: console

   dn: cn=schema,cn=config
   objectClass: olcSchemaConfig
   cn: schema

* Remove ``ppolicy`` schema if present (it will now be loaded by the overlay), but do not remove the overlay if it was already in your configuration
* Replace parameter ``olcMirrorMode`` by ``olcMultiProvider``
* Replace BDB/HDB configuration by MDB if you were still using these backends
* Load all backends and overlays in ``cn=modules,cn=config`` (they are no more compiled in the slapd binary), for example:

.. code-block:: console

   dn: cn=module{0},cn=config
   objectClass: olcModuleList
   cn: module{0}
   olcModulePath: /usr/local/openldap/lib64/:/usr/local/openldap/libexec/openldap/
   olcModuleLoad: {0}lastbind
   olcModuleLoad: {1}pw-sha2
   olcModuleLoad: {2}pw-pbkdf2
   olcModuleLoad: {4}ppolicy
   olcModuleLoad: {5}back_mdb
   olcModuleLoad: {6}dynlist
   olcModuleLoad: {7}syncprov

* Remove ``explockout`` overlay if you used it and configure ``pwdMinDelay`` and ``pwdMaxDelay`` in your password policy definition.

Restore the updated configuration:

.. code-block:: console

    slapd-cli restoreconfig

Data
====

Restore data from the backup done at first step:

.. code-block:: console

    slapd-cli restore

Check the service
=================

The systemd service name has changed from ``slapd`` to ``slapd-ltb``, you can now get the status with:

.. code-block:: console

    systemctl status slapd-ltb

