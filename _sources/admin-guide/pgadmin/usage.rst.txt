Using pgAdmin
==============

.. _SQL-query:

SQL query
---------

.. figure:: images/pgadmin_sqlquery.jpg

   **Running SQL commands in pgAdmin4**



.. note::

 * Clicking the Query Tool icon or Tools/Query Tool from the menu bar opens the SQL Window.
   The SQL icon is active only when you're connected to a database.
 * Clicking the Execute Script icon or F5 runs the written SQL commands.
 * More information : <https://www.pgadmin.org/docs/pgadmin4/latest/query_tool.html>

.. _Database dump:

Database dump
-------------

.. note::
 * Open pgAdmin4 and connect to the database
 * Right click the Schema that you want to backup (in the tree structure below "Schemas")
 * Enter the filename where the dump should be stored

  .. figure:: images/pgadmin_backup.jpg

 * Click the option-tab and check the following options

 .. figure:: images/database-dump-options4.jpg

.. note::

 * After running the process, the window in the right bottom shows that everything went ok

 * More information : <https://www.pgadmin.org/docs/pgadmin4/latest/backup_and_restore.html>
