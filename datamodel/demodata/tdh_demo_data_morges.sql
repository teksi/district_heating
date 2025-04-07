/* DELETE entries in database */

TRUNCATE tdh_od.structure            CASCADE; -- 1 station-pompage + 1 chambre sur conduite
TRUNCATE tdh_od.pipe_point           CASCADE; -- 22 points de conduites (levé terrain)
TRUNCATE tdh_od.pipe_point_feed      CASCADE; -- 2 points d'alimentation (1 sous-station + 1 départ)
TRUNCATE tdh_od.pipe_point_normal    CASCADE; -- 20 points de conduites (vannes, manchons, té, ...)
TRUNCATE tdh_od.pipe_section         CASCADE; -- 8 conduites (4 aller + 4 retour)
TRUNCATE tdh_od.sia405cc_cable_point CASCADE; -- 5 points de cables
TRUNCATE tdh_od.sia405cc_cable       CASCADE; -- 1 cable
TRUNCATE tdh_od.trench               CASCADE; -- 1 trench
TRUNCATE tdh_od.trench_point         CASCADE; -- 1 trench

SELECT setval('tdh_od.seq_structure_oid', 1, true);
SELECT setval('tdh_od.seq_pipe_point_oid', 1, true);
SELECT setval('tdh_od.seq_pipe_point_normal_oid', 1, true);
SELECT setval('tdh_od.seq_pipe_point_feed_oid', 1, true);
SELECT setval('tdh_od.seq_pipe_section_oid', 1, true);
SELECT setval('tdh_od.seq_sia405cc_cable_oid', 1, true);
SELECT setval('tdh_od.seq_sia405cc_cable_point_oid', 1, true);

/*---------------------------------------------------------------------------------------*/
/* AJOUT DES ORGANISATIONS */
/*---------------------------------------------------------------------------------------*/

INSERT INTO tdh_od.organisation(
obj_id, identifier, identifier_short, municipality_number, organisation_type, remark, status, uid, last_modification, fk_dataowner, fk_provider)
VALUES ('ch24ztmgOG000001', 'Morges Energies SA', NULL, NULL, 8606, 'no official obj_id yet', 9047, 'CHE407479717', now() ,NULL ,NULL );

INSERT INTO tdh_od.organisation(
obj_id, identifier, identifier_short, municipality_number, organisation_type, remark, status, uid, last_modification, fk_dataowner, fk_provider)
VALUES ('ch20p3q4000000xx', 'ThermorésÔ Nyon SA', NULL, NULL, 8606, 'no official obj_id yet', 9047, 'CHE465878702', now() ,NULL ,NULL );

INSERT INTO tdh_od.organisation(
obj_id, identifier, identifier_short, municipality_number, organisation_type, remark, status, uid, last_modification, fk_dataowner, fk_provider)
VALUES ('ch20p3q4000000xy', 'ThermorésÔ SA', NULL, NULL, 8606, 'no official obj_id yet', 9047, 'CHE383608577', now() ,NULL ,NULL );

INSERT INTO tdh_od.organisation(
obj_id, identifier, identifier_short, municipality_number, organisation_type, remark, status, uid, last_modification, fk_dataowner, fk_provider)
VALUES ('ch24ztmgOG000002', 'Morges', NULL, 5642, 8604, 'no official obj_id yet', 9047, NULL, now() ,NULL ,NULL );

INSERT INTO tdh_od.organisation(
obj_id, identifier, identifier_short, municipality_number, organisation_type, remark, status, uid, last_modification, fk_dataowner, fk_provider)
VALUES ('ch20p3q4000000xz', 'Nyon', NULL, 5724, 8604, 'no official obj_id yet', 9047, NULL, now() ,NULL ,NULL );

/*---------------------------------------------------------------------------------------*/
/* AJOUT DES STRUCTURES (station de pompage et chambre) */
/*---------------------------------------------------------------------------------------*/
INSERT INTO tdh_od.structure (obj_id,name_number,horizontal_positioning,status,kind,installation_year,structure_sur_plus_cover,upper_elevation,geometry3d_geometry)
	VALUES ('ch24ztmgST000001','ch24ztmgST000001',8207,9469,8221,2023,372.2,0.0,'010A0000A0080800000100000001080000800300000013C10C3A414843416F29C6EA388F314152B81E85EB4D774047F43FED404843416F29C6EA388F314152B81E85EB4D774013C10C3A414843416F29C6EA388F314152B81E85EB4D7740');
INSERT INTO tdh_od.structure (obj_id,name_number,horizontal_positioning,status,kind,installation_year,structure_sur_plus_cover,upper_elevation,geometry3d_geometry)
	VALUES ('ch24ztmgST000002','ch24ztmgST000002',8207,9469,8227,2023,372.2,3.2,'010A0000A0080800000100000001020000800D0000002CC5A6DF164843418C232507148F31410000000000000000B7C0BB341E48434161208402138F31410000000000000000110D71F01E484341770674E8128F31410000000000000000071A79FD1E4843412C9FDE5F148F314100000000000000004F15DDB51F484341EE45E21F298F314100000000000000004422E5C21F484341A4DE4C972A8F31410000000000000000E9D52F071F4843418FF85CB12A8F314100000000000000005EDA1AB217484341BBFBFDB52B8F31410000000000000000048E65F616484341A5150ED02B8F314100000000000000000E815DE916484341F07CA3582A8F31410000000000000000C685F930164843412DD69F98158F31410000000000000000D078F12316484341753D3521148F314100000000000000002CC5A6DF164843418C232507148F31410000000000000000');

UPDATE tdh_od.structure SET fk_dataowner='ch24ztmgOG000001', fk_provider='ch24ztmgOG000001',fk_owner='ch24ztmgOG000001', network_area='STAP Morges';
SELECT setval('tdh_od.seq_structure_oid', 3, true);

/*---------------------------------------------------------------------------------------*/
/* AJOUT DES CONDUITES () */
/*---------------------------------------------------------------------------------------*/
INSERT INTO tdh_od.pipe_section (obj_id,name_number,horizontal_positioning,status,function,pipe_type,fluent,insulation_kind,coating,mg_material,installation_year,mg_trench_type,mg_diameter,mg_signaling_band,geometry3d_geometry)
	VALUES ('ch24ztmgPS000001','1',8008,9471,8020,8023,8027,8043,8051,9509,2023,9506,8089,9494,'01090000A008080000010000000102000080070000000C022B071F484341B07268B12A8F3141AE47E17A14447740F847D9191F4843416D0FA5042D8F3141AE47E17A1444774052B81EA51F484341A69BC4C02E8F3141AE47E17A14447740C520B05221484341355EBA492F8F3141AE47E17A14447740C520B05221484341355EBA492F8F3141AE47E17A14447740F2D24D8229484341F853E3E5318F3141AE47E17A144477402DB29DEF294843415839B408328F3141AE47E17A14447740');

INSERT INTO tdh_od.pipe_section (obj_id,name_number,horizontal_positioning,status,function,pipe_type,fluent,insulation_kind,coating,mg_material,installation_year,mg_trench_type,mg_diameter,mg_signaling_band,geometry3d_geometry)
	VALUES ('ch24ztmgPS000002','2',8008,9471,8020,8023,8027,8043,8051,9509,2023,9506,8087,9494,'01090000A008080000010000000102000080040000002DB29DEF294843415839B408328F3141AE47E17A1444774060E5D0722A4843418D976E32328F3141AE47E17A144477408D976EA2344843411F85EB71358F3141AE47E17A14447740AE47E13A414843415C8FC275398F3141AE47E17A14447740');

INSERT INTO tdh_od.pipe_section (obj_id,name_number,horizontal_positioning,status,function,pipe_type,fluent,insulation_kind,coating,mg_material,installation_year,mg_trench_type,mg_diameter,mg_signaling_band,geometry3d_geometry)
	VALUES ('ch24ztmgPS000003','3',8008,9471,8020,8023,8027,8043,8051,9509,2023,9506,8087,9494,'01090000A00808000001000000010200008002000000AE47E13A414843415C8FC275398F3141AE47E17A14447740DD240681424843410E2DB2DD398F3141AE47E17A14447740');

INSERT INTO tdh_od.pipe_section (obj_id,name_number,horizontal_positioning,status,function,pipe_type,fluent,insulation_kind,coating,mg_material,installation_year,mg_trench_type,mg_diameter,mg_signaling_band,geometry3d_geometry)
	VALUES ('ch24ztmgPS000004','4',8008,9471,8021,8023,8027,8043,8051,9509,2023,9506,8085,9494,'01090000A00808000001000000010200008002000000AE47E13A414843415C8FC275398F3141AE47E17A144477408716D97E414843412FDD24C6368F3141AE47E17A14447740');

INSERT INTO tdh_od.pipe_section (obj_id,name_number,horizontal_positioning,status,function,pipe_type,fluent,insulation_kind,coating,mg_material,installation_year,mg_trench_type,mg_diameter,mg_signaling_band,geometry3d_geometry)
	VALUES ('ch24ztmgPS000005','5',8008,9471,8020,8024,8027,8043,8051,9509,2023,9506,8089,9494,'01090000A0080800000100000001020000800600000077BE9F7A1F48434114AE47A12A8F3141AE47E17A14447740000000901F4843419EEFA7E62C8F3141AE47E17A14447740E3A59BE41F4843419EEFA7062E8F3141AE47E17A144477406666666621484341378941802E8F3141AE47E17A1444774077BE9F9A29484341A8C64B17318F3141AE47E17A144477403BDF4F0D2A4843411D5A643B318F3141AE47E17A14447740');

INSERT INTO tdh_od.pipe_section (obj_id,name_number,horizontal_positioning,status,function,pipe_type,fluent,insulation_kind,coating,mg_material,installation_year,mg_trench_type,mg_diameter,mg_signaling_band,geometry3d_geometry)
	VALUES ('ch24ztmgPS000006','6',8008,9471,8020,8024,8027,8043,8051,9509,2023,9506,8087,9494,'01090000A008080000010000000102000080040000003BDF4F0D2A4843411D5A643B318F3141AE47E17A144477400AD7A3902A4843411B2FDD64318F3141AE47E17A14447740A8C64BB7344843412B871699348F3141AE47E17A14447740AE47E1EA4048434133333373388F3141AE47E17A14447740');

INSERT INTO tdh_od.pipe_section (obj_id,name_number,horizontal_positioning,status,function,pipe_type,fluent,insulation_kind,coating,mg_material,installation_year,mg_trench_type,mg_diameter,mg_signaling_band,geometry3d_geometry)
	VALUES ('ch24ztmgPS000007','7',8008,9471,8020,8024,8027,8043,8051,9509,2023,9506,8087,9494,'01090000A00808000001000000010200008002000000AE47E1EA4048434133333373388F3141AE47E17A14447740BC749378424843410AD7A3F0388F3141AE47E17A14447740');

INSERT INTO tdh_od.pipe_section (obj_id,name_number,horizontal_positioning,status,function,pipe_type,fluent,insulation_kind,coating,mg_material,installation_year,mg_trench_type,mg_diameter,mg_signaling_band,geometry3d_geometry)
	VALUES ('ch24ztmgPS000008','8',8008,9471,8021,8024,8027,8043,8051,9509,2023,9506,8085,9494,'01090000A00808000001000000010200008003000000AE47E1EA4048434133333373388F3141AE47E17A14447740B6F3FD144148434177BE9F1A378F3141AE47E17A144477408716D97E414843412FDD24C6368F3141AE47E17A14447740');

UPDATE tdh_od.pipe_section SET fk_dataowner='ch24ztmgOG000001', fk_provider='ch24ztmgOG000001',fk_owner='ch24ztmgOG000001', remark='STAP Morges';
UPDATE tdh_od.pipe_section SET coating=8046, length1=Round((ST_Length(geometry3d_geometry)*1000)), length2=Round((ST_Length(geometry3d_geometry)*1000));

SELECT setval('tdh_od.seq_pipe_section_oid', 9, true);

/*---------------------------------------------------------------------------------------*/
/* AJOUT DES CABLES ()                                                                   */
/*---------------------------------------------------------------------------------------*/

INSERT INTO tdh_od.sia405cc_cable (obj_id,name_number,function,cable_type,horizontal_positioning,status,installation_year,sur_plus_cover,elevation_determination,depth,geometry3d_geometry)
	VALUES ('ch24ztmgCB000001','1',9340,9344,9349,9365,2023,372.2,9361,125,'01090000A008080000010000000102000080050000005EBA493C1F4843416DE7FBA92A8F3141AE47E17A14447740A245B6531F4843416ABC74F32C8F3141AE47E17A14447740C74B37B91F484341A4703D4A2E8F3141AE47E17A1444774083C0CA1141484341A4703DEA388F3141AE47E17A144477408D976E42414843414E621058378F3141AE47E17A14447740');

UPDATE tdh_od.sia405cc_cable SET fk_dataowner='ch24ztmgOG000001', fk_provider='ch24ztmgOG000001',fk_owner='ch24ztmgOG000001';

/*---------------------------------------------------------------------------------------*/
/* AJOUT DES POINTS DE CONDUITES ()                                                      */
/*---------------------------------------------------------------------------------------*/

INSERT INTO tdh_od.pipe_point (obj_id,horizontal_positioning,elevation_determination,altitude1,remark,geometry3d_geometry) VALUES ('ch24ztmgPF000001',8094,8102,372.25,543,'01010000A0080800008716D97E414843412FDD24C6368F3141AE47E17A14447740');
INSERT INTO tdh_od.pipe_point (obj_id,horizontal_positioning,elevation_determination,altitude1,remark,geometry3d_geometry) VALUES ('ch24ztmgPF000002',8094,8102,372.25,522,'01010000A0080800000C022B071F484341B07268B12A8F3141AE47E17A14447740');

INSERT INTO tdh_od.pipe_point (obj_id,horizontal_positioning,elevation_determination,altitude1,remark,geometry3d_geometry) VALUES ('ch24ztmgPN000001',8094,8102,372.25,538,'01010000A008080000AE47E1EA4048434133333373388F3141AE47E17A14447740');
INSERT INTO tdh_od.pipe_point (obj_id,horizontal_positioning,elevation_determination,altitude1,remark,geometry3d_geometry) VALUES ('ch24ztmgPN000002',8094,8102,372.25,539,'01010000A008080000AE47E13A414843415C8FC275398F3141AE47E17A14447740');
INSERT INTO tdh_od.pipe_point (obj_id,horizontal_positioning,elevation_determination,altitude1,remark,geometry3d_geometry) VALUES ('ch24ztmgPN000003',8094,8102,372.25,531,'01010000A0080800003BDF4F0D2A4843411D5A643B318F3141AE47E17A14447740');
INSERT INTO tdh_od.pipe_point (obj_id,horizontal_positioning,elevation_determination,altitude1,remark,geometry3d_geometry) VALUES ('ch24ztmgPN000004',8094,8102,372.25,532,'01010000A0080800002DB29DEF294843415839B408328F3141AE47E17A14447740');
INSERT INTO tdh_od.pipe_point (obj_id,horizontal_positioning,elevation_determination,altitude1,remark,geometry3d_geometry) VALUES ('ch24ztmgPN000005',8094,8102,372.25,521,'01010000A00808000077BE9F7A1F48434114AE47A12A8F3141AE47E17A14447740');
INSERT INTO tdh_od.pipe_point (obj_id,horizontal_positioning,elevation_determination,altitude1,remark,geometry3d_geometry) VALUES ('ch24ztmgPN000006',8094,8102,372.25,523,'01010000A008080000000000901F4843419EEFA7E62C8F3141AE47E17A14447740');
INSERT INTO tdh_od.pipe_point (obj_id,horizontal_positioning,elevation_determination,altitude1,remark,geometry3d_geometry) VALUES ('ch24ztmgPN000007',8094,8102,372.25,524,'01010000A0080800000E2DB21D1F4843415A643B7F2D8F3141AE47E17A14447740');
INSERT INTO tdh_od.pipe_point (obj_id,horizontal_positioning,elevation_determination,altitude1,remark,geometry3d_geometry) VALUES ('ch24ztmgPN000008',8094,8102,372.25,525,'01010000A008080000E3A59BE41F4843419EEFA7062E8F3141AE47E17A14447740');
INSERT INTO tdh_od.pipe_point (obj_id,horizontal_positioning,elevation_determination,altitude1,remark,geometry3d_geometry) VALUES ('ch24ztmgPN000009',8094,8102,372.25,526,'01010000A00808000052B81EA51F484341A69BC4C02E8F3141AE47E17A14447740');
INSERT INTO tdh_od.pipe_point (obj_id,horizontal_positioning,elevation_determination,altitude1,remark,geometry3d_geometry) VALUES ('ch24ztmgPN000010',8094,8102,372.25,542,'01010000A008080000B6F3FD144148434177BE9F1A378F3141AE47E17A14447740');
INSERT INTO tdh_od.pipe_point (obj_id,horizontal_positioning,elevation_determination,altitude1,remark,geometry3d_geometry) VALUES ('ch24ztmgPN000011',8094,8102,372.25,529,'01010000A00808000077BE9F9A29484341A8C64B17318F3141AE47E17A14447740');
INSERT INTO tdh_od.pipe_point (obj_id,horizontal_positioning,elevation_determination,altitude1,remark,geometry3d_geometry) VALUES ('ch24ztmgPN000012',8094,8102,372.25,530,'01010000A008080000F2D24D8229484341F853E3E5318F3141AE47E17A14447740');
INSERT INTO tdh_od.pipe_point (obj_id,horizontal_positioning,elevation_determination,altitude1,remark,geometry3d_geometry) VALUES ('ch24ztmgPN000013',8094,8102,372.25,533,'01010000A0080800000AD7A3902A4843411B2FDD64318F3141AE47E17A14447740');
INSERT INTO tdh_od.pipe_point (obj_id,horizontal_positioning,elevation_determination,altitude1,remark,geometry3d_geometry) VALUES ('ch24ztmgPN000014',8094,8102,372.25,534,'01010000A00808000060E5D0722A4843418D976E32328F3141AE47E17A14447740');
INSERT INTO tdh_od.pipe_point (obj_id,horizontal_positioning,elevation_determination,altitude1,remark,geometry3d_geometry) VALUES ('ch24ztmgPN000015',8094,8102,372.25,540,'01010000A008080000BC749378424843410AD7A3F0388F3141AE47E17A14447740');
INSERT INTO tdh_od.pipe_point (obj_id,horizontal_positioning,elevation_determination,altitude1,remark,geometry3d_geometry) VALUES ('ch24ztmgPN000016',8094,8102,372.25,541,'01010000A008080000DD240681424843410E2DB2DD398F3141AE47E17A14447740');
INSERT INTO tdh_od.pipe_point (obj_id,horizontal_positioning,elevation_determination,altitude1,remark,geometry3d_geometry) VALUES ('ch24ztmgPN000017',8094,8102,372.25,527,'01010000A0080800006666666621484341378941802E8F3141AE47E17A14447740');
INSERT INTO tdh_od.pipe_point (obj_id,horizontal_positioning,elevation_determination,altitude1,remark,geometry3d_geometry) VALUES ('ch24ztmgPN000018',8094,8102,372.25,528,'01010000A008080000C520B05221484341355EBA492F8F3141AE47E17A14447740');
INSERT INTO tdh_od.pipe_point (obj_id,horizontal_positioning,elevation_determination,altitude1,remark,geometry3d_geometry) VALUES ('ch24ztmgPN000019',8094,8102,372.25,535,'01010000A008080000A8C64BB7344843412B871699348F3141AE47E17A14447740');
INSERT INTO tdh_od.pipe_point (obj_id,horizontal_positioning,elevation_determination,altitude1,remark,geometry3d_geometry) VALUES ('ch24ztmgPN000020',8094,8102,372.25,536,'01010000A0080800008D976EA2344843411F85EB71358F3141AE47E17A14447740');

UPDATE tdh_od.pipe_point SET fk_dataowner='ch24ztmgOG000001', fk_provider='ch24ztmgOG000001',fk_owner='ch24ztmgOG000001';



INSERT INTO tdh_od.pipe_point_feed (obj_id,kind,year_of_commissioning) VALUES ('ch24ztmgPF000001',8158,2023);
INSERT INTO tdh_od.pipe_point_feed (obj_id,kind,year_of_commissioning) VALUES ('ch24ztmgPF000002',8156,2023);
SELECT setval('tdh_od.seq_pipe_point_normal_oid', 3, true);


INSERT INTO tdh_od.pipe_point_normal (obj_id,kind) VALUES ('ch24ztmgPN000001',8124); -- te
INSERT INTO tdh_od.pipe_point_normal (obj_id,kind) VALUES ('ch24ztmgPN000002',8124); -- te
INSERT INTO tdh_od.pipe_point_normal (obj_id,kind) VALUES ('ch24ztmgPN000003',8123); -- reduction
INSERT INTO tdh_od.pipe_point_normal (obj_id,kind) VALUES ('ch24ztmgPN000004',8123); -- reduction
INSERT INTO tdh_od.pipe_point_normal (obj_id,kind) VALUES ('ch24ztmgPN000005',8136); -- 8148 pt de construction
INSERT INTO tdh_od.pipe_point_normal (obj_id,kind) VALUES ('ch24ztmgPN000006',8136); -- 8148 pt de construction
INSERT INTO tdh_od.pipe_point_normal (obj_id,kind) VALUES ('ch24ztmgPN000007',8136); -- 8148 pt de construction
INSERT INTO tdh_od.pipe_point_normal (obj_id,kind) VALUES ('ch24ztmgPN000008',8136); -- 8148 pt de construction
INSERT INTO tdh_od.pipe_point_normal (obj_id,kind) VALUES ('ch24ztmgPN000009',8136); -- 8148 pt de construction
INSERT INTO tdh_od.pipe_point_normal (obj_id,kind) VALUES ('ch24ztmgPN000010',8136); -- 8148 pt de construction
INSERT INTO tdh_od.pipe_point_normal (obj_id,kind) VALUES ('ch24ztmgPN000011',8134); -- manchon
INSERT INTO tdh_od.pipe_point_normal (obj_id,kind) VALUES ('ch24ztmgPN000012',8134); -- manchon
INSERT INTO tdh_od.pipe_point_normal (obj_id,kind) VALUES ('ch24ztmgPN000013',8134); -- manchon
INSERT INTO tdh_od.pipe_point_normal (obj_id,kind) VALUES ('ch24ztmgPN000014',8134); -- manchon
INSERT INTO tdh_od.pipe_point_normal (obj_id,kind) VALUES ('ch24ztmgPN000015',8110); -- vanne
INSERT INTO tdh_od.pipe_point_normal (obj_id,kind) VALUES ('ch24ztmgPN000016',8110); -- vanne
INSERT INTO tdh_od.pipe_point_normal (obj_id,kind) VALUES ('ch24ztmgPN000017',8132); -- soudure
INSERT INTO tdh_od.pipe_point_normal (obj_id,kind) VALUES ('ch24ztmgPN000018',8132); -- soudure
INSERT INTO tdh_od.pipe_point_normal (obj_id,kind) VALUES ('ch24ztmgPN000019',8132); -- soudure
INSERT INTO tdh_od.pipe_point_normal (obj_id,kind) VALUES ('ch24ztmgPN000020',8132); -- soudure

UPDATE tdh_od.pipe_point_normal SET armature_setting=8149, material=8153 WHERE kind=8110; -- vannes, fermé, fonte
SELECT setval('tdh_od.seq_pipe_point_feed_oid', 21, true);

SELECT setval('tdh_od.seq_pipe_point_oid', 25, true);

/*---------------------------------------------------------------------------------------*/
/* AJOUT DES POINTS DE CABLES ()                                                      */
/*---------------------------------------------------------------------------------------*/

INSERT INTO tdh_od.sia405cc_cable_point (obj_id,name_number,kind,horizontal_positioning,altitude,elevation_determination,installation_year,geometry3d_geometry) VALUES ('ch24ztmgCI000001',552,9388,9392,372.25,9394,2023,'01010000A008080000A245B6531F4843416ABC74F32C8F3141AE47E17A14447740');
INSERT INTO tdh_od.sia405cc_cable_point (obj_id,name_number,kind,horizontal_positioning,altitude,elevation_determination,installation_year,geometry3d_geometry) VALUES ('ch24ztmgCI000002',553,9388,9392,372.25,9394,2023,'01010000A008080000C74B37B91F484341A4703D4A2E8F3141AE47E17A14447740');
INSERT INTO tdh_od.sia405cc_cable_point (obj_id,name_number,kind,horizontal_positioning,altitude,elevation_determination,installation_year,geometry3d_geometry) VALUES ('ch24ztmgCI000003',555,9388,9392,372.25,9394,2023,'01010000A0080800008D976E42414843414E621058378F3141AE47E17A14447740');
INSERT INTO tdh_od.sia405cc_cable_point (obj_id,name_number,kind,horizontal_positioning,altitude,elevation_determination,installation_year,geometry3d_geometry) VALUES ('ch24ztmgCI000004',551,9388,9392,372.25,9394,2023,'01010000A0080800005EBA493C1F4843416DE7FBA92A8F3141AE47E17A14447740');
INSERT INTO tdh_od.sia405cc_cable_point (obj_id,name_number,kind,horizontal_positioning,altitude,elevation_determination,installation_year,geometry3d_geometry) VALUES ('ch24ztmgCI000005',554,9388,9392,372.25,9394,2023,'01010000A00808000083C0CA1141484341A4703DEA388F3141AE47E17A14447740');

UPDATE tdh_od.sia405cc_cable_point SET fk_dataowner='ch24ztmgOG000001', fk_provider='ch24ztmgOG000001',fk_owner='ch24ztmgOG000001';
SELECT setval('tdh_od.seq_sia405cc_cable_point_oid', 6, true);

/*---------------------------------------------------------------------------------------*/
/* AJOUT DE LA TRANCHEE ()                                                      */
/*---------------------------------------------------------------------------------------*/

INSERT INTO tdh_od.trench (obj_id,name_number,horizontal_positioning,status,trench_type,trench_width,installation_year,embedding,control_system,cable_conduits,depth,geometry3d_geometry) VALUES ('ch24ztmgTR000001',1,8296,8301,8316,200,2023,8323,8327,8337,210,'010A0000A0080800000100000001090000800100000001020000800B0000004422E5C21F484341A4DE4C972A8F314100000000000000006021B2BC1E484341E33867BE2A8F31410000000000000000EE897BD61E484341E65BEE422D8F31410000000000000000529CB6691F48434157F622342F8F3141000000000000000042926872414843419CD3400C3A8F314100000000000000005A1CD8BE41484341EB2B4094378F31410000000000000000C01205C640484341B198E01B378F31410000000000000000C4EE2CB140484341AC0D3AC8378F314100000000000000003CFBB70820484341F1EA57602D8F314100000000000000005601F1D01F484341EE1CFBA32C8F314100000000000000004422E5C21F484341A4DE4C972A8F31410000000000000000');

UPDATE tdh_od.trench SET fk_dataowner='ch24ztmgOG000001', fk_provider='ch24ztmgOG000001',fk_owner='ch24ztmgOG000001';
SELECT setval('tdh_od.seq_trench_oid', 2, true);
