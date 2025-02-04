BEGIN;

------- Extra attributes on pipe_section based on discussion in https://github.com/teksi/district_heating/issues/54 for Morges (mg)
------ For questions etc. please contact Stefan Burckhardt stefan.burckhardt@sjib.ch
------ version 4.2.2025

------- add extra attributes to pipe_section
 ALTER TABLE tdh_od.pipe_section ADD COLUMN mg_trench_type  integer ;
COMMENT ON COLUMN tdh_od.pipe_section.mg_trench_type IS '';
 ALTER TABLE tdh_od.pipe_section ADD COLUMN trench_width smallint ;
COMMENT ON COLUMN tdh_od.pipe_section.trench_width IS '';
 ALTER TABLE tdh_od.pipe_section ADD COLUMN mg_marking_band integer ;
COMMENT ON COLUMN tdh_od.pipe_section.mg_marking_band IS '';

------------ Relationships and Value Tables ----------- ;
CREATE TABLE tdh_vl.pipe_section_mg_trench_type () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.pipe_section_mg_trench_type ADD CONSTRAINT pkey_tdh_vl_pipe_section_mg_trench_type_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.pipe_section_mg_trench_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8311,8311,'walkable_channel','begehbarer_Kanal','canal_accessible', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_mg_trench_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8317,8317,'buried.expansion_pads','erdverlegt.Dehnungspolster','enterre.matelas_de_dilatation', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_mg_trench_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8316,8316,'buried.normal','erdverlegt.normal','enterre.normale', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_mg_trench_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8313,8313,'overhead_line','Freileitung','conduite_aerienne', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_mg_trench_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8312,8312,'vault','Gewoelbe','voute', 'zzz_Gewoelbe', 'rrr_Gewoelbe', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_mg_trench_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8309,8309,'hooded_channel','Haubenkanal','caniveau', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_mg_trench_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8310,8310,'insitu_concrete_channel','Ortsbetonkanal','caniveau_en_beton', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_mg_trench_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8314,8314,'hydraulic_pressure_pipe','Pressrohr','pousse_tube', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_mg_trench_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8315,8315,'protection_tube','Schutzrohr','fourreau', 'zzz_Schutzrohr', 'rrr_Schutzrohr', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_mg_trench_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8308,8308,'unknown','unbekannt','inconnu', 'sconosciuto', 'necunoscuta', '', '', '', '', '', 'true');
 ALTER TABLE tdh_od.pipe_section ADD CONSTRAINT fkey_vl_pipe_section_mg_trench_type FOREIGN KEY (mg_trench_type)
 REFERENCES tdh_vl.pipe_section_mg_trench_type (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;


--- pipe_section_mg_marking_band
CREATE TABLE tdh_vl.pipe_section_mg_marking_band () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.pipe_section_mg_marking_band ADD CONSTRAINT pkey_tdh_vl_pipe_section_mg_marking_band_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.pipe_section_mg_marking_band (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9494,9494,'with_signaling_band','mit_Warnband','avec_bande', '', '', '', '', '', '', '', 'true');
 INSERT INTO tdh_vl.pipe_section_mg_marking_band (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9495,9495,'without_signaling_band','ohne_Warnband','sans_bande', '', '', '', '', '', '', '', 'true');
  INSERT INTO tdh_vl.pipe_section_mg_marking_band (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9497,9497,'unknown','unbekannt','inconnu', 'sconosciuto', 'necunoscuta', '', '', '', '', '', 'true');
   ALTER TABLE tdh_od.pipe_section ADD CONSTRAINT fkey_vl_pipe_section_mg_marking_band FOREIGN KEY (mg_trench_type)
 REFERENCES tdh_vl.pipe_section_mg_marking_band (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;

 COMMIT;
