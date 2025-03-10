 INSERT INTO tww_sys.dictionary_od_table (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr, name_it, shortcut_it, name_ro, shortcut_ro) VALUES (3754,'file','file','FI','Datei','DA','Fichier','FI','File','NULL','Fi?ier','NULL');
 INSERT INTO tww_sys.dictionary_od_table (id, tablename, name_en, shortcut_en, name_de, shortcut_de, name_fr, shortcut_fr, name_it, shortcut_it, name_ro, shortcut_ro) VALUES (3776,'data_media','data media','VO','Datenträger','DT','Support données','SO','Supporto dati','NULL','rrr_Datentraeger','NULL');


INSERT INTO tww_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (3754,3764,'file','classname','classname','Klasse','CLASSE','classe','clasa','Specifies the classname of the VSA-DSS data model to which the file belongs. In principle, all classes are possible. In the context of sewer television recordings, mainly channel, manhole damage, channel damage and examination.','Gibt an, zu welcher Klasse des VSA-DSS-Datenmodells die Datei gehört. Grundsätzlich alle Klassen möglich. Im Rahmen der Kanalfernsehaufnahmen hauptsächlich Kanal, Normschachtschaden, Kanalschaden und Untersuchung.','Indique à quelle classe du modèle de données de VSA-SDEE appartient le fichier. Toutes les classes sont possible. Surtout CANALISATION, DOMMAGE_CHAMBRE_STANDARD, DOMMAGE_CANALISATION, EXAMEN.','Indica a quale classe del modello VSA-DSS appartiene il file. Praticamente tutte le classi possibili. Nell''ambito delle registrazioni televisive di canali, principalmente canali, classe danni pozzetto standard, danni canalizzazione e ispezione','rrr_Gibt an, zu welcher Klasse des VSA-DSS-Datenmodells die Datei gehört. Grundsätzlich alle Klassen möglich. Im Rahmen der Kanalfernsehaufnahmen hauptsächlich Kanal, Normschachtschaden, Kanalschaden und Untersuchung.',ARRAY['kein_Plantyp_definiert']::tww_od.plantype[],'true','integer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tww_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (3754,3754,'file','identifier','identifier','Bezeichnung','DESIGNATION','denominazione','identificator','yyy_Name der Datei mit Dateiendung. Z.B video_01.mpg oder haltung_01.ipf','Name der Datei mit Dateiendung. Z.B video_01.mpg oder haltung_01.ipf','Nom du fichier avec terminaison du fichier. P. ex. video_01.mpg ou canalisation_01.ipf','Nome del file con estensione file. Per es. video_01.mpg o tronco_01.ipf','rrr_Name der Datei mit Dateiendung. Z.B video_01.mpg oder haltung_01.ipf',ARRAY['kein_Plantyp_definiert']::tww_od.plantype[],'true','varchar(120)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tww_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (3754,3769,'file','kind','kind','Art','GENRE','tipo','tip','yyy_Beschreibt die Art der Datei. Für analoge Videos auf Bändern ist der Typ "Video" einzusetzen. Die Bezeichnung wird dann gleich gesetzt wie die Bezeichnung des Videobandes.','Beschreibt die Art der Datei. Für analoge Videos auf Bändern ist der Typ "Video" einzusetzen. Die Bezeichnung wird dann gleich gesetzt wie die Bezeichnung des Videobandes.','Décrit le type de fichier. Pour les vidéos analo-giques sur bandes, le type « vidéo » doit être entré. La désignation sera ensuite la même que celle de la bande vidéo.','Descrive il tipo di file. Per video analogici su nastri si deve inserire il tipo «video». La designazione è identificata con la designazione del nastro video','rrr_Beschreibt die Art der Datei. Für analoge Videos auf Bändern ist der Typ "Video" einzusetzen. Die Bezeichnung wird dann gleich gesetzt wie die Bezeichnung des Videobandes.',ARRAY['kein_Plantyp_definiert']::tww_od.plantype[],'true','integer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tww_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (3754,3765,'file','object','object','Objekt','OBJET','oggetto','obiect','yyy_Objekt-ID (OID) des Datensatzes zu dem die Datei gehört','Objekt-ID (OID) des Datensatzes zu dem die Datei gehört','Identification de l’ensemble de données auquel le fichier appartient (OID)','ID dell’oggetto (OID) del record dei dati a cui appartiene il file','rrr_Objekt-ID (OID) des Datensatzes zu dem die Datei gehört',ARRAY['kein_Plantyp_definiert']::tww_od.plantype[],'true','varchar(16)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tww_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (3754,9222,'file','oid','oid','OID','OID','OID','OID','Stable unique object identification for all objects and classes','Stabile eindeutige Objektidentifikation für alle Objekte und Klassen','Identification d''objet unique stable pour tous les objets et toutes les classes','Identificazione univoca e stabile per tutti gli oggetti e le classi','Identificare unica stabila a obiectelor pentru toate obiectele ?i clasele',ARRAY['GEP_Verband','PAA','SAA']::tww_od.plantype[],'true','varchar(16)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tww_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (3754,3767,'file','path_relative','path_relative','Relativpfad','ACCES_RELATIF','percorso_relativo','rrr_Relativpfad','yyy_Zusätzlicher Relativer Pfad, wo die Datei auf dem Datenträger zu finden ist. Z.B. DVD_01.','Zusätzlicher Relativer Pfad, wo die Datei auf dem Datenträger zu finden ist. Z.B. DVD_01.','Accès relatif supplémentaire à l’emplacement du fichier sur le support de données. P. ex. DVD_01','Percorso relativo aggiuntivo per reperire il file sul supporto. Per es. DVD_01','rrr_zzz_Zusätzlicher Relativer Pfad, wo die Datei auf dem Datenträger zu finden ist. Z.B. DVD_01.',ARRAY['kein_Plantyp_definiert']::tww_od.plantype[],'true','varchar(200)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tww_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (3754,3762,'file','remark','remark','Bemerkung','REMARQUE','osservazione','observatie','General remarks','Allgemeine Bemerkungen','Remarques générales','Osservazioni generali','rrr_Allgemeine Bemerkungen',ARRAY['kein_Plantyp_definiert']::tww_od.plantype[],'true','varchar(80)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tww_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (3754,999999,'file','OBJ_ID','OBJ_ID','OBJ_ID','OBJ_ID','OBJ_ID','OBJ_ID','OBJ_ID - Unique ID','OBJ_ID - eindeutige Kennung','OBJ_ID - ID unique','OBJ_ID - identificatore univoco','rrr_OBJ_ID - eindeutige Kennung',ARRAY['Werkinformation','Leitungskataster', 'GEP_Verband','GEP_Traegerschaft','SAA', 'PAA']::tww_od.plantype[],'true','varchar(16)','','','','','','','','','','',NULL,NULL);
 INSERT INTO tww_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (3754,999998,'file','dataowner','dataowner','Datenherr','MAITRE_DES_DONNEES','proprietario_dati','rrr_Datenherr','dataowner - this is the person or body who is allowed to delete, change or maintain this object','Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten','Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe','zzz_Metaattribut L''attributo proprietario dati si riferisce alla persona o ente che è autorizzato a eliminare, modificare o gestire i dati','rrr_Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten',ARRAY['Werkinformation','Leitungskataster', 'GEP_Verband','GEP_Traegerschaft','SAA', 'PAA']::tww_od.plantype[],'true','varchar(80)','','','','','','','','','','',NULL,NULL);
 INSERT INTO tww_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (3754,999997,'file','provider','provider','Datenlieferant','FOURNISSEUR_DES_DONNEES','fornitore_dati','rrr_Datenlieferant','Metaattribute provider - this is the person or body who delivered the data','Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat','FOURNISSEUR DES DONNEES Organisation qui crée l’enregistrement de ces données','zzz_Metaattribut L''attributo fornitore dati si riferisce alla persona o ente che ha fornito i dati','rrr_Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat',ARRAY['Werkinformation','Leitungskataster', 'GEP_Verband','GEP_Traegerschaft','SAA', 'PAA']::tww_od.plantype[],'true','varchar(80)','','','','','','','','','','',NULL,NULL);
 INSERT INTO tww_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (3754,999996,'file','last_modification','last_modification','Letzte_Aenderung','DERNIERE_MODIFICATION','ultima_modifica','rrr_Letze_Aenderung','Last modification: INTERLIS_1_DATE','Letzte Änderung: INTERLIS_1_DATE','Dernière modification: INTERLIS_1_DATE','ultima_modifica: INTERLIS_1_DATE','rrr_Letzte Änderung: INTERLIS_1_DATE',ARRAY['Werkinformation','Leitungskataster', 'GEP_Verband','GEP_Traegerschaft','SAA', 'PAA']::tww_od.plantype[],'true','TIMESTAMP','','','','','','','','','','',NULL,NULL);
 INSERT INTO tww_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (3776,3777,'data_media','identifier','identifier','Bezeichnung','DESIGNATION','denominazione','identificator','yyy_Name des Datenträgers. Bei elektronischen Datenträgern normalerweise das Volume-Label. Bei einem Server der Servername. Bei analogen Videobändern die Bandnummer.','Name des Datenträgers. Bei elektronischen Datenträgern normalerweise das Volume-Label. Bei einem Server der Servername. Bei analogen Videobändern die Bandnummer.','Nom du support de données. Pour les supports de données électroniques, normalement le label volume. Pour un serveur, le nom du serveur. Pour des bandes vidéo analogiques, les numéros de bandes.','Nome del supporto dati. Per i supporti dati elettronici, di solito l’etichetta del volume. Per un server il nome del server. Per le videocassette analogiche, il numero del nastro','NULL',ARRAY['kein_Plantyp_definiert']::tww_od.plantype[],'true','varchar(60)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tww_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (3776,3783,'data_media','kind','kind','Art','GENRE','tipo','tip','Describes the type of data media','Beschreibt die Art des Datenträgers','Décrit le genre de support de données','Descrive il tipo di supporto dati','Descrie tipul de suport de date',ARRAY['kein_Plantyp_definiert']::tww_od.plantype[],'true','integer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tww_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (3776,3791,'data_media','location','location','Standort','EMPLACEMENT','ubicazione','rrr_Standort','Location of the data medium','Ort, wo sich der Datenträger befindet','Emplacement du support de données','Ubicazione del supporto dati','rrr_Wo befindet sich der Datenträger',ARRAY['kein_Plantyp_definiert']::tww_od.plantype[],'true','varchar(50)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tww_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (3776,9224,'data_media','oid','oid','OID','OID','OID','OID','Stable unique object identification for all objects and classes','Stabile eindeutige Objektidentifikation für alle Objekte und Klassen','Identification d''objet unique stable pour tous les objets et toutes les classes','Identificazione univoca e stabile per tutti gli oggetti e le classi','Identificare unica stabila a obiectelor pentru toate obiectele ?i clasele',ARRAY['GEP_Verband','PAA','SAA']::tww_od.plantype[],'true','varchar(16)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tww_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (3776,3781,'data_media','path','path','Pfad','CHEMIN_ACCES','percorso','rrr_Pfad','Access path to the data carrier. e.g. DVD drive -> D: , server -> //server/videos, hard disk -> c:/videos . For web servers -> URI (URL). Empty for an analog video tape','Zugriffspfad zum Datenträger. z.B. DVD-Laufwerk -> D: , Server -> //server/videos, Harddisk -> c:/videos . Bei Webserver eine URI (URL). Bei einem analogen Videoband leer','Chemin d’accès au support de données, p. ex. lecteur DVD -> D: , - serveur -> //server/videos , disque dur -> c:/videos , serveur_web -> URI(URL). Pour une bande vidéo analogique: vide','Percorso d’accesso al supporto dati, per es. Drive DVD –> D: , server –> \\server\video, disco fisso –> c:\video. Server_web -> URI (URL). Vuoto per una videocassetta analogica','Calea de acces la suportul de date. de exemplu, unitatea DVD -> D: , server -> //server/videos, hard disc -> c:/videos . Pentru serverele web, un URI (URL). Gol pentru o banda video analogica',ARRAY['kein_Plantyp_definiert']::tww_od.plantype[],'true','varchar(1023)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tww_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (3776,3778,'data_media','remark','remark','Bemerkung','REMARQUE','osservazione','observatie','General remarks','Bemerkungen zum Datenträger','Remarques concernant le support de données','Osservazioni sul supporto dati','NULL',ARRAY['kein_Plantyp_definiert']::tww_od.plantype[],'true','varchar(80)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tww_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (3776,999999,'data_media','OBJ_ID','OBJ_ID','OBJ_ID','OBJ_ID','OBJ_ID','OBJ_ID','OBJ_ID - Unique ID','OBJ_ID - eindeutige Kennung','OBJ_ID - ID unique','OBJ_ID - identificatore univoco','rrr_OBJ_ID - eindeutige Kennung',ARRAY['Werkinformation','Leitungskataster', 'GEP_Verband','GEP_Traegerschaft','SAA', 'PAA']::tww_od.plantype[],'true','varchar(16)','','','','','','','','','','',NULL,NULL);
 INSERT INTO tww_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (3776,999998,'data_media','dataowner','dataowner','Datenherr','MAITRE_DES_DONNEES','proprietario_dati','rrr_Datenherr','dataowner - this is the person or body who is allowed to delete, change or maintain this object','Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten','Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe','zzz_Metaattribut L''attributo proprietario dati si riferisce alla persona o ente che è autorizzato a eliminare, modificare o gestire i dati','rrr_Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten',ARRAY['Werkinformation','Leitungskataster', 'GEP_Verband','GEP_Traegerschaft','SAA', 'PAA']::tww_od.plantype[],'true','varchar(80)','','','','','','','','','','',NULL,NULL);
 INSERT INTO tww_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (3776,999997,'data_media','provider','provider','Datenlieferant','FOURNISSEUR_DES_DONNEES','fornitore_dati','rrr_Datenlieferant','Metaattribute provider - this is the person or body who delivered the data','Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat','FOURNISSEUR DES DONNEES Organisation qui crée l’enregistrement de ces données','zzz_Metaattribut L''attributo fornitore dati si riferisce alla persona o ente che ha fornito i dati','rrr_Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat',ARRAY['Werkinformation','Leitungskataster', 'GEP_Verband','GEP_Traegerschaft','SAA', 'PAA']::tww_od.plantype[],'true','varchar(80)','','','','','','','','','','',NULL,NULL);
 INSERT INTO tww_sys.dictionary_od_field (class_id, attribute_id, table_name, field_name, field_name_en, field_name_de, field_name_fr, field_name_it, field_name_ro, field_description_en, field_description_de, field_description_fr, field_description_it, field_description_ro, field_mandatory, field_visible, field_datatype, field_unit_en, field_unit_description_en, field_unit_de, field_unit_description_de, field_unit_fr, field_unit_description_fr, field_unit_it, field_unit_description_it, field_unit_ro, field_unit_description_ro, field_max, field_min) VALUES (3776,999996,'data_media','last_modification','last_modification','Letzte_Aenderung','DERNIERE_MODIFICATION','ultima_modifica','rrr_Letze_Aenderung','Last modification: INTERLIS_1_DATE','Letzte Änderung: INTERLIS_1_DATE','Dernière modification: INTERLIS_1_DATE','ultima_modifica: INTERLIS_1_DATE','rrr_Letzte Änderung: INTERLIS_1_DATE',ARRAY['Werkinformation','Leitungskataster', 'GEP_Verband','GEP_Traegerschaft','SAA', 'PAA']::tww_od.plantype[],'true','TIMESTAMP','','','','','','','','','','',NULL,NULL);


 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (3754,3764,3819,'file','classname','structure','structure',NULL,'Bauwerk',NULL,'Ouvrage',NULL,'zzz_Bauwerk',NULL,'zzz_Bauwerk',NULL,NULL,NULL,NULL,NULL,NULL);
/* TODO : Add full dictionnary of tdh classnames
 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (3754,3764,3885,'file','classname','accident','accident',NULL,'Unfall',NULL,'ACCIDENT',NULL,'zzz_Unfall',NULL,'rrr_Unfall',NULL,NULL,NULL,NULL,NULL,NULL); */



 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (3754,3769,9146,'file','kind','digital_video','digital_video',NULL,'digitales_Video',NULL,'video_numerique',NULL,'video_digitale',NULL,'rrr_digitales_Video',NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (3754,3769,3770,'file','kind','other','other',NULL,'andere',NULL,'autre',NULL,'altro',NULL,'rrr_altul',NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (3754,3769,3773,'file','kind','panoramo_film','panoramo_film',NULL,'Panoramofilm',NULL,'film_panoramique',NULL,'film_panoramico',NULL,'rrr_Panoramofilm',NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (3754,3769,3772,'file','kind','photo','photo',NULL,'Foto',NULL,'photo',NULL,'foto',NULL,'foto',NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (3754,3769,9147,'file','kind','scan','scan',NULL,'Scan',NULL,'scan',NULL,'scan',NULL,'scanare',NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (3754,3769,8812,'file','kind','sketch','sketch',NULL,'Skizze',NULL,'croquis',NULL,'schizzo',NULL,'schita',NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (3754,3769,3774,'file','kind','textfile','textfile',NULL,'Textdatei',NULL,'fichier_texte',NULL,'file_di_testo',NULL,'rrr_Textdatei',NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (3754,3769,3775,'file','kind','video','video',NULL,'Video',NULL,'video',NULL,'video',NULL,'rrr_video',NULL,NULL,NULL,NULL,NULL,NULL);



 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (3776,3783,3785,'data_media','kind','CD','CD',NULL,'CD',NULL,'CD',NULL,'CD',NULL,'CD',NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (3776,3783,3787,'data_media','kind','dvd','dvd',NULL,'DVD',NULL,'DVD',NULL,'DVD',NULL,'DVD',NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (3776,3783,3786,'data_media','kind','floppy_disc','floppy_disc',NULL,'Diskette',NULL,'disquette',NULL,'dischetto',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (3776,3783,3788,'data_media','kind','harddisc','harddisc',NULL,'Festplatte',NULL,'disque_dur',NULL,'disco_fisso',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (3776,3783,3784,'data_media','kind','other','other',NULL,'andere',NULL,'autre',NULL,'altro',NULL,'rrr_altul',NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (3776,3783,3789,'data_media','kind','server','server',NULL,'Server',NULL,'serveur',NULL,'server',NULL,'server',NULL,'Local server (as opposed to Webserver)','Lokaler Server (im Gegensatz zu Webserver)','Serveur local (par opposition à serveur web)','Server locale (rispetto all server web)','Server local (spre deosebire de server web)');
 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (3776,3783,3790,'data_media','kind','videotape','videotape',NULL,'Videoband',NULL,'bande_video',NULL,'nastro_video',NULL,'rrr_Videoband',NULL,NULL,NULL,NULL,NULL,NULL);
 INSERT INTO tdh_sys.dictionary_od_values (class_id, attribute_id, value_id, table_name, field_name, value_name, value_name_en, shortcut_en, value_name_de, shortcut_de, value_name_fr, shortcut_fr, value_name_it, shortcut_it, value_name_ro, shortcut_ro, value_description_en, value_description_de, value_description_fr, value_description_it, value_description_ro) VALUES (3776,3783,9318,'data_media','kind','webserver','webserver',NULL,'Webserver',NULL,'serveur_web',NULL,'server_web',NULL,'server_web',NULL,'Web server with URI (https://de.wikipedia.org/wiki/Uniform_Resource_Identifier)','Webserver mit URI (https://de.wikipedia.org/wiki/Uniform_Resource_Identifier)','Serveur web avec URI (https://de.wikipedia.org/wiki/Uniform_Resource_Identifier)','Server web con URI (https://de.wikipedia.org/wiki/Uniform_Resource_Identifier)','Server web cu URI (https://de.wikipedia.org/wiki/Uniform_Resource_Identifier)');
