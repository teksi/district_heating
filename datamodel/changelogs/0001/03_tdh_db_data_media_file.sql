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

-------File tabel using same structure as VSA KEK
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
