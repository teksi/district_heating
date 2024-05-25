CREATE OR REPLACE VIEW tdh_app.vw_pipe_point_normal AS
 SELECT pipe_point.obj_id,
    pipe_point.geometry3d_geometry,
    pipe_point.symbolori,
    pipe_point.horizontal_positioning,
    pipe_point.altitude1,
    pipe_point.altitude2,
    pipe_point.elevation_determination,
--    pipe_point.owner,
    pipe_point.remark,
    pipe_point.last_modification,
    pipe_point.fk_dataowner,
    pipe_point.fk_provider,
 --   pipe_point.fk_hydraulic_node,
 --   pipe_point.fk_static_node,
    pipe_point.fk_owner,
    pipe_point_normal.kind,
    pipe_point_normal.armature_setting,
    pipe_point_normal.material
   FROM tdh_od.pipe_point
     LEFT JOIN tdh_od.pipe_point_normal ON pipe_point_normal.obj_id::text = pipe_point.obj_id::text
	 WHERE pipe_point_normal.kind BETWEEN 8101 AND 8146;