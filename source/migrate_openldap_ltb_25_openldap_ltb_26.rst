***************************************************
Migration from OpenLDAP LTB 2.5 to OpenLDAP LTB 2.6
***************************************************

Follow the steps below to migrate from OpenLDAP 2.5 to OpenLDAP 2.6.

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

Then update package repository configuration, to use the ``openldap26`` repository.

* For Debian:

.. code-block:: ini

    deb [arch=amd64] https://ltb-project.org/debian/openldap26/bullseye bullseye main

* For Debian (Trixie)

.. code-block:: ini

   Types: deb
   URIs: https://ltb-project.org/debian/openldap26/trixie
   Suites: trixie
   Components: main
   Signed-By: /etc/apt/trusted.gpg.d/ltb-project-debian-keyring.gpg
   Architectures: amd64

.. note::
   OpenLDAP 2.6 is available for the following debian releases: Buster, Bullseye, Bookworm, Trixie and newer.

* For CentOS:

.. code-block:: ini

    [ltb-project]
    name=LTB project packages
    baseurl=https://ltb-project.org/rpm/openldap26/$releasever/$basearch
    enabled=1
    gpgcheck=1
    gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-LTB-project

Upgrade to latest version:

* For Debian:

.. code-block:: console

    apt update && apt upgrade

* For CentOS:
 
.. code-block:: console

    yum update

OpenLDAP 2.6 packages should now be installed

Configuration
=============

In the initial config block ``dn: cn=config`` add the following:

.. code-block:: console

   olcLogFile: /var/log/slapd-ltb/slapd.log
   olcLogFileOnly: TRUE
   olcLogFileRotate: 30 1024 24
   olcLogFileFormat: syslog-localtime                       

Remove the lastbind module as it is not longer needed.

.. code-block:: console

   olcModuleLoad: {1}lastbind

Remove the entire lastbind overlay block that is present.

.. code-block:: console

   dn: olcOverlay={3}lastbind,olcDatabase={1}mdb,cn=config
   objectClass: top
   objectClass: olcConfig
   objectClass: olcLastBindConfig
   objectClass: olcOverlayConfig
   olcOverlay: {3}lastbind
   olcLastBindPrecision: 1
   structuralObjectClass: olcLastBindConfig
   entryUUID: 1a2b3c4d-5e6f-7890-1a2b-3c4d5e6f7g8h
   creatorsName: cn=config
   createTimestamp: 19700101000000Z
   entryCSN: 19700101000000.000000Z#000000#000#000000
   modifiersName: cn=config
   modifyTimestamp: 19700101000000Z

Add the following line in ``dn: olcDatabase`` for ``mdb``.

.. code-block:: console

   olcLastBind: TRUE
   olcLastBindPrecision: 1

Replace ``authTimestamp`` with ``pwdLastSuccess`` in user data.

.. code-block:: console

   sed -i -e 's/authTimestamp/pwdLastSuccess/g' openldap-data-<date>.ldif

Applying the changes
====================

Restore the updated configuration:

.. code-block:: console

    slapd-cli restoreconfig

Restore data from the backup done at first step:

.. code-block:: console

    slapd-cli restore

The systemd service name has changed from ``slapd`` to ``slapd-ltb`` in slapd-cli v2.8, you can now get the status with:

.. code-block:: console

    systemctl status slapd-ltb

