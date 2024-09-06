.. _security:

User Roles
==========

TDH comes with a set of predefined roles for a multi user configuration.

The base installation of TDH defines the following group roles :

* **tdh_viewer**: has the rights for project consultation, can select entities of TDH, view values lists.
* **tdh_user**: main TDH user, can edit entities (`tdh_od` schema), view values lists.
* **tdh_manager**: user of TDH with extended privileges, can edit entities and values lists (`tdh_vl` schema).
* **tdh_sysadmin**: superuser of TDH database, can edit TDH system tables (`tdh_sys` schema).

Data in TDH are stored in 3 schemas with default permissions for all of these users.

.. Note:: The SQL related to these roles is stored `here <https://github.com/teksi/district_heating/tree/main/datamodel/12_0_roles.sql>`_ and `here <https://github.com/teksi/district_heating/tree/main/datamodel/12_1_roles.sql>`_
