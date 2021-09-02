**************************************
OpenLDAP packages for Red-Hat / CentOS
**************************************

Introduction

LTB project provides 7 RPMs:

    BerkeleyDB
    OpenLDAP
    OpenLDAP contributed overlays
    Check password policy module - check_password (deprecated)
    Password policy module - ppm
    Overlay explockout
    OpenLDAP debuginfo

We try to keep package up to date with the latest OpenLDAP version.

Our RPMs includes:

    SSL/TLS with OpenSSL
    SASL (including SASL passwords)
    All overlays
    HDB/BDB backend
    MDB backend
    LDAP backend
    META backend
    SOCK backend
    SLAPI support
    CRYPT password
    TCP wrappers
    LTB-project OpenLDAP init script
    LTB project check_password
    LTB project ppm
    Overlay explockout
    Logrotate script
    Preconfigured DB_CONFIG
    MDB utils
    Schema expose (SLAP_SCHEMA_EXPOSE)
    ARGON2, SHA2 and PBKDF2 password schemes
    Contributed overlays:
        lastbind
        smbk5pwd (without Heimdal Kerberos support)
        autogroup
        nssov
        noosrch

The installation is done under /usr/local, in order to avoid conflicts with existing OpenLDAP installation. In particular, we do not touch the ldap system libraries, which are linked in by many other programs.
Installation
Yum repository
Yum repositories are available for this release versions ($releasever):

    5/5Server (deprecated)
    6/6Server (deprecated since 2.4.52)
    7/7Server
    8/8Server

Configure the yum repository :

# vi /etc/yum.repos.d/ltb-project.repo

[ltb-project]
name=LTB project packages
baseurl=https://ltb-project.org/rpm/$releasever/$basearch
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-LTB-project

Then update:

# yum update

The public key can be downloaded here: https://ltb-project.org/lib/RPM-GPG-KEY-LTB-project

To import this key:

# rpm --import https://ltb-project.org/lib/RPM-GPG-KEY-LTB-project

You are now ready to install:

# yum install openldap-ltb

Manual download

You can download the RPMs here: Download.

The public key can be downloaded here: https://ltb-project.org/lib/RPM-GPG-KEY-LTB-project

To import this key:

# rpm --import https://ltb-project.org/lib/RPM-GPG-KEY-LTB-project

Just run this command to install them (with dependency management):

# yum localinstall berkeleydb-ltb* openldap-ltb*

Rebuild RPMs

You can download the source rpm to build your own OpenLDAP RPMs.

Install source RPMs:

# rpm -Uvh openldap-ltb-VERSION.src.rpm

Do your job and rebuild RPMs:

# cd /usr/src/rpm
# rpmbuild -ba SPECS/openldap-ltb.spec

