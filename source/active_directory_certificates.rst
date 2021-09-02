************************************
Manage Active Directory certificates
************************************

.. NOTE::
   Certificate is mandatory to use LDAPS with Active Directory

Create a certificate
====================

Documentation from `<http://confluence.atlassian.com/display/CROWD/Configuring+an+SSL+Certificate+for+Microsoft+Active+Directory>`_

    1. Using the Active Directory Control Panel – Add/Remove Programs administration tool:

        * Select ``Add/Remove Windows Components`` to start the Windows Components Wizard.
        * Place check marks next to ``Certificate Services`` and ``Internet Information Services (IIS)``.
        * Click ``Next>``.

    2. Select ``Enterprise root CA`` Certificate Authority Type and click ``Next>``.
    3. Enter a ``CA name`` (server name) and click ``Next>``. On Windows Server 2003, this is the ``Common name for this CA``.
    4. Leave the ``Data Storage Locations`` as default and click ``Next>``.
    5. The software installation process is complete. Click ``Finish``.

Update a certificate
====================

When AD certificate will expire, you probably want to udpate it with the same key.

To do this:

    1. Click ``Start`` → ``run`` → ``mmc``
    2. In MMC click ``Console`` → ``Add snap-in`` → ``Add`` → ``Certificates`` → ``Add`` → ``Computer Account`` → ``Next`` → ``Finish``
    3. Expand Certificates (Local Computer)
    4. Go in branch ``Personal``
    5. Select the current certificate
    6. Right click on it → ``All tasks`` → ``Generate with the same key``

.. WARNING::
   You must restart Active Directory server to use the new certificate for LDAP service (yes it's a shame)

