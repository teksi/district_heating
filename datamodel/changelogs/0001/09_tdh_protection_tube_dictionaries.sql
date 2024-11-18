------ this file generates the tdh is_dictionary (Modul schutzrohr(based on SIA405_SCHUTZROHR_3D_2015_LV95 (Version 18.04.2018)) in en on TEKSI
------ For questions etc. please contact Stefan Burckhardt stefan.burckhardt@sjib.ch
------ version 28.10.2024 20:55:28
------ with 3D coordinates

 INSERT INTO tdh_sys.dictionary_od_table (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr, name_it, shortcut_it, name_ro, shortcut_ro) VALUES (8502,'sia405pt_protection_tube','protection tube','PT','Schutzrohr','PT','tube de protection','TP','pozzetto termico','NULL','rrr_Schutzrohr','NULL');




 INSERT INTO tdh_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (8502,9418,'sia405pt_protection_tube','name_number','name_number','Name_Nummer','Nom_numero','nome_numero','nume_numarul','NULL','NULL','NULL','NULL','NULL',ARRAY['Werkinformation']::tdh_od.plantype[],'true','varchar(40)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (8502,9419,'sia405pt_protection_tube','geometry','geometry','Geometrie','Geometrie','geometria','geometria','NULL','NULL','NULL','NULL','NULL',ARRAY['Leitungskataster','Werkinformation']::tdh_od.plantype[],'true','geometry',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (8502,9420,'sia405pt_protection_tube','material','material','Material','Materiau','materiale','material','NULL','NULL','NULL','NULL','NULL',ARRAY['Werkinformation']::tdh_od.plantype[],'true','integer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (8502,9421,'sia405pt_protection_tube','nominal_diameter','nominal_diameter','Nennweite','Largeur_nominale','larghezza_nominale','diametrul_nominal','NULL','NULL','NULL','NULL','NULL',ARRAY['Werkinformation']::tdh_od.plantype[],'true','varchar(10)',NULL,'as TEXT, because sometimes also double values with slash inbetween eg. 500/800',NULL,'als TEXT, da zum Teil auch Doppelwerte mit Schrägstrich (1500/1000)',NULL,'En tant que TEXT, car peut contenir des valeurs doubles avec barre oblique (1500/1000)',NULL,'come TESTO, poiché in alcuni casi valori doppi con slash (1500/1000)',NULL,'rrr_als TEXT, da zum Teil auch Doppelwerte mit Schrägstrich (1500/1000)',NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (8502,9422,'sia405pt_protection_tube','outside_diameter','outside_diameter','Aussendurchmesser','Diametre_exterieur','diametro_esterno','diametrul_exterior','NULL','NULL','NULL','NULL','NULL',ARRAY['Leitungskataster','Werkinformation']::tdh_od.plantype[],'true','smallint','[mm]','millimeter [mm]','[mm]','Millimeter [mm]','[mm]','milimétre [mm]','[mm]','millimetro [mm]','[mm]','rrr_Millimeter [mm]',0,999999);
 INSERT INTO tdh_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (8502,9423,'sia405pt_protection_tube','lenght','lenght','Laenge','Longeur','lunghezza','lungime','NULL','NULL','NULL','NULL','NULL',ARRAY['Werkinformation']::tdh_od.plantype[],'true','smallint','[mm]','millimeter [mm]','[mm]','Millimeter [mm]','[mm]','milimétre [mm]','[mm]','millimetro [mm]','[mm]','rrr_Millimeter [mm]',0,999999);
 INSERT INTO tdh_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (8502,9424,'sia405pt_protection_tube','installation_year','installation_year','Einbaujahr','Annee_construction','anno_costruzione','anul_instalarii','NULL','NULL','NULL','NULL','NULL',ARRAY['Werkinformation']::tdh_od.plantype[],'true','smallint',NULL,' If unknown set lowest value of value range',NULL,'Falls unbekannt, tiefsten Wert des Wertebereichs einsetzen',NULL,'Si inconnu ajouter la plus bas valeur du domaine des valeurs',NULL,'Se sconosciuto, inserire valore minimo dell’intervallo di valori',NULL,'rrr_Falls unbekannt, tiefsten Wert des Wertebereichs einsetzen',1800,2100);
 INSERT INTO tdh_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (8502,9425,'sia405pt_protection_tube','horizontal_positioning','horizontal_positioning','Lagebestimmung','Determination_planimetrique','determinazione_posizione','precizie_pozitie','NULL','NULL','NULL','NULL','NULL',ARRAY['Leitungskataster','Werkinformation']::tdh_od.plantype[],'true','integer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (8502,9426,'sia405pt_protection_tube','status','status','Status','Etat','stato','stare','Operating and planning status of the structure','Betriebs- bzw. Planungszustand des Bauwerks','Etat de fonctionnement et de planification de l’ouvrage','Stato di funzionamento e di pianificazione del manufatto.','NULL',ARRAY['Leitungskataster','Werkinformation']::tdh_od.plantype[],'true','integer',NULL,'extends value range of SIA405 status',NULL,'Erweitert Wertebereich von SIA405 Status',NULL,'extension valeurs SIA405 Etat',NULL,'dilatato codominio SIA405 Stato',NULL,'rrr_Erweitert Wertebereich von SIA405 Status',NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (8502,9427,'sia405pt_protection_tube','sur_plus_cover','sur_plus_cover','Ueberdeckung','Couverture','zzz_Ueberdeckung','','yyy_mittlerer Wert eines Objektes','mittlerer Wert eines Objektes','xxx_mittlerer Wert eines Objektes','zzz_mittlerer Wert eines Objektes','rrr_mittlerer Wert eines Objektes',ARRAY['Werkinformation']::tdh_od.plantype[],'true','decimal(4,1)','[m]','meter [m]','[m]','Meter [m]','[m]','mètre [m]','[m]','metro [m]','[m]','rrr_Meter [m]',0,999.9);
 INSERT INTO tdh_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (8502,9428,'sia405pt_protection_tube','condition','condition','Zustand','Condition','condizione','rrr_Zustand','NULL','NULL','NULL','NULL','NULL',ARRAY['Werkinformation']::tdh_od.plantype[],'true','varchar(30)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (8502,9429,'sia405pt_protection_tube','remark','remark','Bemerkung','Remarque','osservazione','observatie','General remarks','Allgemeine Bemerkungen','Remarques générales','NULL','NULL',ARRAY['Werkinformation']::tdh_od.plantype[],'true','varchar(80)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (8502,9457,'sia405pt_protection_tube','geometry3d','geometry3d','Geometrie3D','Geometrie3D','geometria3d','geometria3D','NULL','NULL','NULL','NULL','NULL',ARRAY['Werkinformation']::tdh_od.plantype[],'true','geometry','[HKoord]','points with coordinates in the swiss national grid','[HKoord]','Punkte mit Schweizer Landeskoordinaten [HKoord]','[CoordH]','points avec coordonnées dans le système de coordonnées suisse','[HKoord]','Punti con coordinate nazionali svizzere','[HKoord]','rrr_Punkte mit Schweizer Landeskoordinaten',NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (8502,999999,'sia405pt_protection_tube','OBJ_ID','OBJ_ID','OBJ_ID','OBJ_ID','OBJ_ID','OBJ_ID','OBJ_ID - Unique ID','OBJ_ID - eindeutige Kennung','OBJ_ID - ID unique','OBJ_ID - identificatore univoco','rrr_OBJ_ID - eindeutige Kennung',ARRAY['Werkinformation','Leitungskataster', 'GEP_Verband','GEP_Traegerschaft','SAA', 'PAA']::tdh_od.plantype[],'true','varchar(16)','','','','','','','','','','',NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (8502,999998,'sia405pt_protection_tube','dataowner','dataowner','Datenherr','MAITRE_DES_DONNEES','proprietario_dati','rrr_Datenherr','dataowner - this is the person or body who is allowed to delete, change or maintain this object','Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten','Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe','zzz_Metaattribut L''attributo proprietario dati si riferisce alla persona o ente che è autorizzato a eliminare, modificare o gestire i dati','rrr_Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten',ARRAY['Werkinformation','Leitungskataster', 'GEP_Verband','GEP_Traegerschaft','SAA', 'PAA']::tdh_od.plantype[],'true','varchar(80)','','','','','','','','','','',NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (8502,999997,'sia405pt_protection_tube','provider','provider','Datenlieferant','FOURNISSEUR_DES_DONNEES','fornitore_dati','rrr_Datenlieferant','Metaattribute provider - this is the person or body who delivered the data','Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat','FOURNISSEUR DES DONNEES Organisation qui crée l’enregistrement de ces données','zzz_Metaattribut L''attributo fornitore dati si riferisce alla persona o ente che ha fornito i dati','rrr_Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat',ARRAY['Werkinformation','Leitungskataster', 'GEP_Verband','GEP_Traegerschaft','SAA', 'PAA']::tdh_od.plantype[],'true','varchar(80)','','','','','','','','','','',NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (8502,999996,'sia405pt_protection_tube','last_modification','last_modification','Letzte_Aenderung','DERNIERE_MODIFICATION','ultima_modifica','rrr_Letze_Aenderung','Last modification: INTERLIS_1_DATE','Letzte Änderung: INTERLIS_1_DATE','Dernière modification: INTERLIS_1_DATE','ultima_modifica: INTERLIS_1_DATE','rrr_Letzte Änderung: INTERLIS_1_DATE',ARRAY['Werkinformation','Leitungskataster', 'GEP_Verband','GEP_Traegerschaft','SAA', 'PAA']::tdh_od.plantype[],'true','TIMESTAMP','','','','','','','','','','',NULL,NULL);



 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (8502,9420,9432,'sia405pt_protection_tube','material','unknown','unknown',NULL,'unbekannt',NULL,'inconnue',NULL,'sconosciuto',NULL,'necunoscuta',NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (8502,9420,9433,'sia405pt_protection_tube','material','plastic.polyethylene','plastic.polyethylene',NULL,'Kunststoff.Polyethylen',NULL,'matiere_synthetique.polyethylene',NULL,'materiale_sintetico.polietilene',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (8502,9420,9434,'sia405pt_protection_tube','material','plastic.PVC','plastic.PVC',NULL,'Kunststoff.Polyvinylchlorid',NULL,'matiere_synthetique.chlorure_de_polyvinyle',NULL,'materiale_sintetico.polivinilcloruro',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (8502,9420,9435,'sia405pt_protection_tube','material','steel','steel',NULL,'Stahl',NULL,'acier',NULL,'acciaio',NULL,'otel',NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (8502,9420,9436,'sia405pt_protection_tube','material','cast_iron.ductile_cast','cast_iron.ductile_cast',NULL,'Guss.Guss_duktil',NULL,'fonte.fonte_ductil',NULL,'ghisa.ghisa_duttile',NULL,'fonta.fonta_ductila',NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (8502,9420,9437,'sia405pt_protection_tube','material','cast_iron.gray_iron','cast_iron.gray_iron',NULL,'Guss.Grauguss',NULL,'fonte.fonte_grise',NULL,'ghisa.ghisa_grigia',NULL,'fonta.fonta_cenusie',NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (8502,9420,9438,'sia405pt_protection_tube','material','concrete','concrete',NULL,'Beton',NULL,'beton',NULL,'calcestruzzo',NULL,'beton',NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (8502,9425,9443,'sia405pt_protection_tube','horizontal_positioning','accurate','accurate',NULL,'genau',NULL,'precis',NULL,'precisa',NULL,'precisa',NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (8502,9425,9444,'sia405pt_protection_tube','horizontal_positioning','unknown','unknown',NULL,'unbekannt',NULL,'inconnue',NULL,'sconosciuto',NULL,'necunoscuta',NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (8502,9425,9445,'sia405pt_protection_tube','horizontal_positioning','inaccurate','inaccurate',NULL,'ungenau',NULL,'imprecis',NULL,'impreciso',NULL,'imprecisa',NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (8502,9426,9446,'sia405pt_protection_tube','status','inoperative','inoperative',NULL,'ausser_Betrieb',NULL,'hors_service',NULL,'fuori_servizio',NULL,'rrr_ausser_Betrieb',NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (8502,9426,9447,'sia405pt_protection_tube','status','inoperative.reserve','inoperative.reserve',NULL,'ausser_Betrieb.Reserve',NULL,'hors_service.en_reserve',NULL,'fuori_servizio.riserva',NULL,'rrr_ausser_Betrieb.Reserve',NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (8502,9426,9448,'sia405pt_protection_tube','status','operational','operational',NULL,'in_Betrieb',NULL,'en_service',NULL,'in_funzione',NULL,'functionala',NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (8502,9426,9449,'sia405pt_protection_tube','status','operational.tentative','operational.tentative',NULL,'in_Betrieb.provisorisch',NULL,'en_service.provisoire',NULL,'in_funzione.provvisorio',NULL,'functionala.provizoriu',NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (8502,9426,9450,'sia405pt_protection_tube','status','others','others',NULL,'weitere',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (8502,9426,9451,'sia405pt_protection_tube','status','other.calculation_alternative','other.calculation_alternative',NULL,'weitere.Berechnungsvariante',NULL,'autre.variante_de_calcule',NULL,'altro.variante_calcolo',NULL,'alta.varianta_calcul',NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (8502,9426,9452,'sia405pt_protection_tube','status','other.planned','other.planned',NULL,'weitere.geplant',NULL,'autre.planifie',NULL,'altro.previsto',NULL,'rrr_weitere.geplant',NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (8502,9426,9453,'sia405pt_protection_tube','status','other.project','other.project',NULL,'weitere.Projekt',NULL,'autre.projet',NULL,'altro.progetto',NULL,'alta.proiect',NULL,NULL,NULL,NULL,NULL,NULL);