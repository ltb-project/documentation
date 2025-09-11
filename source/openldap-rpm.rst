*****************************************
Install OpenLDAP LTB for Red-Hat / CentOS
*****************************************

Installation
============

Enable the EPEL repository
--------------------------

The LTB packages depend on packages that are only available in the
`EPEL <https://docs.fedoraproject.org/en-US/epel/>`_ repository ("Extra
Packages for Enterprise Linux"). You must enable the EPEL repository before
installing LTB packages.

The `EPEL Quickstart
<https://docs.fedoraproject.org/en-US/epel/#_quickstart>`_ provides
instructions for installing EPEL on RHEL and derivatives.

Declare YUM repository
----------------------

.. tip::
   Yum repositories are available for this release versions ($releasever):

   * 7/7Server
   * 8/8Server
   * 9/9Server (for OpenLDAP >= 2.5 only)
   * 10/10Server (for OpenLDAP >= 2.5 only)

Configure the yum repository:

.. code-block:: console

    # vi /etc/yum.repos.d/ltb-project-openldap.repo

* For OpenLDAP 2.6:

::

    [ltb-project]
    name=LTB project packages
    baseurl=https://ltb-project.org/rpm/openldap26/$releasever/$basearch
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

Import GPG key
--------------

For EL8, EL9 and EL10
~~~~~~~~~~~~~~~~~~~~~

The public key can be downloaded here: `GPG security key <_static/RPM-GPG-KEY-LTB-PROJECT-SECURITY>`_.

To import this key:

.. code-block:: console

    # rpm --import https://ltb-project.org/documentation/_static/RPM-GPG-KEY-LTB-PROJECT-SECURITY

For EL7
~~~~~~~

The public key can be downloaded here: `GPG key <_static/RPM-GPG-KEY-LTB-project>`_.

To import this key:

.. code-block:: console

    # rpm --import https://ltb-project.org/documentation/_static/RPM-GPG-KEY-LTB-project

Install packages
----------------

You are now ready to install:

.. code-block:: console

    # dnf install openldap-ltb openldap-ltb-contrib-overlays openldap-ltb-mdb-utils

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

    # dnf localinstall openldap-ltb*

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

