.. _database-initialization:

Database initialization
=======================

You can use :ref:`pgAdmin` to access and manage the database server.

.. note::

 By clicking the link you can learn how to :ref:`install-pgAdmin`

Process
-------

In pgAdmin4

* Connect to the database server

* Create a new database with UTF8 encoding (e.g. `tdh_prod`).

.. _restore-demomodel:

Restore demo datamodel
^^^^^^^^^^^^^^^^^^^^^^

Restore the latest data model that also includes demo data:

* Download demo data
  * https://github.com/teksi/district_heating/releases/latest
  * download `tdh_vx.y.z_structure_and_demo_data.backup`

Back in pgAdmin :

* Right click the `tdh_prod` database

  * Click `Restore`

  * Load your download of tdh_vx.y.z_structure_and_demo_data.backup


  .. figure:: images/demodata-restore.jpg

  * Click the `Restore Options` Tab and check these options


  .. figure:: images/demodata-restore_options.jpg

  * Click `Restore`

  * Check whether in Message window `Restoring backup on the server` is successfully completed.

.. note::

   If the Restore is failed and the detail reads something like "pg_restore: [archiver] unsupported version (1.13) in file header" or in German "pg_restore: [Archivierer] nicht unterstützte Version (1.13) im Dateikopf" try updating your PostgreSQL, see https://stackoverflow.com/questions/49064209/getting-archiver-unsupported-version-1-13-in-file-header-when-running-pg-r

  * Close the Restoring-Window

* Right click the database and click `Refresh`

.. figure:: images/demodata-refresh.jpg

* Propably you want to rename the database: Right click the database, click `Properties...` and rename the database.

There are now 6 `schemas <https://teksi.github.io/district_heating/en/user-guide/layerexplanations/namingconventions.html#schemas-in-the-tdh-database>`_ in the database

+ public
+ tdh_app
+ tdh_cfg
+ tdh_od
+ tdh_sys
+ tdh_vl


Create  minimal roles and access
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. note:: The TDH roles are defined in the
+ `12_0_roles.sql <https://github.com/teksi/district_heating/blob/main/datamodel/12_0_roles.sql>`_ (per cluster) and
+ `12_1_roles.sql <https://github.com/teksi/district_heating/blob/main/datamodel/12_1_roles.sql>`_ (per database) files.


It is recommended to use these when using TDH in a production environment.

Copy paste and run the two .sql one after the other in the query editor of pgAdmin (Tools > Query Tool).

Empty data model
^^^^^^^^^^^^^^^^

You also have the option to restore the latest empty data model (no demo data).

* Download the data model by going to https://github.com/teksi/district_heating/releases/latest
  and by downloading the latest `tdh_vx.y.z_structure_with_value_lists.sql`.

.. note::

 If you run the sql in a :ref:`SQL-query` Window, you will get an error. You have to use a BAT-File.

* Use a BAT-File like that, to create the database, the extensions and the schemas with valuelist  (replace x.y.z with your version)::

    @echo off

    set filename="tdh_vx.y.z_structure_with_value_lists.sql"

    if not exist %filename% (
       echo "File %filename% does not exist. Please download the latest datamodel from https://github.com/TDH/datamodel/releases (structure_with_value_lists.sql) and adjust filename in this batch file."
       PAUSE
       exit -1
    )

    set /p db="Please enter the database name? (e.g. tdh_community) "
    set /p password="Please enter the password for user postgres? "

    set port=5432
    set PATH=%PATH%;C:\Program Files\PostgreSQL\12\bin
    set PGPASSWORD=%password%

    createdb -U postgres -p %port% %db%

    psql -U postgres -h localhost -p %port% -d %db% -f %filename%
    psql -U postgres -h localhost -p %port% -d %db% -c "GRANT USAGE ON SCHEMA public TO ""tdh"""
    psql -U postgres -h localhost -p %port% -d %db% -c "GRANT USAGE ON SCHEMA tdh_vl TO ""tdh"""
    psql -U postgres -h localhost -p %port% -d %db% -c "GRANT USAGE ON SCHEMA tdh_od TO ""tdh"""
    psql -U postgres -h localhost -p %port% -d %db% -c "GRANT USAGE ON SCHEMA tdh_sys TO ""tdh"""

    psql -U postgres -h localhost -p %port% -d %db% -c "GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA tdh_od TO ""tdh""";
    psql -U postgres -h localhost -p %port% -d %db% -c "GRANT SELECT ON ALL TABLES IN SCHEMA tdh_vl TO ""tdh""";
    psql -U postgres -h localhost -p %port% -d %db% -c "GRANT SELECT ON ALL TABLES IN SCHEMA tdh_sys TO ""tdh""";
    psql -U postgres -h localhost -p %port% -d %db% -c "GRANT SELECT ON ALL TABLES IN SCHEMA public TO ""tdh"""

    psql -U postgres -h localhost -p %port% -d %db% -c "GRANT USAGE ON ALL SEQUENCES IN SCHEMA tdh_od TO ""tdh"""

    PAUSE


.. note::

 You are free to choose any database name.

* Update privileges for the tdh_od, tdh_sys, tdh_vl schema as described in the chapter `Create  minimal roles and access`.


Generate the data model under Linux
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

You can also generate the data model under Linux.

* Download the data model::

   git clone https://github.com/TDH/datamodel
   cd datamodel

* Setup the ``pg_service.conf`` file and add the ``pg_tdh`` service
  as in the :ref:`pg_service-linux` section.

* Create the database::

   psql -U postgres -c 'CREATE DATABASE tdh;'

* Run the generation script::

   ./scripts/db_setup.sh

If you want to use a different SRID you need to use the ``-s`` option.
For instance, run ``./scripts/db_setup.sh -s 2056`` for the **2056** SRID.

If you already have a data model and you want to force the regeneration
of the model you can also use the ``-f`` option: ``./scripts/db_setup.sh -f``.

You can use the ``-r`` option to add roles (``tdh_viewer``, ``tdh_user``, ``tdh_manager``, ``tdh_sysadmin``).

- Viewer: Can consult tables and views.
- User: Can edit data.
- Manager: Can edit data and value lists.
- Admin: Database administrator.
