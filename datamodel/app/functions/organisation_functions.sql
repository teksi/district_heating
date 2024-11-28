CREATE OR REPLACE FUNCTION tdh_app.set_organisations_active()
  RETURNS void AS
  $BODY$
  BEGIN
UPDATE tdh_od.organisation
SET tdh_active=TRUE
WHERE obj_id = ANY(
/* SELECT UNNEST(ARRAY[fk_provider,fk_dataowner])
FROM tdh_od.hydraulic_node
UNION */
/* SELECT UNNEST(ARRAY[fk_provider,fk_dataowner])
FROM tdh_od.hydraulic_line_section
UNION */
/* SELECT UNNEST(ARRAY[fk_provider,fk_dataowner])
FROM tdh_od.static_node
UNION */
/* SELECT UNNEST(ARRAY[fk_provider,fk_dataowner])
FROM tdh_od.static_line_section
UNION */
SELECT UNNEST(ARRAY[fk_provider,fk_dataowner])
FROM tdh_od.pipe_section
UNION
SELECT UNNEST(ARRAY[fk_provider,fk_dataowner,fk_owner])
FROM tdh_od.pipe_point
UNION
SELECT UNNEST(ARRAY[fk_provider,fk_dataowner,fk_owner])
FROM tdh_od.structure
UNION
SELECT UNNEST(ARRAY[fk_provider,fk_dataowner,fk_owner])
FROM tdh_od.trench
UNION
SELECT UNNEST(ARRAY[fk_provider,fk_dataowner,fk_owner])
FROM tdh_od.trench_point
UNION
/* SELECT UNNEST(ARRAY[fk_provider,fk_dataowner])
FROM tdh_od.damage_pipe_section
UNION */
/* SELECT UNNEST(ARRAY[fk_provider,fk_dataowner])
FROM tdh_od.damage_pipe_point
UNION */
/* SELECT UNNEST(ARRAY[fk_provider,fk_dataowner])
FROM tdh_od.damage_structure
UNION */
/* SELECT UNNEST(ARRAY[fk_provider,fk_dataowner])
FROM tdh_od.damage_trench
UNION */
SELECT UNNEST(ARRAY[fk_provider,fk_dataowner])
FROM tdh_od.organisation
UNION
SELECT UNNEST(ARRAY[fk_provider,fk_dataowner])
FROM tdh_od.sia405cc_cable
UNION
SELECT UNNEST(ARRAY[fk_provider,fk_dataowner])
FROM tdh_od.sia405cc_cable_point
UNION
SELECT UNNEST(ARRAY[fk_provider,fk_dataowner])
FROM tdh_od.sia405pt_protection_tube

);
END;
$BODY$
LANGUAGE plpgsql VOLATILE;
