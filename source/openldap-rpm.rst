**************************************
OpenLDAP packages for Red-Hat / CentOS
**************************************

Introduction
------------

.. include:: openldap-packages.rst

Installation
------------


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

