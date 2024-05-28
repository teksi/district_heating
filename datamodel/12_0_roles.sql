-------------------------------------------
/* CREATE roles - cluster initialisation */
-------------------------------------------
DO $$
DECLARE
    role text;
BEGIN
    FOREACH role IN ARRAY ARRAY['tdh_viewer', 'tdh_user', 'tdh_manager', 'tdh_sysadmin'] LOOP
      IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = role) THEN
          EXECUTE format('CREATE ROLE %1$I NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION', role);
      END IF;
    END LOOP;
END
$$;
GRANT tdh_viewer TO tdh_user;
GRANT tdh_user TO tdh_manager;
GRANT tdh_manager TO tdh_sysadmin;
