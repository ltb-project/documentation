****************************************
Install OpenLDAP LTB for Debian / Ubuntu
****************************************

Installation
============

Declare APT repository
----------------------

.. tip::
    You need to set up the repository for your version:

    * stretch (debian 9)
    * buster (debian 10)
    * bullseye (debian 11)

    For Ubuntu systems you can check which Debian release to choose in /etc/debian_version


Authorize downloading of packages in https repositories:

.. code-block:: console

    # apt install apt-transport-https


Configure the repository: 

.. code-block:: console

    # vi /etc/apt/sources.list.d/ltb-project.list

* For OpenLDAP 2.4:

.. tip::

    Available distributions are ``stretch`` and ``buster``. Here is the configuration for ``buster``.

::

    deb [arch=amd64] https://ltb-project.org/debian/buster buster main

* For OpenLDAP 2.5:

.. tip::

    Available distributions are ``buster`` and ``bullseye``. Here is the configuration for ``bullseye``.

::

    deb [arch=amd64] https://ltb-project.org/debian/openldap25/bullseye bullseye main


Import GPG key
--------------

The public key can be downloaded here: `GPG key <_static/RPM-GPG-KEY-LTB-project>`_.

To import this key: 

.. code-block:: console

    # curl https://ltb-project.org/_static/RPM-GPG-KEY-LTB-project | apt-key add -

Then update:

.. code-block:: console

    # apt update

Install packages
----------------

You are now ready to install:

.. code-block:: console

    # apt install openldap-ltb openldap-ltb-contrib-overlays openldap-ltb-mdb-utils

See :doc:`OpenLDAP packages<openldap-packages>` to know available packages.

Rebuild debian packages
=======================

You can rebuild the debian packages:

* get the packaging sources
* follow the README procedure

Everything is available `here <https://github.com/ltb-project/openldap-deb>`_

