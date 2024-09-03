Naming conventions
==================

Schemas in the TDH-Database
----------------------------
Schema in TEKSI-Databases will follow all the same rules. To destinguish, every infrastructre has his own shortcut (3 letters). TDH (TEKSI district heating) is the shortcut for module district heating network management.
The TDH-Database has five tdh-schemas:

* tdh_od: in this schema you find the tables, that correspond to the SIA-405 datamodel (pipe, pipe_point, trench, structureetc.) Also for sequences of these tables. Because of the new update-management, the views are no more in the *_od-schema, but in the *_app-schema.

* tdh_vl: is the schema for value lists. There is a table for every value list of the SIA-405. As a TDH-user you can not edit these tables.

* tdh_app: schema for all module-specific views, materialized views, functions, triggers, etc. Also for views and function of additional plugins (ie: QField). In case of an update of the database, this schema will overwriten.

* tdh_sys: special tables for administration of the database. As a TDH-User you can not edit these tables.

* tdh_cfg: to do: good explanantion


Layer names
-----------

* Layer names without prefix

This shows you, that you find the table in the tdh_od-schema or (if the are in the layer-group "Value Lists", you find them in schema tdh_vl).
If you are not sure in which schema to look for the table: place the mouse over the layer and look in the yellow popup-box for 'table="tdh_*'.

* Layer Names that begin with vw_

Two or more SIA-405 tables are joined in a view (vw). The layer has the name of the main-table. Example: vw_pipe_point_normal: the main layer is the table pipe_point.
It is important to know the main-table to be sure , that you use the correct attributes.


Attribute names
---------------

* Prefixes in attribute names

In a view, you find fields from different tables. In easier cases, there are only a subclass and a superclass included. In the tdh-mainlayers there are several sub- und superclasses.
With the prefix of the attribute name, you know to which table an attribute belongs. The prefix are two letters that belong to a table of the SIA-405 datamodel.
The convention is: attributes of the main table have no prefix, all other attributes have a prefix that points to the table they are from. In case of sub- and superclass, the two tables are taken together.

* fk_ fields

fk_ is not a shortcut for a special table. It stands for foreign key.

* _ fields

Attributes that start with _ (underscore) are calculated fields. You can not find them in the schemas.
