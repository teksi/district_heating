Setup workstation
=================

Database configuration
----------------------

To tell a workstation, where the database is (on the local system or on a
network server) you will have to create some files initially on every device on
which you will have QGIS/TDH running (client). It is not required to do that on the
server itself.

These instructions depend on your operating system.

Windows pg_service
^^^^^^^^^^^^^^^^^^

Create a new directory where you want to store the configuration in. (E.g. a new folder ``pgconfig`` in your home folder). This directory will be referred to as ``PGSYSCONFDIR`` in this guide.

Set the environment variable ``PGSYSCONFDIR`` to the path to ``PGSYSCONFDIR``.

.. note:: Search for environment variable in your windows system settings, then click one of the following options, for either a user or a system variable:

    Click ``New`` to add a new variable name and value.
    Click an existing variable, and then click ``Edit`` to change its name or value.
    Click an existing variable, and then click ``Delete`` to remove it.

  .. figure:: images/umgebungsvariablen_pgconfdir.jpg

  You can check your environment variables also within QGIS: Menu ``Settings`` --> ``Options...`` --> ``System`` Tab  --> ``Environment``

Inside this folder, there will be two files

* ``pg_service.conf``
* ``pgpass`` (If you do not want to enter the password for the db every time)

.. attention::

 On Windows, you need to save ``pg_service.conf`` in Unix format in order to work.
 One way to do it is to open it with `Notepad++ <https://notepad-plus-plus.org/>`_
 and ``Edit`` --> ``EOL Conversion`` --> ``UNIX Format`` --> ``File save`` .

.. _pg_service-linux:

Linux/macOS pg_service
^^^^^^^^^^^^^^^^^^^^^^

On Unix systems (linux/macOS etc.) you may put the files ``.pg_service.conf``
and ``.pgpass`` into your home folder (normally ``/home/[username]``). Pay attention to the starting . (<> Windows)!

If your QGIS doesn't find the ``.pg_service.conf`` file, set the environment variable PGSYSCONFDIR:

.. note::
In QGIS go to ``Settings`` > ``Options`` > ``System`` tab. Near the bottom you'll find ``Environment``. Tick ``Use custom variables`` and click on the plus on the right. Add the PGSYSCONFDIR variable using Append (to make sure you don't delete anything - doesn't matter probably) and its value (probably ``/home/[username]`` see above). Then click ``OK`` at  the bottom right.

.. figure:: images/macEnvVarSet.png

After closing and reopening QGIS, you should be able to see the added PGSYSCONFDIR at the bottom of the same window under ``Current environment variables``.
.. figure:: images/macEnvVarCheck.png

All systems
^^^^^^^^^^^

Put the following content in the file ``pg_service.conf`` or ``.pg_service.conf``.
You may have to adapt the variables for your setup.

.. code:: ini

    [pg_tdh]
    host=localhost
    port=5432
    dbname=tdh
    user=tdhuser

To save the password as well on the system you may use the file `pgpass <http://www.postgresql.org/docs/current/static/libpq-pgpass.html>`_.

.. code:: ini

    localhost:5432:*:tdhuser:password

.. note:: If you don't have the database on your local machine replace any
   occurence of ``localhost`` with the network address of your database
   server.

Alternative: put your password directly into the ``pg_service.conf`` (on Windows) / ``.pg_service.conf`` (on *nix) file:

.. code:: ini

    [pg_tdh]
    host=localhost
    port=5432
    dbname=tdh
    user=tdhuser
    password=***

Install QGIS
------------

* Minimum requirement 3.4

* We recommend using the latest master build (called qgis-dev on Windows)
  which often offers a better experience in combination with TDH.
  For Windows installation, download the `OSGeo4W Installer <http://download.osgeo.org/osgeo4w/osgeo4w-setup-x86_64.exe>`_
  choose *advanced installation* and install qgis-dev.



Install the demo data
---------------------

as described `here <https://teksi.github.io/district_heating/installation-guide/database-initialization.html#restore-demo-datamodel>`_

Install the demo project
------------------------

* Download from https://github.com/teksi/district_heating/releases/latest the tdh.zip

* Extract the file

* If you leave the tdh_[language].qm files in the same directory as the tdh.qgs file and start QGIS with one of these languages, your tdh-project will be translated to that langue when you start the project. E.g. you start tdh.qgs with a QGIS Installation that is set to German, then the tdh.qgs project will appear in German.

.. note:: You need to explicitly set the language in QGIS in settings. If QGIS is configured to take the system language, the TDH translation is not loaded.

.. figure:: images/tdh_project_qm_language_files.jpg

* Open `project/tdh.qgs` with QGIS
* When you save that project it will keep it's language and it cannot be changed in the same way.


If you are a data owner: Add your own OID to the project
--------------------------------------------------------

* If you are a data owner (Datenherr), you should add your OID data in the table tdh_sys.oid_prefixes:

.. figure:: images/oid_prefix.jpg

* Edit ``02_oid_generation.sql`` with your OID if you want it permanently in the TDH project and hand in a pull request

https://github.com/TDH/datamodel/blob/master/02_oid_generation.sql

.. code:: sql

  -- sample entry for the City of Uster - you need to add an entry for your own organization
  INSERT INTO tdh_sys.oid_prefixes (prefix,organization,active) VALUES ('ch11h8mw','Stadt Uster',TRUE);
  INSERT INTO tdh_sys.oid_prefixes (prefix,organization,active) VALUES ('ch15z36d','SIGE',FALSE);
  INSERT INTO tdh_sys.oid_prefixes (prefix,organization,active) VALUES ('ch13p7mz','Arbon',FALSE);

and set the OID you want to use in your project to TRUE.

* or add it locally to your project with an INSERT statement.

* OID prefixes have to be ordered at https://www.interlis.ch/en/dienste/oid-bestellen

.. note:: If you work with different databases for different communities, you should use different OID prefixes for each database.


Working with more than one database
-----------------------------------

* Create a new database in pgAdmin with a new name, e.g. communityA

* Create a new schema tdh in this database (do not choose another name, because all scripts works with the schema-name tdh)

* Go further on as described in 1.2 Database initialization

* Change the ``pg_service.conf`` - file

.. code:: ini

  [pg_tdh]   
  host=localhost   
  port=5432   
  dbname=tdh   
  user=tdhuser
  [pg_communityA]   
  host=localhost     
  port=5432     
  dbname=communityA     
  user=tdhuser

* Search and replace in the copy of ``tdh_en.qgs`` all 'pg_tdh' with 'pg_communityA'
