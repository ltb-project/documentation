*************************************
OpenLDAP packages for Debian / Ubuntu
*************************************

Introduction
============

LTB project provides 5 Debian packages:

:openldap-ltb:                   main OpenLDAP package, including slapd-cli,
                                 systemd service, and many openldap core modules
                                 (see below)
:openldap-ltb-contrib-overlays:  additional openldap modules (see the list below)
:openldap-ltb-dbg:               debug symbols for openldap
:openldap-ltb-explockout:        additional overlay *exponential lockout*
:openldap-ltb-mdb-utils:         additional utilities for the mdb database backend (mdb_*)

.. NOTE::
    LTB team tries to keep packages up to date with the latest OpenLDAP version.

.. TIP::
    Every backend and overlay is compiled as a module.

The main OpenLDAP package includes:

* backends:

  * **mdb**: main database storage
  * **ldap**: LDAP proxy
  * **meta**: agregation of multiple LDAP proxies
  * **sock**

* SSL/TLS with OpenSSL
* SASL (including SASL passwords)
* SLAPI support
* CRYPT password
* support of tcp-wrappers
* support of reverse lookups of client hostnames
* argon2 hash scheme
* schema expose (SLAP_SCHEMA_EXPOSE flag for hidden schema elements)
* load-balancer (compiled as a module)
* slapd-cli project, including slapd-cli tool,
  and systemd services for OpenLDAP and load-balancer
* logrotate script
* all standard overlays:

  * **accesslog**: In-Directory Access Logging
  * **auditlog**: Audit Logging
  * **autoca**: Automatic Certificate Authority
  * **collect**: Collect
  * **constraint**: Attribute Constraint
  * **dds**: Dynamic Directory Services
  * **deref**: Dereference
  * **dyngroup**: Dynamic Group
  * **dynlist**: Dynamic List
  * **homedir**: Home Directory Management
  * **memberof**: Reverse Group Membership
  * **otp**: OTP 2-factor authentication
  * **ppolicy**: Password Policy
  * **proxycache**: Proxy Cache
  * **refint**: Referential Integrity
  * **remoteauth**: Deferred Authentication
  * **retcode**: Return Code testing
  * **rwm**: Rewrite/Remap
  * **seqmod**: Sequential Modify
  * **sssvlv**: ServerSideSort/VLV
  * **syncprov**: Syncrepl Provider
  * **translucent**: Translucent Proxy
  * **unique**: Attribute Uniqueness
  * **valsort**: Value Sorting


The contrib-overlay package includes these additional overlays:

* **autogroup**: automatic updates of group memberships which meet the requirements
  of any filter contained in the group definition.
* **lastbind**: logs the last user authentication
* **noopsrch**: "no operation search": do a search in dry-run
* **nssov**: handles NSS lookup requests through a local Unix Domain socket
* **pw-pbkdf2**: allows PBKDF2 hash scheme
* **pw-sha2**: allow SHA2 hash scheme
* **smbk5pwd**: update Kerberos keys and Samba password hashes (without Heimdal Kerberos support)
* **ppm**: extend the password policy with new criteria
* **variant**: share values between entries
* **vc**: implements the LDAP "Verify Credentials" extended operation

The installation lies under ``/usr/local/openldap``, in order to avoid conflicts with existing OpenLDAP installation. In particular, we do not interfere with the ldap system libraries, which are linked in by many other programs.


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


