-- ******************************************************************************
-- Open/view files in tdh
-- ******************************************************************************
--1. ADD fk_data_media :
-- ******************************************************************************

-- Modification of table od_file --> insert fk_data_media

-- done in 04_vsa_kek_extension instead
--ALTER TABLE tdh_od.file ADD COLUMN fk_data_media character varying(16);

-- ******************************************************************************
-- 2. tdh_app.vw_file :
-- ******************************************************************************

-- View: tdh_app.vw_file

CREATE OR REPLACE VIEW tdh_app.vw_file AS
  SELECT f.obj_id,
    f.identifier,
    f.kind,
    f.object,
    f.classname,
    -- dm.path,
    COALESCE(dm.path::text || f.path_relative::text, f.path_relative::text) AS _url,
    f.fk_dataowner as dataowner,
    f.fk_provider as provider,
    f.remark
   FROM tdh_od.file f
     LEFT JOIN tdh_od.data_media dm ON dm.obj_id::text = f.fk_data_media::text;

ALTER VIEW tdh_app.vw_file ALTER obj_id SET DEFAULT tdh_app.generate_oid('tdh_od','file');

-- ******************************************************************************
-- 3. FUNCTIONS :
-- ******************************************************************************

-- Function: tdh_app.vw_file_delete()
-- DROP FUNCTION tdh_app.vw_file_delete();

CREATE OR REPLACE FUNCTION tdh_app.vw_file_delete()
  RETURNS trigger AS
$BODY$
  BEGIN
    DELETE FROM tdh_od.file WHERE obj_id = OLD.obj_id;
    RETURN OLD;
  END;
$BODY$
LANGUAGE plpgsql VOLATILE
COST 100;


-- ******************************************************************************
-- Function: tdh_app.vw_file_insert()
-- DROP FUNCTION tdh_app.vw_file_insert();
CREATE OR REPLACE FUNCTION tdh_app.vw_file_insert()
  RETURNS trigger AS
$BODY$

  BEGIN

    NEW._url = replace(NEW._url, '\', '/');

    INSERT INTO tdh_od.file(
      classname,
      identifier,
      kind,
      object,
      path_relative,
      fk_dataowner,
      fk_provider,
      fk_data_media,
      remark)

    SELECT
      NEW.classname,
      NEW.identifier,
      NEW.kind,
      NEW.object,
      SUBSTRING(NEW._url, LENGTH("path")+1, LENGTH(NEW._url)), -- path_relative,
      NEW.dataowner, -- fk_dataowner,
      NEW.provider, -- fk_provider,
      obj_id, -- fk_data_media
      NEW.remark
    FROM tdh_od.data_media
    WHERE "path" = SUBSTRING(NEW._url FROM 1 FOR LENGTH("path"))
    ORDER BY LENGTH("path") DESC
    LIMIT 1;

    -- FOUND is a special variable which is always FALSE at the beginning of a PL/pgsql function and will be set by
    -- e.g. INSERT to TRUE if at least one row is affected.
    IF NOT FOUND THEN
      RAISE WARNING 'Could not insert. File not in repository set in od_data_media!';
    END IF;

  RETURN NEW;
END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

  -- ******************************************************************************
-- Function: tdh_app.vw_file_update()
-- DROP FUNCTION tdh_app.vw_file_update();

CREATE OR REPLACE FUNCTION tdh_app.vw_file_update()
  RETURNS trigger AS
$BODY$
BEGIN

NEW._url = replace(NEW._url, '\', '/');

  UPDATE  tdh_od.file
    SET
    classname = NEW.classname,
    identifier = NEW.identifier,
    kind = NEW.kind,
    object = NEW.object,
    path_relative = SUBSTRING(NEW._url, LENGTH(dm.path)+1, LENGTH(NEW._url)),
    fk_dataowner = NEW.dataowner,
    fk_provider = NEW.provider,
    fk_data_media = dm.id,
    remark = NEW.remark

FROM (
  SELECT obj_id as id,
	path
	FROM tdh_od.data_media
	WHERE path = SUBSTRING(NEW._url FROM 1 FOR LENGTH(path))
	ORDER BY LENGTH(path) DESC
	LIMIT 1)  dm

WHERE obj_id = OLD.obj_id;


  RETURN NEW;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;


-- TRIGGERS :
-- ******************************************************************************
-- Trigger: vw_file_delete on tdh_app.vw_file
-- DROP TRIGGER vw_file_delete ON tdh_app.vw_file;

CREATE TRIGGER vw_file_delete
  INSTEAD OF DELETE
  ON tdh_app.vw_file
  FOR EACH ROW
  EXECUTE PROCEDURE tdh_app.vw_file_delete();

-- Trigger: vw_file_insert on tdh_app.vw_file
-- DROP TRIGGER vw_file_insert ON tdh_app.vw_file;

CREATE TRIGGER vw_file_insert
  INSTEAD OF INSERT
  ON tdh_app.vw_file
  FOR EACH ROW
  EXECUTE PROCEDURE tdh_app.vw_file_insert();

-- Trigger: vw_file_update on tdh_app.vw_file
-- DROP TRIGGER vw_file_update ON tdh_app.vw_file;

CREATE TRIGGER vw_file_update
  INSTEAD OF UPDATE
  ON tdh_app.vw_file
  FOR EACH ROW
  EXECUTE PROCEDURE tdh_app.vw_file_update();
-- ******************************************************************************
