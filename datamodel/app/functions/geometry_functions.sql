-----------------------------------------------
-----------------------------------------------
-- Synchronize GEOMETRY with altitude1 (OK Mantelrohr) tdh_od.pipe_point
-----------------------------------------------
-----------------------------------------------
SELECT set_config('tdh.srid', 2056::text, false);
DO $DO$
BEGIN
EXECUTE format($TRIGGER$
CREATE OR REPLACE FUNCTION tdh_app.synchronize_altitude1_with_altitude_on_pipe_point()
  RETURNS trigger AS
$BODY$
BEGIN
  CASE
    WHEN TG_OP = 'INSERT' THEN
      NEW.geometry3d_geometry = ST_SetSRID( ST_MakePoint( ST_X(NEW.geometry3d_geometry), ST_Y(NEW.geometry3d_geometry), COALESCE(NEW.altitude1,'NaN') ), %1$s);
    WHEN TG_OP = 'UPDATE' THEN
      IF NEW.altitude1 <> OLD.altitude1 OR (NEW.altitude1 IS NULL AND OLD.altitude1 IS NOT NULL) OR (NEW.altitude1 IS NOT NULL AND OLD.altitude1 IS NULL) THEN
        NEW.geometry3d_geometry = ST_SetSRID( ST_MakePoint( ST_X(NEW.geometry3d_geometry), ST_Y(NEW.geometry3d_geometry), COALESCE(NEW.altitude1,'NaN') ), %1$s);
      ELSE
        IF ST_Z(NEW.geometry3d_geometry) <> ST_Z(OLD.geometry3d_geometry) THEN
          NEW.altitude1 = NULLIF(ST_Z(NEW.geometry3d_geometry),'NaN');
        END IF;
      END IF;
  END CASE;

  RETURN NEW;
END; $BODY$
  LANGUAGE plpgsql VOLATILE;
$TRIGGER$, current_setting('tdh.srid'));
END
$DO$;

DROP TRIGGER IF EXISTS synchronize_altitude1_with_altitude_on_pipe_point ON tdh_od.pipe_point;

CREATE TRIGGER synchronize_altitude1_with_altitude_on_pipe_point
  BEFORE INSERT OR UPDATE
  ON tdh_od.pipe_point
  FOR EACH ROW
  EXECUTE PROCEDURE tdh_app.synchronize_altitude1_with_altitude_on_pipe_point();


-----------------------------------------------
-----------------------------------------------
-- Synchronize GEOMETRY with altitude tdh_od.sia405cc_cable_point
-----------------------------------------------
-----------------------------------------------
SELECT set_config('tdh.srid', 2056::text, false);
DO $DO$
BEGIN
EXECUTE format($TRIGGER$
CREATE OR REPLACE FUNCTION tdh_app.synchronize_altitude_with_altitude_on_sia405cc_cable_point()
  RETURNS trigger AS
$BODY$
BEGIN
  CASE
    WHEN TG_OP = 'INSERT' THEN
      NEW.geometry3d_geometry = ST_SetSRID( ST_MakePoint( ST_X(NEW.geometry3d_geometry), ST_Y(NEW.geometry3d_geometry), COALESCE(NEW.altitude,'NaN') ), %1$s);
    WHEN TG_OP = 'UPDATE' THEN
      IF NEW.altitude <> OLD.altitude OR (NEW.altitude IS NULL AND OLD.altitude IS NOT NULL) OR (NEW.altitude IS NOT NULL AND OLD.altitude IS NULL) THEN
        NEW.geometry3d_geometry = ST_SetSRID( ST_MakePoint( ST_X(NEW.geometry3d_geometry), ST_Y(NEW.geometry3d_geometry), COALESCE(NEW.altitude,'NaN') ), %1$s);
      ELSE
        IF ST_Z(NEW.geometry3d_geometry) <> ST_Z(OLD.geometry3d_geometry) THEN
          NEW.altitude = NULLIF(ST_Z(NEW.geometry3d_geometry),'NaN');
        END IF;
      END IF;
  END CASE;

  RETURN NEW;
END; $BODY$
  LANGUAGE plpgsql VOLATILE;
$TRIGGER$, current_setting('tdh.srid'));
END
$DO$;

DROP TRIGGER IF EXISTS synchronize_altitude_with_altitude ON tdh_od.sia405cc_cable_point;

CREATE TRIGGER synchronize_altitude_with_altitude
  BEFORE INSERT OR UPDATE
  ON tdh_od.sia405cc_cable_point
  FOR EACH ROW
  EXECUTE PROCEDURE tdh_app.synchronize_altitude_with_altitude_on_sia405cc_cable_point();


-----------------------------------------------
-----------------------------------------------
-- Synchronize pipe_point and pipe_section GEOMETRY cannot be implemented as there is not relation between the two as in tww. Not every pipe_section starts/ends with a pipe_point.
-----------------------------------------------
-----------------------------------------------
