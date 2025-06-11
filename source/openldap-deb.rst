****************************************
Install OpenLDAP LTB for Debian / Ubuntu
****************************************

Installation
============


Import GPG key
--------------

The public key can be downloaded here: `GPG key <_static/RPM-GPG-KEY-LTB-project>`_.

To import this key:

.. code-block:: console

    # apt install curl gpg
    # curl https://ltb-project.org/documentation/_static/RPM-GPG-KEY-LTB-project | gpg --dearmor > /usr/share/keyrings/ltb-project-openldap-archive-keyring.gpg

.. tip::
    On debian 12, in order to install **gpg**, replace *gpg* by *gnupg2* in the previous *apt install* command.

.. tip::
    On old systems, you can also use `apt-key` command::

    # curl https://ltb-project.org/documentation/_static/RPM-GPG-KEY-LTB-project | apt-key add -


.. _declare-apt-repository:

Declare APT repository
----------------------

.. tip::
    You need to set up the repository for your version:

    * buster (debian 10)
    * bullseye (debian 11)
    * bookworm (debian 12)
    * trixie (debian 13) (sid)
    * jammy (ubuntu 22.04 LTS)

    Note: For other Ubuntu systems you can check which Debian release to choose in /etc/debian_version

    Warning: other Ubuntu systems may not be supported, due to possible incompatible dependency versions


Authorize downloading of packages in https repositories:

.. code-block:: console

    # apt install apt-transport-https


Configure the repository: 

.. code-block:: console

    # vi /etc/apt/sources.list.d/ltb-project-openldap.list

* For OpenLDAP 2.5:

.. tip::

    Available distributions are ``buster``, ``bullseye``, ``bookworm``, ``trixie`` and ``jammy``. Here is the configuration for ``bookworm``.

::

    deb [arch=amd64 signed-by=/usr/share/keyrings/ltb-project-openldap-archive-keyring.gpg] https://ltb-project.org/debian/openldap25/bookworm bookworm main

* For OpenLDAP 2.6:

.. tip::

    Available distributions are ``buster``, ``bullseye``, ``bookworm``, ``trixie`` and ``jammy``. Here is the configuration for ``bookworm``.

::

    deb [arch=amd64 signed-by=/usr/share/keyrings/ltb-project-openldap-archive-keyring.gpg] https://ltb-project.org/debian/openldap26/bookworm bookworm main

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

