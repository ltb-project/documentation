************************************
Manage Active Directory certificates
************************************

Certificate is mandatory to use LDAPS with Active Directory
Create a certificate

Documentation from http://confluence.atlassian.com/display/CROWD/Configuring+an+SSL+Certificate+for+Microsoft+Active+Directory

    Using the Active Directory Control Panel – Add/Remove Programs administration tool:
        Select Add/Remove Windows Components to start the Windows Components Wizard.
        Place check marks next to Certificate Services and Internet Information Services (IIS).
        Click Next>.
    Select Enterprise root CA Certificate Authority Type and click Next>.
    Enter a CA name (server name) and click Next>. On Windows Server 2003, this is the Common name for this CA.
    Leave the Data Storage Locations as default and click Next>.
    The software installation process is complete. Click Finish.

Update a certificate

When AD certificate will expire, you probably want to udpate it with the same key.

To do this:

    Click Start → run → mmc
    In MMC click Console → Add snap-in → Add → Certificates → Add → Computer Account → Next → Finish
    Expand Certificates (Local Computer)
    Go in branch Personal
    Select the current certificate
    Right click on it → All tasks → Generate with the same key

You must restart Active Directory server to use the new certificate for LDAP service (yes it's a shame)

