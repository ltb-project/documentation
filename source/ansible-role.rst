****************************************
Ansible role for OpenLDAP LTB
****************************************

Overview
============

The goal of the role is to deploy OpenLDAP-LTB on a set of machines.

Basically, the role:

 * install the :ref:`LTB apt repository<declare-apt-repository>`
 * install the :ref:`OpenLDAP LTB packages<openldap-packages>`
 * set a configuration based on the supplied template and the ansible variables

.. tip::
    The role is based upon debian/ubuntu installation

The configuration template (cn=config) and the numerous variables allow high configurability:

 * standalone mode
 * multi-master replicated cluster

Documentation
=============

The documentation is available in the `repository <https://github.com/ltb-project/ansible-role-ldaptoolbox-openldap>`_


Download
========

Download is available from the `repository <https://github.com/ltb-project/ansible-role-ldaptoolbox-openldap>`_
