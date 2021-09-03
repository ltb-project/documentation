**************************************
OpenLDAP packages for Red-Hat / CentOS
**************************************

Introduction
============

.. include:: openldap-packages.rst

Installation
============


Yum repository
--------------

.. TIP::
   Yum repositories are available for this release versions ($releasever):

   * 7/7Server
   * 8/8Server

Configure the yum repository:

.. code-block:: console

    # vi /etc/yum.repos.d/ltb-project.repo

::

    [ltb-project]
    name=LTB project packages
    baseurl=https://ltb-project.org/rpm/$releasever/$basearch
    enabled=1
    gpgcheck=1
    gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-LTB-project

The public key can be downloaded here: `GPG key <_static/RPM-GPG-KEY-LTB-project>`_.

To import this key:

.. WARNING::
    TODO: adapt URL

.. code-block:: console

    # rpm --import https://ltb-project.org/_static/RPM-GPG-KEY-LTB-project

Then update:

.. code-block:: console

    # yum update

You are now ready to install:

.. code-block:: console

    # yum install openldap-ltb


Manual download
---------------

.. WARNING::
    TODO: adapt URL

You can download the RPMs here: `Download <https://ltb-project.org/download>`_.

The public key can be downloaded here: `GPG key <_static/RPM-GPG-KEY-LTB-project>`_.

To import this key:

.. WARNING::
    TODO: adapt URL

.. code-block:: console

    # rpm --import https://ltb-project.org/_static/RPM-GPG-KEY-LTB-project


Just run this command to install them (with dependency management):

.. code-block:: console

    # yum localinstall openldap-ltb*

Rebuild RPMs
============

You can download the source rpm to build your own OpenLDAP RPMs.

Install source RPMs:

.. code-block:: console

    # rpm -Uvh openldap-ltb-VERSION.src.rpm

Do your job and rebuild RPMs:

.. code-block:: console

    # cd /usr/src/rpm
    # rpmbuild -ba SPECS/openldap-ltb.spec

