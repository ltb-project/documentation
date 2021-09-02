*************************************
OpenLDAP packages for Debian / Ubuntu
*************************************

Introduction
============

.. include:: openldap-packages.rst


Installation
============

APT repository
--------------

.. TIP::
    You need to set up the repository for your version:

    * buster (debian 10)
    * bullseye (debian 11)

    For Ubuntu systems you can check which Debian release to choose in /etc/debian_version


Authorize downloading of packages in https repositories:

.. code-block:: console

    # apt install apt-transport-https


Configure the repository: 

.. code-block:: console

    # vi /etc/apt/sources.list.d/ltb-project.list


.. WARNING::
    TODO: adapt URL

::

    deb [arch=amd64] https://ltb-project.org/debian/bullseye bullseye main


The public key can be downloaded here: `GPG key <_static/RPM-GPG-KEY-LTB-project>`_.

To import this key: 

.. code-block:: console

    # curl https://ltb-project.org/_static/RPM-GPG-KEY-LTB-project | apt-key add -

Then update:

.. code-block:: console

    # apt update

You are now ready to install:

.. code-block:: console

    # apt install openldap-ltb


