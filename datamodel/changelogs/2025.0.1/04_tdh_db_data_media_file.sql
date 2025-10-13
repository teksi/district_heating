

------- This has to come after organisation creation otherwise constraints will fail.
------- Datamedia table using same structure as VSA KEK
-------
CREATE TABLE tdh_od.data_media
(
   obj_id varchar(16) NOT NULL,
   CONSTRAINT pkey_tdh_od_data_media_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE SEQUENCE tdh_od.seq_data_media_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
COMMENT ON COLUMN tdh_od.data_media.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix), see www.interlis.ch';
 ALTER TABLE tdh_od.data_media ADD COLUMN identifier text;
 ALTER TABLE tdh_od.data_media ADD CONSTRAINT vo_identifier_length_max_60 CHECK(char_length(identifier)<=60);
COMMENT ON COLUMN tdh_od.data_media.identifier IS 'yyy_Name des Datenträgers. Bei elektronischen Datenträgern normalerweise das Volume-Label. Bei einem Server der Servername. Bei analogen Videobändern die Bandnummer. / Name des Datenträgers. Bei elektronischen Datenträgern normalerweise das Volume-Label. Bei einem Server der Servername. Bei analogen Videobändern die Bandnummer. / Nom du support de données. Pour les supports de données électroniques, normalement le label volume. Pour un serveur, le nom du serveur. Pour des bandes vidéo analogiques, les numéros de bandes.';
 ALTER TABLE tdh_od.data_media ADD COLUMN kind  integer ;
COMMENT ON COLUMN tdh_od.data_media.kind IS 'Describes the type of data media / Beschreibt die Art des Datenträgers / Décrit le genre de support de données';
 ALTER TABLE tdh_od.data_media ADD COLUMN location text;
 ALTER TABLE tdh_od.data_media ADD CONSTRAINT vo_location_length_max_50 CHECK(char_length(location)<=50);
COMMENT ON COLUMN tdh_od.data_media.location IS 'Location of the data medium / Ort, wo sich der Datenträger befindet / Emplacement du support de données';
 ALTER TABLE tdh_od.data_media ADD COLUMN path text;
 ALTER TABLE tdh_od.data_media ADD CONSTRAINT vo_path_length_max_1023 CHECK(char_length(path)<=1023);
COMMENT ON COLUMN tdh_od.data_media.path IS 'Access path to the data carrier. e.g. DVD drive -> D: , server -> //server/videos, hard disk -> c:/videos . For web servers -> URI (URL). Empty for an analog video tape / Zugriffspfad zum Datenträger. z.B. DVD-Laufwerk -> D: , Server -> //server/videos, Harddisk -> c:/videos . Bei Webserver eine URI (URL). Bei einem analogen Videoband leer / Chemin d’accès au support de données, p. ex. lecteur DVD -> D: , - serveur -> //server/videos , disque dur -> c:/videos , serveur_web -> URI(URL). Pour une bande vidéo analogique: vide';
 ALTER TABLE tdh_od.data_media ADD COLUMN remark text;
 ALTER TABLE tdh_od.data_media ADD CONSTRAINT vo_remark_length_max_80 CHECK(char_length(remark)<=80);
COMMENT ON COLUMN tdh_od.data_media.remark IS 'General remarks / Bemerkungen zum Datenträger / Remarques concernant le support de données';
 ALTER TABLE tdh_od.data_media ADD COLUMN last_modification TIMESTAMP without time zone DEFAULT now();
COMMENT ON COLUMN tdh_od.data_media.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE tdh_od.data_media ADD COLUMN fk_dataowner varchar(16);
COMMENT ON COLUMN tdh_od.data_media.fk_dataowner IS 'Foreignkey to Metaattribute dataowner (as an organisation) - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE tdh_od.data_media ADD COLUMN fk_provider varchar(16);
COMMENT ON COLUMN tdh_od.data_media.fk_provider IS 'Foreignkey to Metaattribute provider (as an organisation) - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée l’enregistrement de ces données ';

-------File table using same structure as VSA KEK
-------
CREATE TABLE tdh_od.file
(
   obj_id varchar(16) NOT NULL,
   CONSTRAINT pkey_tdh_od_file_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE SEQUENCE tdh_od.seq_file_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
COMMENT ON COLUMN tdh_od.file.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix), see www.interlis.ch';
 ALTER TABLE tdh_od.file ADD COLUMN classname  integer ;
COMMENT ON COLUMN tdh_od.file.classname IS 'Specifies the classname of the VSA-DSS data model to which the file belongs. In principle, all classes are possible. In the context of sewer television recordings, mainly channel, manhole damage, channel damage and examination. / Gibt an, zu welcher Klasse des VSA-DSS-Datenmodells die Datei gehört. Grundsätzlich alle Klassen möglich. Im Rahmen der Kanalfernsehaufnahmen hauptsächlich Kanal, Normschachtschaden, Kanalschaden und Untersuchung. / Indique à quelle classe du modèle de données de VSA-SDEE appartient le fichier. Toutes les classes sont possible. Surtout CANALISATION, DOMMAGE_CHAMBRE_STANDARD, DOMMAGE_CANALISATION, EXAMEN.';
 ALTER TABLE tdh_od.file ADD COLUMN identifier text;
 ALTER TABLE tdh_od.file ADD CONSTRAINT fi_identifier_length_max_120 CHECK(char_length(identifier)<=120);
COMMENT ON COLUMN tdh_od.file.identifier IS 'yyy_Name der Datei mit Dateiendung. Z.B video_01.mpg oder haltung_01.ipf / Name der Datei mit Dateiendung. Z.B video_01.mpg oder haltung_01.ipf / Nom du fichier avec terminaison du fichier. P. ex. video_01.mpg ou canalisation_01.ipf';
 ALTER TABLE tdh_od.file ADD COLUMN kind  integer ;
COMMENT ON COLUMN tdh_od.file.kind IS 'yyy_Beschreibt die Art der Datei. Für analoge Videos auf Bändern ist der Typ "Video" einzusetzen. Die Bezeichnung wird dann gleich gesetzt wie die Bezeichnung des Videobandes. / Beschreibt die Art der Datei. Für analoge Videos auf Bändern ist der Typ "Video" einzusetzen. Die Bezeichnung wird dann gleich gesetzt wie die Bezeichnung des Videobandes. / Décrit le type de fichier. Pour les vidéos analo-giques sur bandes, le type « vidéo » doit être entré. La désignation sera ensuite la même que celle de la bande vidéo.';
 ALTER TABLE tdh_od.file ADD COLUMN object text;
 ALTER TABLE tdh_od.file ADD CONSTRAINT fi_object_length_max_16 CHECK(char_length(object)<=16);
COMMENT ON COLUMN tdh_od.file.object IS 'yyy_Objekt-ID (OID) des Datensatzes zu dem die Datei gehört / Objekt-ID (OID) des Datensatzes zu dem die Datei gehört / Identification de l’ensemble de données auquel le fichier appartient (OID)';
 ALTER TABLE tdh_od.file ADD COLUMN path_relative text;
 ALTER TABLE tdh_od.file ADD CONSTRAINT fi_path_relative_length_max_200 CHECK(char_length(path_relative)<=200);
COMMENT ON COLUMN tdh_od.file.path_relative IS 'yyy_Zusätzlicher Relativer Pfad, wo die Datei auf dem Datenträger zu finden ist. Z.B. DVD_01. / Zusätzlicher Relativer Pfad, wo die Datei auf dem Datenträger zu finden ist. Z.B. DVD_01. / Accès relatif supplémentaire à l’emplacement du fichier sur le support de données. P. ex. DVD_01';
 ALTER TABLE tdh_od.file ADD COLUMN remark text;
 ALTER TABLE tdh_od.file ADD CONSTRAINT fi_remark_length_max_80 CHECK(char_length(remark)<=80);
COMMENT ON COLUMN tdh_od.file.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE tdh_od.file ADD COLUMN last_modification TIMESTAMP without time zone DEFAULT now();
COMMENT ON COLUMN tdh_od.file.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE tdh_od.file ADD COLUMN fk_dataowner varchar(16);
COMMENT ON COLUMN tdh_od.file.fk_dataowner IS 'Foreignkey to Metaattribute dataowner (as an organisation) - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE tdh_od.file ADD COLUMN fk_provider varchar(16);
COMMENT ON COLUMN tdh_od.file.fk_provider IS 'Foreignkey to Metaattribute provider (as an organisation) - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée l’enregistrement de ces données ';

------------ Relationships and Value Tables ----------- ;

CREATE TABLE tdh_vl.data_media_kind () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.data_media_kind ADD CONSTRAINT pkey_tdh_vl_data_media_kind_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.data_media_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (3784,3784,'other','andere','autre', 'altro', 'rrr_altul', '', '', '', '', '', '', '', '', '', '', 'other', 'andere', 'autre', '', '', 'true');
 INSERT INTO tdh_vl.data_media_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (3785,3785,'CD','CD','CD', 'CD', 'CD', '', '', '', '', '', '', '', '', '', '', 'CD', 'CD', 'CD', '', 'CD', 'true');
 INSERT INTO tdh_vl.data_media_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (3786,3786,'floppy_disc','Diskette','disquette', 'dischetto', '', '', '', '', '', '', '', '', '', '', '', 'floppy_disc', 'Diskette', 'disquette', '', '', 'true');
 INSERT INTO tdh_vl.data_media_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (3787,3787,'dvd','DVD','DVD', 'DVD', 'DVD', '', '', '', '', '', '', '', '', '', '', 'dvd', 'DVD', 'DVD', '', '', 'true');
 INSERT INTO tdh_vl.data_media_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (3788,3788,'harddisc','Festplatte','disque_dur', 'disco_fisso', '', '', '', '', '', '', '', '', '', '', '', 'harddisc', 'Festplatte', 'disque dur', '', '', 'true');
 INSERT INTO tdh_vl.data_media_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (3789,3789,'server','Server','serveur', 'server', 'server', '', '', '', '', '', 'Local server (as opposed to Webserver)', 'Lokaler Server (im Gegensatz zu Webserver)', 'Serveur local (par opposition à serveur web)', 'Server locale (rispetto all server web)', 'Server local (spre deosebire de server web)', 'server', 'Server', '', '', '', 'true');
 INSERT INTO tdh_vl.data_media_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (3790,3790,'videotape','Videoband','bande_video', 'nastro_video', 'rrr_Videoband', '', '', '', '', '', '', '', '', '', '', 'videotape', 'Videoband', 'bande vidéo', '', '', 'true');
 INSERT INTO tdh_vl.data_media_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (9318,9318,'webserver','Webserver','serveur_web', 'server_web', 'server_web', '', '', '', '', '', 'Web server with URI (https://de.wikipedia.org/wiki/Uniform_Resource_Identifier)', 'Webserver mit URI (https://de.wikipedia.org/wiki/Uniform_Resource_Identifier)', 'Serveur web avec URI (https://de.wikipedia.org/wiki/Uniform_Resource_Identifier)', 'Server web con URI (https://de.wikipedia.org/wiki/Uniform_Resource_Identifier)', 'Server web cu URI (https://de.wikipedia.org/wiki/Uniform_Resource_Identifier)', 'webserver', 'Webserver', 'serveur web', '', '', 'true');
 ALTER TABLE tdh_od.data_media ADD CONSTRAINT fkey_vl_data_media_kind FOREIGN KEY (kind)
 REFERENCES tdh_vl.data_media_kind (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE tdh_od.file ADD COLUMN fk_data_media varchar(16);
ALTER TABLE tdh_od.file ADD CONSTRAINT rel_file_data_media FOREIGN KEY (fk_data_media) REFERENCES tdh_od.data_media(obj_id) ON UPDATE CASCADE ON DELETE set null DEFERRABLE INITIALLY DEFERRED;

-- new TDH classes instead of wastewater classes
CREATE TABLE tdh_vl.file_classname () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.file_classname ADD CONSTRAINT pkey_tdh_vl_file_classname_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.file_classname (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (9519,9519,'structure','Bauwerk','Ouvrage', 'zzz_manufatto', '', '', '', '', '', '', '', '', '', '', '', 'structure', 'Bauwerk', '', '', '', 'true');
 INSERT INTO tdh_vl.file_classname (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (9531,9531,'file','Datei','Fichier', 'file', 'fisier', '', '', '', '', '', '', '', '', '', '', 'file', 'Datei', '', '', '', 'true');
 INSERT INTO tdh_vl.file_classname (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (9532,9532,'data_media','Datentraeger','Support_donnees', 'supporto_dati', 'suport_de_date', '', '', '', '', '', '', '', '', '', '', 'data_media', 'Datentraeger', '', '', '', 'true');
 INSERT INTO tdh_vl.file_classname (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (9520,9520,'hydraulic_node','Hydraulischer_Knoten','Noeud_hydraulique', 'zzz_Hydraulischer_Knoten', '', '', '', '', '', '', '', '', '', '', '', 'hydraulic_node', 'Hydraulischer_Knoten', '', '', '', 'true');
 INSERT INTO tdh_vl.file_classname (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (9521,9521,'hydraulic_line_section','Hydraulischer_Strang','Troncon_hydraulique', 'zzz_Hydraulischer Strang', '', '', '', '', '', '', '', '', '', '', '', 'hydraulic_line_section', 'Hydraulischer_Strang', '', '', '', 'true');
 INSERT INTO tdh_vl.file_classname (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (9522,9522,'cable','Kabel','Cable', 'cavo', '', '', '', '', '', '', '', '', '', '', '', 'cable', 'Kabel', '', '', '', 'true');
 INSERT INTO tdh_vl.file_classname (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (9523,9523,'cable_point','Kabelpunkt','Point_cable', 'punto_cavo', '', '', '', '', '', '', '', '', '', '', '', 'cable_point', 'Kabelpunkt', '', '', '', 'true');
 INSERT INTO tdh_vl.file_classname (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (9524,9524,'pipe_section','Leitungsabschnitt','Section_de_conduite', 'zzz_Leitungsabschnitt', '', '', '', '', '', '', '', '', '', '', '', 'pipe_section', 'Leitungsabschnitt', '', '', '', 'true');
 INSERT INTO tdh_vl.file_classname (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (9525,9525,'pipe_point_feed','Leitungspunkt_Einspeisung','Point_de_conduite_alimentation', 'zzz_Leitungspunkt_Einspeisung', '', '', '', '', '', '', '', '', '', '', '', 'pipe_point_feed', 'Leitungspunkt_Einspeisung', '', '', '', 'true');
 INSERT INTO tdh_vl.file_classname (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (9526,9526,'pipe_point_normal','Leitungspunkt_normal','Point_de_conduite_normal', 'zzz_Leitungspunkt_normal', '', '', '', '', '', '', '', '', '', '', '', 'pipe_point_normal', 'Leitungspunkt_normal', '', '', '', 'true');
 INSERT INTO tdh_vl.file_classname (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (9527,9527,'damage_structure','Schaden_Bauwerk','Degats_ouvrage', 'zzz_Schaden_Bauwerk', '', '', '', '', '', '', '', '', '', '', '', 'damage_structure', 'Schaden_Bauwerk', '', '', '', 'true');
 INSERT INTO tdh_vl.file_classname (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (9528,9528,'damage_pipe_section','Schaden_Leitungsabschnitt','Degats_section_de_conduite', 'zzz_Schaden_Leitungsabschnitt', '', '', '', '', '', '', '', '', '', '', '', 'damage_pipe_section', 'Schaden_Leitungsabschnitt', '', '', '', 'true');
 INSERT INTO tdh_vl.file_classname (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (9529,9529,'damage_pipe_point','Schaden_Leitungspunkt','Degats_point_de_conduite', 'zzz_Schaden_Leitungspunkt', '', '', '', '', '', '', '', '', '', '', '', 'damage_pipe_point', 'Schaden_Leitungspunkt', '', '', '', 'true');
 INSERT INTO tdh_vl.file_classname (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (9530,9530,'damage_trench','Schaden_Trasse','Degats_trace', 'zzz_Schaden_Trasse', '', '', '', '', '', '', '', '', '', '', '', 'damage_trench', 'Schaden_Trasse', '', '', '', 'true');
 ALTER TABLE tdh_od.file ADD CONSTRAINT fkey_vl_file_classname FOREIGN KEY (classname)
 REFERENCES tdh_vl.file_classname (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;

CREATE TABLE tdh_vl.file_kind () INHERITS (tdh_vl.value_list_base);
ALTER TABLE tdh_vl.file_kind ADD CONSTRAINT pkey_tdh_vl_file_kind_code PRIMARY KEY (code);
 INSERT INTO tdh_vl.file_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (3770,3770,'other','andere','autre', 'altro', 'rrr_altul', '', '', '', '', '', '', '', '', '', '', 'other', 'andere', 'autre', '', '', 'true');
 INSERT INTO tdh_vl.file_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (9146,9146,'digital_video','digitales_Video','video_numerique', 'video_digitale', 'rrr_digitales_Video', '', '', '', '', '', '', '', '', '', '', 'digital_video', 'digitales_Video', 'vidéo numérique', '', '', 'true');
 INSERT INTO tdh_vl.file_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (3772,3772,'photo','Foto','photo', 'foto', 'foto', '', '', '', '', '', '', '', '', '', '', 'photo', 'Foto', 'photo', '', '', 'true');
 INSERT INTO tdh_vl.file_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (3773,3773,'panoramo_film','Panoramofilm','film_panoramique', 'film_panoramico', 'rrr_Panoramofilm', '', '', '', '', '', '', '', '', '', '', 'panoramo_film', 'Panoramofilm', 'film panoramique', '', '', 'true');
 INSERT INTO tdh_vl.file_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (9147,9147,'scan','Scan','scan', 'scan', 'scanare', '', '', '', '', '', '', '', '', '', '', 'scan', 'Scan', 'scan', '', '', 'true');
 INSERT INTO tdh_vl.file_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (8812,8812,'sketch','Skizze','croquis', 'schizzo', 'schita', '', '', '', '', '', '', '', '', '', '', 'sketch', 'Skizze', 'croquis', '', 'Schi?a', 'true');
 INSERT INTO tdh_vl.file_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (3774,3774,'textfile','Textdatei','fichier_texte', 'file_di_testo', 'rrr_Textdatei', '', '', '', '', '', '', '', '', '', '', 'textfile', 'Textdatei', 'fichier texte', '', '', 'true');
 INSERT INTO tdh_vl.file_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, description_en, description_de, description_fr, description_it, description_ro, display_en, display_de, display_fr, display_it, display_ro, active) VALUES (3775,3775,'video','Video','video', 'video', 'rrr_video', '', '', '', '', '', '', '', '', '', '', 'video', 'Video', 'vidéo', '', '', 'true');
 ALTER TABLE tdh_od.file ADD CONSTRAINT fkey_vl_file_kind FOREIGN KEY (kind)
 REFERENCES tdh_vl.file_kind (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
--------- Relations to class organisation for dataowner and provider (new 3.11.2014);
-------- Relations to class organisation for dataowner and provider;

ALTER TABLE tdh_od.data_media ADD CONSTRAINT rel_od_data_media_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES tdh_od.organisation(obj_id);
ALTER TABLE tdh_od.data_media ADD CONSTRAINT rel_od_data_media_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES tdh_od.organisation(obj_id);
ALTER TABLE tdh_od.file ADD CONSTRAINT rel_od_file_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES tdh_od.organisation(obj_id);
ALTER TABLE tdh_od.file ADD CONSTRAINT rel_od_file_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES tdh_od.organisation(obj_id);

------ Indexes on identifiers

 CREATE UNIQUE INDEX in_od_data_media_identifier ON tdh_od.data_media USING btree (identifier ASC NULLS LAST, fk_dataowner ASC NULLS LAST);
 CREATE UNIQUE INDEX in_od_file_identifier ON tdh_od.file USING btree (identifier ASC NULLS LAST, fk_dataowner ASC NULLS LAST);

