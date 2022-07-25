*****************************************
Install OpenLDAP LTB for Red-Hat / CentOS
*****************************************

Installation
============

Declare YUM repository
----------------------

.. tip::
   Yum repositories are available for this release versions ($releasever):

   * 7/7Server
   * 8/8Server

Configure the yum repository:

.. code-block:: console

    # vi /etc/yum.repos.d/ltb-project.repo

* For OpenLDAP 2.4:

::

    [ltb-project]
    name=LTB project packages
    baseurl=https://ltb-project.org/rpm/$releasever/$basearch
    enabled=1
    gpgcheck=1
    gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-LTB-project

* For OpenLDAP 2.5:

::

    [ltb-project]
    name=LTB project packages
    baseurl=https://ltb-project.org/rpm/openldap25/$releasever/$basearch
    enabled=1
    gpgcheck=1
    gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-LTB-project

* For OpenLDAP 2.6:

::

    [ltb-project]
    name=LTB project packages
    baseurl=https://ltb-project.org/rpm/openldap26/$releasever/$basearch
    enabled=1
    gpgcheck=1
    gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-LTB-project

Import GPG key
--------------

The public key can be downloaded here: `GPG key <_static/RPM-GPG-KEY-LTB-project>`_.

To import this key:

.. code-block:: console

    # rpm --import https://ltb-project.org/documentation/_static/RPM-GPG-KEY-LTB-project

Install packages
----------------

You are now ready to install:

.. code-block:: console

    # yum install openldap-ltb openldap-ltb-contrib-overlays openldap-ltb-mdb-utils

See :doc:`OpenLDAP packages<openldap-packages>` to know available packages.

Manual download
---------------

You can download the RPMs here: `Download <https://ltb-project.org/download>`_.

The public key can be downloaded here: `GPG key <_static/RPM-GPG-KEY-LTB-project>`_.

To import this key:

.. code-block:: console

    # rpm --import https://ltb-project.org/documentation/_static/RPM-GPG-KEY-LTB-project


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

