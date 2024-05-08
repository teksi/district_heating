-------------------------------------------
/* CREATE roles - cluster initialisation */
-------------------------------------------

GRANT USAGE ON SCHEMA tdh_app  TO tdh_viewer;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA tdh_app  TO tdh_viewer;
GRANT SELECT, REFERENCES, TRIGGER ON ALL TABLES IN SCHEMA tdh_app  TO tdh_viewer;
ALTER DEFAULT PRIVILEGES IN SCHEMA tdh_app  GRANT SELECT, REFERENCES, TRIGGER ON TABLES TO tdh_viewer;

GRANT ALL ON SCHEMA tdh_app TO tdh_user;
GRANT ALL ON ALL TABLES IN SCHEMA tdh_app TO tdh_user;
GRANT ALL ON ALL SEQUENCES IN SCHEMA tdh_app TO tdh_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA tdh_app GRANT ALL ON TABLES TO tdh_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA tdh_app GRANT ALL ON SEQUENCES TO tdh_user;
