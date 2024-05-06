CREATE OR REPLACE FUNCTION tww_app.set_organisations_active()
  RETURNS void AS
  $BODY$
  BEGIN
UPDATE tww_od.organisation
SET tww_active=TRUE
WHERE obj_id = ANY(
/* SELECT UNNEST(ARRAY[fk_provider,fk_dataowner])
FROM tww_od.hydraulic_node
UNION */
/* SELECT UNNEST(ARRAY[fk_provider,fk_dataowner])
FROM tww_od.hydraulic_line_section
UNION */
/* SELECT UNNEST(ARRAY[fk_provider,fk_dataowner])
FROM tww_od.static_node
UNION */
/* SELECT UNNEST(ARRAY[fk_provider,fk_dataowner])
FROM tww_od.static_line_section
UNION */
SELECT UNNEST(ARRAY[fk_provider,fk_dataowner])
FROM tww_od.pipe_section
UNION
SELECT UNNEST(ARRAY[fk_provider,fk_dataowner,fk_owner])
FROM tww_od.pipe_point
UNION
SELECT UNNEST(ARRAY[fk_provider,fk_dataowner,fk_owner])
FROM tww_od.structure
UNION
SELECT UNNEST(ARRAY[fk_provider,fk_dataowner,fk_owner])
FROM tww_od.trench
UNION
/* SELECT UNNEST(ARRAY[fk_provider,fk_dataowner,fk_owner])
FROM tww_od.trench_point
UNION */
/* SELECT UNNEST(ARRAY[fk_provider,fk_dataowner])
FROM tww_od.damage_pipe_section
UNION */
/* SELECT UNNEST(ARRAY[fk_provider,fk_dataowner])
FROM tww_od.damage_pipe_point
UNION */
/* SELECT UNNEST(ARRAY[fk_provider,fk_dataowner])
FROM tww_od.damage_structure
UNION */
/* SELECT UNNEST(ARRAY[fk_provider,fk_dataowner])
FROM tww_od.damage_trench
UNION */
SELECT UNNEST(ARRAY[fk_provider,fk_dataowner])
FROM tww_od.organisation
UNION
SELECT UNNEST(ARRAY[fk_provider,fk_dataowner])
FROM tww_od.sia405cc_cable
UNION
SELECT UNNEST(ARRAY[fk_provider,fk_dataowner])
FROM tww_od.sia405cc_cable_point
UNION
SELECT UNNEST(ARRAY[fk_provider,fk_dataowner])
FROM tww_od.sia405pt_protection_tube

);
END;
$BODY$
LANGUAGE plpgsql VOLATILE;
