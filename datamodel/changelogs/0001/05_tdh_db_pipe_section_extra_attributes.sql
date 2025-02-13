BEGIN;

------- Extra attributes on pipe_section based on discussion in https://github.com/teksi/district_heating/issues/54 for Morges (mg)
------ For questions etc. please contact Stefan Burckhardt stefan.burckhardt@sjib.ch
------ version 4.2.2025

------- add extra attributes to pipe_section
 ALTER TABLE tdh_od.pipe_section ADD COLUMN mg_trench_type  integer ;
COMMENT ON COLUMN tdh_od.pipe_section.mg_trench_type IS '';
 ALTER TABLE tdh_od.pipe_section ADD COLUMN trench_width smallint ;
COMMENT ON COLUMN tdh_od.pipe_section.trench_width IS '';
 ALTER TABLE tdh_od.pipe_section ADD COLUMN mg_signaling_band  integer ;
COMMENT ON COLUMN tdh_od.pipe_section.mg_signaling_band IS ' / Les conduites sont marquées par une bande de signalisation de couleur';


------------ Relationships and Value Tables ----------- ;
CREATE TABLE tdh_vl.pipe_section_mg_trench_type () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.pipe_section_mg_trench_type ADD CONSTRAINT pkey_tdh_vl_pipe_section_mg_trench_type_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.pipe_section_mg_trench_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (9498,9498,'walkable_channel','begehbarer_Kanal','canal_accessible', '', '', '', '', '', '', '', '', '', '', '', '', 'walkable_channel', 'begehbarer_Kanal', 'canal accessible', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_mg_trench_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (9507,9507,'buried.expansion_pads','erdverlegt.Dehnungspolster','enterre.matelas_de_dilatation', '', '', '', '', '', '', '', '', '', '', '', '', 'buried.expansion_pads', 'erdverlegt.Dehnungspolster', 'enterre.matelas de dilatation', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_mg_trench_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (9506,9506,'buried.normal','erdverlegt.normal','enterre.normale', '', '', '', '', '', '', '', '', '', '', '', '', 'buried.normal', 'erdverlegt.normal', 'enterre.normale', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_mg_trench_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (9502,9502,'overhead_line','Freileitung','conduite_aerienne', '', '', '', '', '', '', '', '', '', '', '', '', 'overhead_line', 'Freileitung', 'conduite aerienne', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_mg_trench_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (9499,9499,'vault','Gewoelbe','voute', 'zzz_Gewoelbe', 'rrr_Gewoelbe', '', '', '', '', '', '', '', '', '', '', 'vault', 'Gewoelbe', 'voute', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_mg_trench_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (9505,9505,'hooded_channel','Haubenkanal','caniveau', '', '', '', '', '', '', '', '', '', '', '', '', 'hooded_channel', 'Haubenkanal', 'caniveau', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_mg_trench_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (9503,9503,'insitu_concrete_channel','Ortsbetonkanal','caniveau_en_beton', '', '', '', '', '', '', '', '', '', '', '', '', 'insitu_concrete_channel', 'Ortsbetonkanal', 'caniveau en béton', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_mg_trench_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (9504,9504,'hydraulic_pressure_pipe','Pressrohr','pousse_tube', '', '', '', '', '', '', '', '', '', '', '', '', 'hydraulic_pressure_pipe', 'Pressrohr', 'pousse tube', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_mg_trench_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (9501,9501,'protection_tube','Schutzrohr','fourreau', 'zzz_Schutzrohr', 'rrr_Schutzrohr', '', '', '', '', '', '', '', '', '', '', 'protection_tube', 'Schutzrohr', 'fourreau', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_mg_trench_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (9500,9500,'unknown','unbekannt','inconnu', 'sconosciuto', 'necunoscuta', '', '', '', '', '', '', '', '', '', '', 'unknown', 'unbekannt', 'inconnu', '', '', 'true');
 ALTER TABLE tdh_od.pipe_section ADD CONSTRAINT fkey_vl_pipe_section_mg_trench_type FOREIGN KEY (mg_trench_type)
 REFERENCES tdh_vl.pipe_section_mg_trench_type (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;


--- pipe_section_mg_signaling_band
CREATE TABLE tdh_vl.pipe_section_mg_signaling_band () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.pipe_section_mg_signaling_band ADD CONSTRAINT pkey_tdh_vl_pipe_section_mg_signaling_band_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.pipe_section_mg_signaling_band (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (9494,9494,'with_signaling_band','mit_Warnband','avec_bande', 'zzz_mit_Warnband', 'rrr_mit_Warnband', '', '', '', '', '', '', '', '', '', '', 'with_signaling_band', 'mit_Warnband', 'avec bande', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_mg_signaling_band (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (9495,9495,'without_signaling_band','ohne_Warnband','sans_bande', 'zzz_ohne_Warnband', 'rrr_ohne_Warnband', '', '', '', '', '', '', '', '', '', '', 'without_signaling_band', 'ohne_Warnband', 'sans bande', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_mg_signaling_band (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (9497,9497,'unknown','unbekannt','inconnue', 'zzz_unbekannt', 'rrr_unbekannt', '', '', '', '', '', '', '', '', '', '', 'unknown', 'unbekannt', 'inconnue', '', '', 'true');
 ALTER TABLE tdh_od.pipe_section ADD CONSTRAINT fkey_vl_pipe_section_mg_signaling_band FOREIGN KEY (mg_signaling_band)
 REFERENCES tdh_vl.pipe_section_mg_signaling_band (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;

 COMMIT;
