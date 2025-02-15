CREATE DATABASE red_social;

CREATE TABLE bitacora (
  id int IDENTITY NOT NULL,
  texto varchar(500) NOT NULL,
  CONSTRAINT pk_bitacora PRIMARY KEY (id)
);

CREATE TABLE comentarios (
  id int IDENTITY NOT NULL,
  texto varchar(300) NOT NULL,
  id_usuario int NOT NULL,
  fecha datetime NOT NULL,
  CONSTRAINT pk_comentarios PRIMARY KEY (id)
);

CREATE TABLE invitaciones (
  id int IDENTITY NOT NULL,
  fecha datetime NULL,
  usuario_1 int NOT NULL,
  usuario_2 int NOT NULL,
  estado char(1) NULL DEFAULT ('P'),
  CONSTRAINT pk_invitaciones PRIMARY KEY (id)
);

CREATE TABLE relaciones (
  id int IDENTITY NOT NULL,
  usuario_1 int NOT NULL,
  usuario_2 int NOT NULL,
  CONSTRAINT pk_relaciones PRIMARY KEY (id)
);

CREATE TABLE sentimientos (
  id int IDENTITY NOT NULL,
  sentimiento bit NOT NULL,
  id_usuario int NOT NULL,
  id_comentario int NOT NULL,
  CONSTRAINT pk_sentimientos PRIMARY KEY (id)
);

CREATE TABLE usuario (
  id int IDENTITY NOT NULL,
  nombre varchar(50) NOT NULL,
  email varchar(50) NOT NULL,
  numero_relaciones int NOT NULL DEFAULT (0),
  CONSTRAINT pk_usuario PRIMARY KEY (id)
);

/**********************************************************************************/

ALTER TABLE invitaciones ADD CONSTRAINT uk_invitaciones UNIQUE
(
usuario_1 ,
usuario_2 
);


ALTER TABLE relaciones ADD CONSTRAINT uk_relaciones UNIQUE
(
usuario_1 ,
usuario_2 
);

ALTER TABLE comentarios ADD CONSTRAINT fk_comentarios_usuario FOREIGN KEY (id_usuario)
REFERENCES usuario (id);

ALTER TABLE invitaciones ADD CONSTRAINT fk_invitaciones_usuario_1 FOREIGN KEY (usuario_1)
REFERENCES usuario (id);

ALTER TABLE invitaciones ADD CONSTRAINT fk_invitaciones_usuario_2 FOREIGN KEY (usuario_2)
REFERENCES usuario (id);

ALTER TABLE relaciones ADD CONSTRAINT fk_relaciones_usuario_1 FOREIGN KEY (usuario_1)
REFERENCES usuario (id);

ALTER TABLE relaciones ADD CONSTRAINT fk_relaciones_usuario_2 FOREIGN KEY (usuario_2)
REFERENCES usuario (id);

ALTER TABLE sentimientos ADD CONSTRAINT fk_sentimientos_comentarios FOREIGN KEY (id_comentario)
REFERENCES comentarios (id);

ALTER TABLE sentimientos ADD CONSTRAINT fk_sentimientos_usuario FOREIGN KEY (id_usuario)
REFERENCES usuario (id);

ALTER TABLE invitaciones ADD CONSTRAINT ck_invitaciones CHECK ((estado = 'R' OR estado = 'A' OR estado = 'P'));


/**********************************************************************************/

SET IDENTITY_INSERT usuario ON;

INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (1, 'Kennedy Cruz', 'dis.parturient@Utnecurna.ca', 4);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (2, 'Harper Bell', 'tellus.sem@maurissagittis.ca', 4);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (3, 'Ulysses Abbott', 'nascetur@suscipitnonummyFusce.edu', 2);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (4, 'Rajah Oliver', 'aliquam.arcu@ac.org', 2);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (5, 'Caleb Hernandez', 'Sed.dictum.Proin@malesuadavelvenenatis.org', 1);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (6, 'Wallace Schultz', 'felis@vellectus.edu', 6);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (7, 'Clayton Guerra', 'adipiscing.ligula.Aenean@variuset.co.uk', 2);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (8, 'Maxwell Wilson', 'sit.amet.risus@turpisAliquamadipiscing.co.uk', 2);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (9, 'Jeremy Burton', 'eu@hendrerit.com', 2);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (10, 'Cairo Cortez', 'non@auctorMaurisvel.co.uk', 1);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (11, 'Tobias Bruce', 'orci@molestietortornibh.edu', 4);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (12, 'Amal Mcclure', 'a.feugiat@malesuadaaugue.edu', 3);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (13, 'Levi Carson', 'non.enim@Pellentesque.org', 3);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (14, 'Grant Mcfadden', 'sem.eget.massa@at.org', 1);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (15, 'Allen Dickson', 'odio.auctor.vitae@orci.org', 4);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (16, 'Troy Fleming', 'Cras.convallis@dui.edu', 2);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (17, 'Lee Chambers', 'ullamcorper@tellusloremeu.edu', 4);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (18, 'Clinton Frost', 'mauris@estmollisnon.ca', 1);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (19, 'Francis Jimenez', 'luctus.vulputate.nisi@adipiscing.edu', 3);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (20, 'Carlos Richmond', 'Sed@lectussit.net', 2);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (21, 'Louis Woodard', 'sagittis@Vivamus.net', 2);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (22, 'David Taylor', 'placerat@Suspendisse.ca', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (23, 'Kareem Terry', 'aliquet.odio.Etiam@sed.com', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (24, 'Travis Dillon', 'lobortis.quis.pede@Inlorem.edu', 1);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (25, 'Howard Snow', 'dis.parturient.montes@massa.org', 1);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (26, 'Austin Taylor', 'dolor.sit.amet@tellus.ca', 2);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (27, 'Dieter Mcdowell', 'semper.dui@maurisidsapien.edu', 2);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (28, 'Michael Nolan', 'sit@antelectusconvallis.com', 1);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (29, 'Griffith Patrick', 'Nullam.vitae.diam@elit.co.uk', 2);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (30, 'Sawyer Donaldson', 'ut@ataugue.net', 1);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (31, 'Ir Oconnor', 'magna.tellus.faucibus@posuere.net', 1);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (32, 'Malcolm Guy', 'adipiscing.lacus@Sedegetlacus.org', 3);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (33, 'Christian Quinn', 'libero.Donec@atiaculis.org', 2);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (34, 'Kato Key', 'est.mauris@nibhDonec.co.uk', 2);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (35, 'Reed Ratliff', 'a@sedest.com', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (36, 'Quinn Mccullough', 'orci.tincidunt.adipiscing@dolorelit.net', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (37, 'Dennis lden', 'Duis.dignissim.tempor@lectusjustoeu.ca', 1);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (38, 'Isaac Conway', 'iaculis.quis@in.net', 3);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (39, 'Cairo Ball', 'dolor@volutpat.net', 1);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (40, 'Mark Johnson', 'mus@nec.net', 3);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (41, 'Leroy Adkins', 'ipsum.Curabitur.consequat@cubiliaCurae.edu', 1);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (42, 'Caleb Humphrey', 'Maecenas.malesuada@quistristiqueac.net', 2);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (43, 'Eaton Hardin', 'Quisque@eumetusIn.ca', 2);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (44, 'Cole Norton', 'mattis.ornare.lectus@bibendum.net', 3);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (45, 'Abraham Peters', 'ante.ipsum@pede.com', 1);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (46, 'Walter Dalton', 'senectus.et.netus@purusmaurisa.com', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (47, 'Evan Clements', 'interdum.feugiat.Sed@placerat.ca', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (48, 'Derek Anderson', 'ornare@quis.ca', 5);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (49, 'Howard Thornton', 'Nullam@Nunc.co.uk', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (50, 'Eaton Daniel', 'consectetuer@eueratsemper.ca', 2);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (51, 'Omar Ochoa', 'inceptos.hymenaeos@liberoProin.org', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (52, 'Nero Booker', 'nisi.nibh.lacinia@anteVivamusnon.edu', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (53, 'Uriel Carney', 'est@leoVivamusnibh.co.uk', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (54, 'Felix Koch', 'convallis.dolor@mattis.co.uk', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (55, 'Wallace Buckner', 'eu.dui.Cum@Quisqueornare.org', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (56, 'Gage Booker', 'Maecenas@fringillaeuismodenim.ca', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (57, 'Oleg Best', 'interdum@Maecenasornare.edu', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (58, 'Wang Briggs', 'sociis.natoque@laoreetlibero.edu', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (59, 'Roth Olson', 'ultricies.ornare.elit@Loremipsum.org', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (60, 'Ezekiel Pollard', 'mi.tempor@commodohendreritDonec.ca', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (61, 'Gray Mcdowell', 'Curabitur.consequat.lectus@euismod.com', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (62, 'Ralph Spears', 'nisl.arcu.iaculis@CuraeDonectincidunt.ca', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (63, 'Ross Harris', 'eget@luctusvulputate.ca', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (64, 'Baker Hensley', 'ligula@urnaNuncquis.com', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (65, 'Ulric Jennings', 'et.risus@quisdiamPellentesque.com', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (66, 'Vladimir Chase', 'nascetur.ridiculus.mus@tellusfaucibusleo.org', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (67, 'Vaughan Luna', 'sed@acmetus.com', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (68, 'Hunter Morales', 'egestas.rhoncus@ornarelectusjusto.edu', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (69, 'Nero Tucker', 'sed.hendrerit@Pellentesque.edu', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (70, 'Xander Montoya', 'In@sit.edu', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (71, 'Gage Carpenter', 'dictum.magna@vitaesodales.ca', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (72, 'Charles Christensen', 'Curabitur@idmollis.ca', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (73, 'Dolan Rutledge', 'Ut.tincidunt.orci@velit.co.uk', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (74, 'Carter Juarez', 'luctus.ut.pellentesque@Phasellusataugue.co.uk', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (75, 'Austin Wiley', 'interdum.Curabitur.dictum@egetvolutpat.edu', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (76, 'Asher Reed', 'cursus@nonummyut.org', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (77, 'Eaton Cervantes', 'Nulla.eget@eu.ca', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (78, 'Francis Carey', 'quis.arcu.vel@necanteMaecenas.co.uk', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (79, 'Slade Beck', 'Fusce@sociis.co.uk', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (80, 'Cameron Barr', 'euismod@eget.org', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (81, 'Jason Hartman', 'massa@vehicula.co.uk', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (82, 'Garrett Palmer', 'ultricies.ligula.Nullam@dui.edu', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (83, 'Kareem Malone', 'consequat.lectus@cursusdiam.net', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (84, 'Ali Harrington', 'Curabitur@ametultriciessem.org', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (85, 'Lyle Russell', 'nec@Donecegestas.com', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (86, 'Dean Galles', 'nulla.In@pharetrased.net', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (87, 'Kamal Russell', 'amet.luctus.vulputate@magnaa.co.uk', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (88, 'Denton Sweeney', 'ornare.lectus@sem.co.uk', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (89, 'Ciaran Cantrell', 'sed.sem@QuisquevariusNam.ca', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (90, 'Hu George', 'orci.lobortis@sit.co.uk', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (91, 'Colton Fulton', 'massa.Integer.vitae@enimEtiamimperdiet.com', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (92, 'Joshua Pearson', 'vel.nisl@atsemmolestie.net', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (93, 'Rogan Madden', 'fringilla.euismod.enim@rhoncus.net', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (94, 'Simon Lancaster', 'eleifend.non.dapibus@fringillaDonecfeugiat.edu', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (95, 'Talon Mcmahon', 'arcu.eu@libero.org', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (96, 'Merritt Browning', 'lorem@nuncestmollis.com', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (97, 'Bruce Carpenter', 'non.dapibus.rutrum@loremvitae.org', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (98, 'Len Dean', 'Nunc.ut.erat@convallisestvitae.net', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (99, 'Kennan Blair', 'in@nuncest.com', 0);
INSERT INTO usuario (id, nombre, email, numero_relaciones)
  VALUES (100, 'Akeem Sheppard', 'sapien@tortor.net', 0);

SET IDENTITY_INSERT usuario OFF;


SET IDENTITY_INSERT relaciones ON;

INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (122, 1, 34);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (59, 1, 35);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (120, 1, 42);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (97, 1, 49);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (102, 2, 10);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (94, 2, 25);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (73, 2, 26);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (71, 2, 30);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (135, 3, 25);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (68, 3, 50);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (77, 4, 35);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (123, 4, 42);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (117, 5, 33);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (127, 6, 3);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (101, 6, 19);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (52, 6, 22);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (78, 6, 25);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (128, 6, 36);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (130, 6, 47);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (90, 7, 28);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (67, 7, 30);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (62, 8, 27);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (139, 8, 49);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (145, 9, 7);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (48, 9, 30);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (99, 10, 12);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (141, 11, 8);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (124, 11, 17);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (69, 11, 39);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (121, 11, 47);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (136, 12, 10);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (129, 12, 33);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (61, 12, 48);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (95, 13, 12);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (88, 13, 30);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (98, 13, 37);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (89, 14, 36);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (126, 15, 4);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (86, 15, 24);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (84, 15, 29);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (60, 15, 37);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (106, 16, 31);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (113, 16, 49);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (144, 17, 5);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (115, 17, 7);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (118, 17, 22);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (131, 17, 28);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (63, 18, 4);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (138, 19, 15);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (65, 19, 28);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (72, 19, 31);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (103, 20, 17);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (50, 20, 39);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (80, 21, 3);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (107, 21, 31);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (91, 24, 2);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (56, 25, 19);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (85, 26, 15);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (79, 26, 31);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (76, 27, 10);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (87, 27, 32);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (133, 28, 27);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (81, 29, 33);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (140, 29, 50);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (112, 30, 44);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (70, 31, 28);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (100, 32, 4);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (58, 32, 11);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (116, 32, 46);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (110, 33, 26);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (125, 33, 43);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (96, 34, 32);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (111, 34, 39);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (74, 37, 34);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (119, 38, 4);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (108, 38, 19);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (142, 38, 22);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (83, 39, 24);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (53, 40, 6);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (109, 40, 11);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (57, 40, 49);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (104, 41, 49);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (146, 42, 25);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (134, 42, 38);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (114, 43, 17);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (137, 43, 33);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (132, 44, 7);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (93, 44, 12);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (75, 44, 13);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (92, 45, 34);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (64, 48, 4);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (105, 48, 11);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (82, 48, 16);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (51, 48, 29);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (54, 48, 35);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (55, 50, 40);
INSERT INTO relaciones (id, usuario_1, usuario_2)
  VALUES (66, 50, 42);

SET IDENTITY_INSERT relaciones OFF;

SET IDENTITY_INSERT comentarios ON;

INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (4, 'dis parturient montes, nascetur', 18, CAST(N'2009-05-31 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (5, 'cursus et, magna. Praesent interdum ligula eu enim. Etiam', 38, CAST(N'2014-09-11 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (6, 'non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed', 19, CAST(N'2013-11-11 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (7, 'In faucibus. Morbi', 24, CAST(N'2008-11-01 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (8, 'Vivamus non lorem vitae odio sagittis semper. Nam tempor diam', 100, CAST(N'2009-01-02 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (9, 'eros.', 82, CAST(N'2008-04-17 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (10, 'erat vitae risus. Duis a mi', 68, CAST(N'2017-06-20 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (11, 'Nulla facilisis. Suspendisse', 83, CAST(N'2016-09-02 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (12, 'Nam nulla', 96, CAST(N'2014-10-16 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (13, 'enim mi tempor lorem, eget mollis lectus pede et risus.', 50, CAST(N'2012-11-26 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (14, 'a sollicitudin orci sem eget massa. Suspendisse eleifend.', 72, CAST(N'2017-03-13 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (15, 'mattis velit', 4, CAST(N'2017-08-18 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (16, 'elit fermentum risus, at fringilla purus mauris a nunc. In', 50, CAST(N'2012-06-09 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (17, 'vulputate velit eu sem. Pellentesque ut ipsum', 54, CAST(N'2016-09-23 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (18, 'Nam tempor diam dictum', 81, CAST(N'2017-12-24 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (19, 'conubia nostra,', 10, CAST(N'2009-01-28 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (20, 'ac mattis velit justo nec ante. Maecenas', 34, CAST(N'2009-10-10 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (21, 'ullamcorper. Duis cursus, diam at pretium aliquet, metus urna', 36, CAST(N'2010-04-02 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (22, 'tincidunt tempus risus.', 66, CAST(N'2010-09-25 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (23, 'auctor ullamcorper, nisl arcu iaculis enim, sit', 38, CAST(N'2014-10-17 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (24, 'dui. Cras pellentesque. Sed dictum.', 76, CAST(N'2014-02-25 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (25, 'elit.', 8, CAST(N'2018-04-19 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (26, 'eu odio tristique pharetra. Quisque ac libero nec', 82, CAST(N'2013-07-31 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (27, 'eu lacus. Quisque', 58, CAST(N'2015-07-07 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (28, 'sit amet, consectetuer adipiscing elit. Aliquam auctor,', 85, CAST(N'2009-11-05 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (29, 'ac turpis egestas. Fusce aliquet magna a', 77, CAST(N'2017-11-18 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (30, 'tempus scelerisque, lorem ipsum sodales purus, in', 44, CAST(N'2017-01-18 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (31, 'ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus.', 72, CAST(N'2013-02-13 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (32, 'est, vitae sodales nisi', 61, CAST(N'2010-08-22 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (33, 'sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget', 15, CAST(N'2015-03-11 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (34, 'fames', 52, CAST(N'2015-07-23 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (35, 'laoreet ipsum. Curabitur consequat, lectus sit', 20, CAST(N'2018-04-21 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (36, 'sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra', 92, CAST(N'2015-11-27 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (37, 'ullamcorper viverra. Maecenas', 7, CAST(N'2010-02-28 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (38, 'Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu', 55, CAST(N'2010-01-14 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (39, 'sed turpis nec', 34, CAST(N'2010-03-08 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (40, 'vulputate velit', 72, CAST(N'2011-03-31 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (41, 'erat. Etiam', 7, CAST(N'2010-12-31 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (42, 'libero mauris, aliquam eu,', 49, CAST(N'2013-02-10 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (43, 'Mauris nulla. Integer urna. Vivamus molestie dapibus ligula.', 92, CAST(N'2016-06-09 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (44, 'lacus. Quisque', 97, CAST(N'2010-03-04 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (45, 'ullamcorper. Duis cursus, diam at pretium', 18, CAST(N'2013-11-07 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (46, 'Ut tincidunt orci quis lectus. Nullam suscipit, est ac', 97, CAST(N'2011-01-22 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (47, 'Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 74, CAST(N'2013-02-13 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (48, 'eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer', 98, CAST(N'2015-06-18 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (49, 'augue', 83, CAST(N'2009-05-08 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (50, 'Donec porttitor tellus', 80, CAST(N'2010-06-28 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (51, 'tellus. Nunc lectus pede, ultrices a, auctor non,', 71, CAST(N'2015-06-01 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (52, 'lectus, a sollicitudin', 3, CAST(N'2010-10-31 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (53, 'non arcu. Vivamus sit amet risus. Donec egestas.', 7, CAST(N'2016-01-27 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (54, 'turpis non enim.', 20, CAST(N'2010-08-08 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (55, 'dui. Cum sociis natoque', 5, CAST(N'2012-04-05 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (56, 'condimentum eget, volutpat ornare, facilisis', 100, CAST(N'2018-03-31 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (57, 'malesuada. Integer id magna et', 60, CAST(N'2009-03-22 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (58, 'magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim', 15, CAST(N'2016-11-27 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (59, 'eleifend', 30, CAST(N'2013-05-26 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (60, 'eu dui. Cum', 46, CAST(N'2017-03-24 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (61, 'Mauris eu turpis. Nulla aliquet. Proin velit. Sed', 7, CAST(N'2009-03-30 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (62, 'Phasellus fermentum convallis ligula. Donec luctus', 92, CAST(N'2010-09-12 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (63, 'elit elit fermentum risus, at', 96, CAST(N'2012-02-26 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (64, 'est, mollis non, cursus non, egestas a, dui.', 31, CAST(N'2011-04-25 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (65, 'ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis', 88, CAST(N'2011-04-22 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (66, 'Sed', 42, CAST(N'2008-06-06 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (67, 'sit amet diam eu dolor egestas rhoncus. Proin nisl', 95, CAST(N'2012-03-26 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (68, 'orci. Ut sagittis lobortis', 82, CAST(N'2017-05-28 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (69, 'senectus', 66, CAST(N'2013-03-21 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (70, 'a, malesuada id, erat. Etiam vestibulum', 97, CAST(N'2013-11-24 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (71, 'Donec nibh enim, gravida sit amet, dapibus', 53, CAST(N'2009-11-15 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (72, 'lorem vitae odio sagittis semper. Nam tempor diam dictum sapien.', 54, CAST(N'2014-12-14 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (73, 'non enim commodo hendrerit. Donec porttitor tellus', 7, CAST(N'2008-09-15 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (74, 'lacinia mattis. Integer eu lacus. Quisque imperdiet,', 54, CAST(N'2016-10-07 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (75, 'ac nulla. In tincidunt congue turpis. In condimentum. Donec', 93, CAST(N'2008-04-21 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (76, 'eu augue porttitor interdum. Sed auctor odio a purus.', 100, CAST(N'2013-06-05 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (77, 'malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam', 51, CAST(N'2015-05-31 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (78, 'metus urna convallis', 67, CAST(N'2012-06-09 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (79, 'lobortis risus. In mi', 36, CAST(N'2015-07-13 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (80, 'rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque', 28, CAST(N'2013-09-07 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (81, 'hendrerit neque. In ornare sagittis felis. Donec tempor, est', 82, CAST(N'2017-04-29 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (82, 'erat eget', 51, CAST(N'2018-02-04 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (83, 'dictum magna. Ut tincidunt orci quis lectus. Nullam', 82, CAST(N'2016-04-24 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (84, 'velit dui, semper et, lacinia', 47, CAST(N'2015-09-04 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (85, 'cursus non,', 70, CAST(N'2009-11-24 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (86, 'nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo', 23, CAST(N'2017-11-05 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (87, 'lobortis tellus justo sit amet nulla. Donec non justo. Proin', 4, CAST(N'2017-11-24 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (88, 'primis in faucibus', 88, CAST(N'2011-05-02 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (89, 'dictum ultricies ligula. Nullam enim.', 47, CAST(N'2010-06-02 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (90, 'magna tellus faucibus leo, in lobortis tellus', 19, CAST(N'2012-09-26 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (91, 'ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt', 55, CAST(N'2014-07-18 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (92, 'Cras dictum ultricies ligula. Nullam enim. Sed nulla ante,', 83, CAST(N'2008-08-25 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (93, 'cursus, diam at pretium aliquet, metus', 90, CAST(N'2009-03-23 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (94, 'mattis. Cras eget nisi dictum augue malesuada malesuada. Integer', 25, CAST(N'2015-02-23 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (95, 'mi fringilla mi lacinia mattis.', 14, CAST(N'2014-11-04 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (96, 'Fusce diam nunc, ullamcorper eu,', 32, CAST(N'2008-09-30 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (97, 'lobortis risus.', 8, CAST(N'2008-10-18 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (98, 'arcu imperdiet ullamcorper. Duis', 87, CAST(N'2009-04-03 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (99, 'nonummy ultricies ornare, elit elit', 26, CAST(N'2009-07-24 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (100, 'Cras eget nisi dictum', 57, CAST(N'2011-05-06 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (101, 'egestas', 31, CAST(N'2010-06-05 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (102, 'et risus. Quisque libero lacus, varius et, euismod et, commodo', 33, CAST(N'2016-07-14 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (103, 'non, luctus sit amet, faucibus ut,', 6, CAST(N'2011-10-09 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (104, 'cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices', 61, CAST(N'2014-11-16 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (105, 'commodo at, libero.', 48, CAST(N'2013-11-07 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (106, 'enim. Etiam gravida molestie arcu.', 96, CAST(N'2012-04-20 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (107, 'massa rutrum magna. Cras', 32, CAST(N'2009-08-31 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (108, 'luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc', 51, CAST(N'2013-11-18 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (109, 'per conubia nostra,', 46, CAST(N'2016-06-26 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (110, 'ac tellus.', 84, CAST(N'2012-10-09 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (111, 'tincidunt', 98, CAST(N'2015-10-16 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (112, 'id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque', 16, CAST(N'2014-09-04 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (113, 'ultrices', 16, CAST(N'2013-04-01 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (114, 'orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus', 67, CAST(N'2016-09-19 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (115, 'Nunc pulvinar arcu et pede. Nunc sed orci', 99, CAST(N'2012-03-25 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (116, 'velit justo nec ante. Maecenas mi felis,', 30, CAST(N'2016-10-28 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (117, 'risus. Donec egestas. Duis ac arcu. Nunc mauris.', 18, CAST(N'2015-11-20 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (118, 'purus.', 46, CAST(N'2008-07-13 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (119, 'magna. Lorem ipsum', 9, CAST(N'2015-07-30 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (120, 'in faucibus orci luctus et ultrices posuere', 62, CAST(N'2009-02-19 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (121, 'convallis ligula. Donec luctus aliquet odio. Etiam', 74, CAST(N'2017-01-29 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (122, 'nulla. Integer vulputate, risus a ultricies adipiscing,', 63, CAST(N'2017-11-04 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (123, 'mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet,', 3, CAST(N'2009-06-02 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (124, 'hendrerit consectetuer, cursus et, magna. Praesent', 73, CAST(N'2013-02-16 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (125, 'metus. Aenean sed pede nec ante blandit viverra. Donec', 46, CAST(N'2018-03-17 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (126, 'euismod', 65, CAST(N'2008-11-02 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (127, 'amet, consectetuer adipiscing elit. Etiam', 42, CAST(N'2017-12-26 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (128, 'aliquam eu, accumsan', 86, CAST(N'2011-06-24 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (129, 'Nullam', 41, CAST(N'2010-06-14 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (130, 'varius. Nam', 81, CAST(N'2016-03-19 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (131, 'nisi. Aenean eget metus. In nec', 79, CAST(N'2014-05-28 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (132, 'tellus lorem eu metus. In lorem. Donec elementum, lorem', 95, CAST(N'2013-11-04 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (133, 'Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed', 24, CAST(N'2009-03-02 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (134, 'elit. Etiam', 94, CAST(N'2013-02-18 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (135, 'sociis', 59, CAST(N'2010-10-03 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (136, 'dui, nec', 15, CAST(N'2017-07-02 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (137, 'Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque', 34, CAST(N'2012-09-17 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (138, 'leo, in lobortis tellus justo sit amet nulla. Donec non', 31, CAST(N'2017-10-06 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (139, 'vestibulum lorem, sit', 31, CAST(N'2018-03-03 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (140, 'tellus.', 28, CAST(N'2009-03-30 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (141, 'rhoncus id, mollis nec,', 48, CAST(N'2010-12-19 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (142, 'In', 74, CAST(N'2014-03-29 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (143, 'Duis risus odio, auctor', 71, CAST(N'2014-12-23 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (144, 'lorem. Donec elementum, lorem ut aliquam', 61, CAST(N'2013-10-04 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (145, 'erat nonummy ultricies', 65, CAST(N'2009-08-28 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (146, 'nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras', 95, CAST(N'2016-04-27 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (147, 'in lobortis tellus justo sit amet nulla. Donec non', 66, CAST(N'2009-02-16 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (148, 'nibh.', 99, CAST(N'2013-12-01 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (149, 'risus, at fringilla purus', 21, CAST(N'2015-08-10 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (150, 'pretium et, rutrum non, hendrerit id,', 61, CAST(N'2016-11-21 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (151, 'tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris.', 59, CAST(N'2010-06-16 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (152, 'libero. Proin mi. Aliquam', 85, CAST(N'2008-06-21 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (153, 'pede et risus. Quisque libero lacus, varius et, euismod et,', 62, CAST(N'2011-05-26 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (154, 'tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id,', 34, CAST(N'2014-11-15 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (155, 'nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum', 45, CAST(N'2017-06-06 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (156, 'natoque penatibus et magnis dis', 72, CAST(N'2013-04-11 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (157, 'per inceptos', 15, CAST(N'2018-03-02 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (158, 'Vestibulum ante ipsum primis', 79, CAST(N'2017-11-18 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (159, 'commodo at, libero. Morbi accumsan laoreet ipsum.', 74, CAST(N'2016-12-19 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (160, 'Nulla interdum. Curabitur', 68, CAST(N'2016-11-29 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (161, 'Proin mi. Aliquam gravida mauris ut mi.', 35, CAST(N'2016-03-23 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (162, 'adipiscing non, luctus sit amet, faucibus ut, nulla. Cras', 11, CAST(N'2011-06-28 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (163, 'erat eget ipsum. Suspendisse sagittis.', 70, CAST(N'2008-12-26 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (164, 'magna, malesuada vel, convallis in, cursus et,', 76, CAST(N'2014-03-02 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (165, 'elit, dictum', 91, CAST(N'2014-10-04 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (166, 'fringilla ornare', 81, CAST(N'2009-11-27 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (167, 'arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida', 57, CAST(N'2017-03-27 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (168, 'lacinia mattis.', 43, CAST(N'2010-01-09 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (169, 'penatibus et', 17, CAST(N'2015-02-02 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (170, 'aliquam adipiscing lacus. Ut nec', 72, CAST(N'2017-01-06 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (171, 'dignissim pharetra.', 38, CAST(N'2014-04-30 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (172, 'vulputate ullamcorper magna. Sed eu eros. Nam', 19, CAST(N'2008-05-01 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (173, 'Aliquam nec enim. Nunc', 12, CAST(N'2014-07-16 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (174, 'Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu', 71, CAST(N'2009-01-01 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (175, 'Fusce mi lorem, vehicula et, rutrum eu,', 70, CAST(N'2011-02-13 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (176, 'dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare,', 60, CAST(N'2015-05-14 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (177, 'Pellentesque habitant morbi', 12, CAST(N'2010-09-03 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (178, 'Nulla eu neque', 67, CAST(N'2011-03-08 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (179, 'ipsum cursus', 94, CAST(N'2013-03-12 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (180, 'cursus non,', 57, CAST(N'2011-10-24 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (181, 'adipiscing', 87, CAST(N'2009-08-19 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (182, 'sociis natoque penatibus et magnis', 58, CAST(N'2012-01-24 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (183, 'libero. Integer in magna. Phasellus dolor elit,', 4, CAST(N'2014-08-01 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (184, 'leo elementum sem, vitae aliquam eros', 61, CAST(N'2018-01-03 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (185, 'Donec egestas.', 70, CAST(N'2014-06-22 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (186, 'et tristique pellentesque, tellus sem mollis dui, in sodales', 31, CAST(N'2010-10-25 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (187, 'hendrerit. Donec porttitor tellus non magna. Nam ligula elit,', 25, CAST(N'2018-03-25 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (188, 'cursus', 89, CAST(N'2014-12-03 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (189, 'velit. Sed malesuada augue', 33, CAST(N'2013-07-13 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (190, 'placerat. Cras', 50, CAST(N'2009-09-23 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (191, 'luctus aliquet odio. Etiam', 92, CAST(N'2013-06-09 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (192, 'purus. Maecenas', 24, CAST(N'2016-02-15 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (193, 'Morbi quis urna. Nunc quis arcu', 56, CAST(N'2012-01-25 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (194, 'dictum magna. Ut tincidunt orci quis lectus.', 63, CAST(N'2009-03-19 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (195, 'quis turpis vitae purus', 14, CAST(N'2014-05-02 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (196, 'risus varius orci, in', 3, CAST(N'2012-11-17 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (197, 'orci luctus et ultrices posuere cubilia Curae; Phasellus', 55, CAST(N'2009-08-29 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (198, 'magnis dis parturient montes,', 81, CAST(N'2018-03-21 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (199, 'magnis dis parturient montes,', 45, CAST(N'2017-09-30 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (200, 'et magnis dis parturient', 45, CAST(N'2015-04-08 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (201, 'dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae,', 99, CAST(N'2009-12-04 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (202, 'Duis elementum,', 75, CAST(N'2016-12-26 00:00:00.000' AS datetime));
INSERT INTO comentarios (id, texto, id_usuario, fecha)
  VALUES (203, 'augue', 32, CAST(N'2009-05-13 00:00:00.000' AS datetime));

SET IDENTITY_INSERT comentarios OFF;

SET IDENTITY_INSERT invitaciones ON;

INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (1, CAST(N'2015-08-07 00:00:00.000' AS datetime), 75, 84, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (2, CAST(N'2017-04-20 00:00:00.000' AS datetime), 88, 61, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (3, CAST(N'2011-06-15 00:00:00.000' AS datetime), 37, 5, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (4, CAST(N'2017-05-23 00:00:00.000' AS datetime), 40, 94, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (5, CAST(N'2012-01-14 00:00:00.000' AS datetime), 75, 67, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (6, CAST(N'2009-11-23 00:00:00.000' AS datetime), 68, 2, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (7, CAST(N'2008-01-19 00:00:00.000' AS datetime), 70, 46, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (8, CAST(N'2012-05-03 00:00:00.000' AS datetime), 44, 93, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (9, CAST(N'2008-10-15 00:00:00.000' AS datetime), 14, 7, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (10, CAST(N'2013-10-31 00:00:00.000' AS datetime), 22, 1, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (11, CAST(N'2013-04-09 00:00:00.000' AS datetime), 88, 6, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (12, CAST(N'2011-01-18 00:00:00.000' AS datetime), 74, 54, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (13, CAST(N'2014-09-10 00:00:00.000' AS datetime), 47, 15, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (14, CAST(N'2009-11-27 00:00:00.000' AS datetime), 90, 22, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (15, CAST(N'2014-02-12 00:00:00.000' AS datetime), 70, 80, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (16, CAST(N'2008-03-26 00:00:00.000' AS datetime), 51, 56, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (17, CAST(N'2015-06-18 00:00:00.000' AS datetime), 18, 78, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (18, CAST(N'2013-12-15 00:00:00.000' AS datetime), 24, 31, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (19, CAST(N'2009-06-29 00:00:00.000' AS datetime), 63, 53, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (20, CAST(N'2016-09-23 00:00:00.000' AS datetime), 76, 45, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (21, CAST(N'2012-03-31 00:00:00.000' AS datetime), 80, 59, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (22, CAST(N'2012-05-11 00:00:00.000' AS datetime), 73, 57, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (23, CAST(N'2017-09-18 00:00:00.000' AS datetime), 62, 85, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (24, CAST(N'2015-09-13 00:00:00.000' AS datetime), 50, 70, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (25, CAST(N'2015-02-26 00:00:00.000' AS datetime), 91, 31, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (26, CAST(N'2012-02-25 00:00:00.000' AS datetime), 19, 22, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (27, CAST(N'2010-10-25 00:00:00.000' AS datetime), 43, 64, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (28, CAST(N'2017-08-12 00:00:00.000' AS datetime), 64, 77, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (29, CAST(N'2009-01-09 00:00:00.000' AS datetime), 9, 15, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (30, CAST(N'2008-11-01 00:00:00.000' AS datetime), 55, 84, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (31, CAST(N'2015-07-15 00:00:00.000' AS datetime), 71, 69, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (32, CAST(N'2009-03-13 00:00:00.000' AS datetime), 89, 15, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (33, CAST(N'2014-11-16 00:00:00.000' AS datetime), 58, 15, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (34, CAST(N'2010-09-20 00:00:00.000' AS datetime), 21, 83, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (35, CAST(N'2015-02-06 00:00:00.000' AS datetime), 47, 96, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (36, CAST(N'2017-01-23 00:00:00.000' AS datetime), 52, 96, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (37, CAST(N'2008-07-03 00:00:00.000' AS datetime), 29, 8, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (38, CAST(N'2015-01-19 00:00:00.000' AS datetime), 66, 19, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (39, CAST(N'2008-12-08 00:00:00.000' AS datetime), 94, 84, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (40, CAST(N'2016-01-02 00:00:00.000' AS datetime), 4, 58, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (41, CAST(N'2015-02-23 00:00:00.000' AS datetime), 57, 66, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (42, CAST(N'2018-01-01 00:00:00.000' AS datetime), 39, 32, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (43, CAST(N'2012-01-02 00:00:00.000' AS datetime), 81, 78, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (44, CAST(N'2012-08-15 00:00:00.000' AS datetime), 65, 82, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (45, CAST(N'2016-03-26 00:00:00.000' AS datetime), 49, 73, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (46, CAST(N'2014-11-17 00:00:00.000' AS datetime), 84, 77, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (47, CAST(N'2016-03-28 00:00:00.000' AS datetime), 71, 53, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (48, CAST(N'2009-01-29 00:00:00.000' AS datetime), 56, 23, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (49, CAST(N'2012-07-04 00:00:00.000' AS datetime), 7, 85, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (50, CAST(N'2017-05-22 00:00:00.000' AS datetime), 73, 20, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (51, CAST(N'2008-05-30 00:00:00.000' AS datetime), 87, 65, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (52, CAST(N'2009-09-17 00:00:00.000' AS datetime), 9, 16, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (53, CAST(N'2008-07-01 00:00:00.000' AS datetime), 4, 83, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (54, CAST(N'2015-01-02 00:00:00.000' AS datetime), 8, 90, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (55, CAST(N'2015-11-24 00:00:00.000' AS datetime), 91, 88, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (56, CAST(N'2015-07-19 00:00:00.000' AS datetime), 11, 93, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (57, CAST(N'2009-07-29 00:00:00.000' AS datetime), 48, 42, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (58, CAST(N'2015-06-06 00:00:00.000' AS datetime), 86, 49, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (60, CAST(N'2017-05-06 00:00:00.000' AS datetime), 97, 7, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (61, CAST(N'2011-05-02 00:00:00.000' AS datetime), 96, 6, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (62, CAST(N'2011-02-12 00:00:00.000' AS datetime), 25, 20, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (63, CAST(N'2014-04-25 00:00:00.000' AS datetime), 31, 37, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (64, CAST(N'2010-07-12 00:00:00.000' AS datetime), 53, 84, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (65, CAST(N'2013-04-07 00:00:00.000' AS datetime), 79, 46, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (66, CAST(N'2011-11-07 00:00:00.000' AS datetime), 100, 84, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (67, CAST(N'2017-01-20 00:00:00.000' AS datetime), 36, 22, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (68, CAST(N'2010-09-10 00:00:00.000' AS datetime), 46, 77, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (69, CAST(N'2017-01-28 00:00:00.000' AS datetime), 80, 75, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (70, CAST(N'2008-08-27 00:00:00.000' AS datetime), 63, 46, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (71, CAST(N'2010-06-17 00:00:00.000' AS datetime), 70, 53, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (72, CAST(N'2010-03-12 00:00:00.000' AS datetime), 49, 89, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (73, CAST(N'2016-05-18 00:00:00.000' AS datetime), 16, 10, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (74, CAST(N'2016-07-01 00:00:00.000' AS datetime), 32, 84, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (75, CAST(N'2010-10-18 00:00:00.000' AS datetime), 42, 61, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (76, CAST(N'2014-04-12 00:00:00.000' AS datetime), 20, 27, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (77, CAST(N'2010-01-11 00:00:00.000' AS datetime), 29, 42, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (78, CAST(N'2014-12-30 00:00:00.000' AS datetime), 78, 23, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (79, CAST(N'2013-06-12 00:00:00.000' AS datetime), 51, 7, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (80, CAST(N'2016-02-01 00:00:00.000' AS datetime), 64, 74, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (81, CAST(N'2009-08-18 00:00:00.000' AS datetime), 87, 14, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (82, CAST(N'2017-08-03 00:00:00.000' AS datetime), 8, 4, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (83, CAST(N'2013-06-22 00:00:00.000' AS datetime), 37, 8, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (84, CAST(N'2013-09-04 00:00:00.000' AS datetime), 61, 8, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (85, CAST(N'2017-08-16 00:00:00.000' AS datetime), 52, 70, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (86, CAST(N'2009-02-23 00:00:00.000' AS datetime), 84, 45, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (87, CAST(N'2014-10-23 00:00:00.000' AS datetime), 55, 37, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (88, CAST(N'2014-02-26 00:00:00.000' AS datetime), 70, 81, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (89, CAST(N'2008-12-26 00:00:00.000' AS datetime), 13, 2, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (90, CAST(N'2009-02-10 00:00:00.000' AS datetime), 98, 18, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (91, CAST(N'2017-02-03 00:00:00.000' AS datetime), 80, 2, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (92, CAST(N'2015-04-26 00:00:00.000' AS datetime), 66, 42, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (93, CAST(N'2014-11-13 00:00:00.000' AS datetime), 21, 49, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (94, CAST(N'2017-03-26 00:00:00.000' AS datetime), 64, 94, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (95, CAST(N'2010-06-15 00:00:00.000' AS datetime), 37, 74, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (96, CAST(N'2016-07-26 00:00:00.000' AS datetime), 49, 81, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (97, CAST(N'2015-04-08 00:00:00.000' AS datetime), 92, 43, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (98, CAST(N'2008-01-19 00:00:00.000' AS datetime), 57, 34, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (99, CAST(N'2009-05-23 00:00:00.000' AS datetime), 30, 24, 'P');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (100, CAST(N'2010-02-07 00:00:00.000' AS datetime), 1, 34, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (101, CAST(N'2008-09-04 00:00:00.000' AS datetime), 1, 35, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (102, CAST(N'2010-01-01 00:00:00.000' AS datetime), 1, 42, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (103, CAST(N'2013-01-18 00:00:00.000' AS datetime), 1, 49, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (104, CAST(N'2010-05-09 00:00:00.000' AS datetime), 2, 10, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (105, CAST(N'2010-01-21 00:00:00.000' AS datetime), 2, 25, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (106, CAST(N'2011-10-31 00:00:00.000' AS datetime), 2, 26, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (107, CAST(N'2013-02-01 00:00:00.000' AS datetime), 2, 30, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (108, CAST(N'2009-10-19 00:00:00.000' AS datetime), 3, 25, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (109, CAST(N'2011-01-13 00:00:00.000' AS datetime), 3, 50, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (110, CAST(N'2012-04-24 00:00:00.000' AS datetime), 4, 35, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (111, CAST(N'2008-06-04 00:00:00.000' AS datetime), 4, 42, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (112, CAST(N'2010-02-21 00:00:00.000' AS datetime), 5, 33, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (113, CAST(N'2016-04-02 00:00:00.000' AS datetime), 6, 3, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (114, CAST(N'2016-06-12 00:00:00.000' AS datetime), 6, 19, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (115, CAST(N'2014-02-07 00:00:00.000' AS datetime), 6, 22, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (116, CAST(N'2017-01-28 00:00:00.000' AS datetime), 6, 25, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (117, CAST(N'2010-01-24 00:00:00.000' AS datetime), 6, 36, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (118, CAST(N'2011-07-23 00:00:00.000' AS datetime), 6, 47, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (119, CAST(N'2013-11-08 00:00:00.000' AS datetime), 7, 28, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (120, CAST(N'2015-09-04 00:00:00.000' AS datetime), 7, 30, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (121, CAST(N'2014-02-14 00:00:00.000' AS datetime), 8, 27, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (122, CAST(N'2010-06-18 00:00:00.000' AS datetime), 8, 49, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (123, CAST(N'2014-05-04 00:00:00.000' AS datetime), 9, 7, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (124, CAST(N'2017-09-03 00:00:00.000' AS datetime), 9, 30, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (125, CAST(N'2015-11-30 00:00:00.000' AS datetime), 10, 12, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (126, CAST(N'2010-09-24 00:00:00.000' AS datetime), 11, 8, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (127, CAST(N'2010-08-16 00:00:00.000' AS datetime), 11, 17, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (128, CAST(N'2011-08-04 00:00:00.000' AS datetime), 11, 39, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (129, CAST(N'2015-03-12 00:00:00.000' AS datetime), 11, 47, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (130, CAST(N'2009-05-13 00:00:00.000' AS datetime), 12, 10, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (131, CAST(N'2010-05-31 00:00:00.000' AS datetime), 12, 33, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (132, CAST(N'2009-09-04 00:00:00.000' AS datetime), 12, 48, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (133, CAST(N'2009-03-26 00:00:00.000' AS datetime), 13, 12, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (134, CAST(N'2010-04-01 00:00:00.000' AS datetime), 13, 30, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (135, CAST(N'2008-01-26 00:00:00.000' AS datetime), 13, 37, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (136, CAST(N'2017-05-15 00:00:00.000' AS datetime), 14, 36, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (137, CAST(N'2017-06-10 00:00:00.000' AS datetime), 15, 4, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (138, CAST(N'2016-04-05 00:00:00.000' AS datetime), 15, 24, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (139, CAST(N'2016-07-06 00:00:00.000' AS datetime), 15, 29, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (140, CAST(N'2011-07-07 00:00:00.000' AS datetime), 15, 37, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (141, CAST(N'2014-04-07 00:00:00.000' AS datetime), 16, 31, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (142, CAST(N'2014-08-26 00:00:00.000' AS datetime), 16, 49, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (143, CAST(N'2012-05-25 00:00:00.000' AS datetime), 17, 5, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (144, CAST(N'2015-09-28 00:00:00.000' AS datetime), 17, 7, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (145, CAST(N'2017-05-11 00:00:00.000' AS datetime), 17, 22, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (146, CAST(N'2009-02-07 00:00:00.000' AS datetime), 17, 28, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (147, CAST(N'2014-08-18 00:00:00.000' AS datetime), 18, 4, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (148, CAST(N'2008-07-07 00:00:00.000' AS datetime), 19, 15, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (149, CAST(N'2014-01-03 00:00:00.000' AS datetime), 19, 28, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (150, CAST(N'2010-12-07 00:00:00.000' AS datetime), 19, 31, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (151, CAST(N'2010-09-12 00:00:00.000' AS datetime), 20, 17, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (152, CAST(N'2014-11-07 00:00:00.000' AS datetime), 20, 39, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (153, CAST(N'2013-08-10 00:00:00.000' AS datetime), 21, 3, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (154, CAST(N'2013-11-24 00:00:00.000' AS datetime), 21, 31, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (155, CAST(N'2009-08-26 00:00:00.000' AS datetime), 24, 2, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (156, CAST(N'2008-10-30 00:00:00.000' AS datetime), 25, 19, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (157, CAST(N'2012-06-10 00:00:00.000' AS datetime), 26, 15, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (158, CAST(N'2017-09-23 00:00:00.000' AS datetime), 26, 31, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (159, CAST(N'2014-09-19 00:00:00.000' AS datetime), 27, 10, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (160, CAST(N'2017-03-18 00:00:00.000' AS datetime), 27, 32, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (161, CAST(N'2011-08-01 00:00:00.000' AS datetime), 28, 27, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (162, CAST(N'2009-11-20 00:00:00.000' AS datetime), 29, 33, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (163, CAST(N'2010-02-23 00:00:00.000' AS datetime), 29, 50, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (164, CAST(N'2015-09-20 00:00:00.000' AS datetime), 30, 44, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (165, CAST(N'2008-12-06 00:00:00.000' AS datetime), 31, 28, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (166, CAST(N'2011-09-05 00:00:00.000' AS datetime), 32, 4, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (167, CAST(N'2016-04-28 00:00:00.000' AS datetime), 32, 11, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (168, CAST(N'2009-12-08 00:00:00.000' AS datetime), 32, 46, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (169, CAST(N'2009-02-14 00:00:00.000' AS datetime), 33, 26, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (170, CAST(N'2010-09-18 00:00:00.000' AS datetime), 33, 43, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (171, CAST(N'2011-03-04 00:00:00.000' AS datetime), 34, 32, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (172, CAST(N'2015-02-14 00:00:00.000' AS datetime), 34, 39, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (173, CAST(N'2011-09-24 00:00:00.000' AS datetime), 37, 34, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (174, CAST(N'2014-10-16 00:00:00.000' AS datetime), 38, 4, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (175, CAST(N'2017-11-27 00:00:00.000' AS datetime), 38, 19, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (176, CAST(N'2008-07-22 00:00:00.000' AS datetime), 38, 22, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (177, CAST(N'2008-03-07 00:00:00.000' AS datetime), 39, 24, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (178, CAST(N'2014-03-09 00:00:00.000' AS datetime), 40, 6, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (179, CAST(N'2014-10-26 00:00:00.000' AS datetime), 40, 11, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (180, CAST(N'2014-01-09 00:00:00.000' AS datetime), 40, 49, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (181, CAST(N'2012-04-23 00:00:00.000' AS datetime), 41, 49, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (182, CAST(N'2011-03-25 00:00:00.000' AS datetime), 42, 25, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (183, CAST(N'2011-12-05 00:00:00.000' AS datetime), 42, 38, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (184, CAST(N'2016-05-22 00:00:00.000' AS datetime), 43, 17, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (185, CAST(N'2010-06-28 00:00:00.000' AS datetime), 43, 33, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (186, CAST(N'2016-12-04 00:00:00.000' AS datetime), 44, 7, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (187, CAST(N'2012-03-16 00:00:00.000' AS datetime), 44, 12, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (188, CAST(N'2015-04-19 00:00:00.000' AS datetime), 44, 13, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (189, CAST(N'2010-11-23 00:00:00.000' AS datetime), 45, 34, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (190, CAST(N'2014-05-26 00:00:00.000' AS datetime), 48, 4, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (191, CAST(N'2012-06-02 00:00:00.000' AS datetime), 48, 11, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (192, CAST(N'2014-03-02 00:00:00.000' AS datetime), 48, 16, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (193, CAST(N'2015-09-03 00:00:00.000' AS datetime), 48, 29, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (194, CAST(N'2015-07-25 00:00:00.000' AS datetime), 48, 35, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (195, CAST(N'2017-05-12 00:00:00.000' AS datetime), 50, 40, 'A');
INSERT INTO invitaciones (id, fecha, usuario_1, usuario_2, estado)
  VALUES (196, CAST(N'2012-03-11 00:00:00.000' AS datetime), 50, 42, 'A');

SET IDENTITY_INSERT invitaciones OFF;

SET IDENTITY_INSERT sentimientos ON;
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (1, 0, 19, 56);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (2, 0, 36, 89);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (3, 0, 39, 69);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (4, 0, 3, 127);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (5, 1, 15, 138);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (6, 0, 19, 101);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (7, 0, 49, 113);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (8, 0, 8, 141);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (9, 0, 36, 128);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (10, 1, 33, 129);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (11, 1, 3, 127);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (15, 0, 3, 80);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (17, 1, 39, 50);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (18, 1, 31, 72);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (19, 1, 34, 122);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (23, 1, 28, 70);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (24, 0, 4, 126);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (26, 0, 22, 118);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (27, 0, 22, 142);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (30, 1, 19, 101);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (31, 0, 17, 103);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (34, 1, 4, 100);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (35, 1, 25, 135);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (36, 1, 19, 108);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (37, 0, 31, 107);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (39, 0, 25, 135);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (41, 1, 40, 55);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (42, 0, 37, 60);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (43, 0, 32, 87);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (47, 1, 49, 57);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (48, 0, 30, 67);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (50, 1, 33, 129);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (53, 1, 50, 140);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (54, 1, 2, 91);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (55, 0, 35, 59);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (56, 1, 34, 74);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (60, 1, 26, 73);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (62, 1, 25, 135);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (70, 0, 49, 113);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (71, 1, 38, 134);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (74, 1, 3, 80);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (76, 0, 15, 85);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (77, 0, 35, 54);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (78, 0, 29, 84);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (79, 0, 49, 104);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (80, 0, 25, 135);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (83, 0, 35, 77);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (84, 0, 36, 128);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (90, 0, 17, 103);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (94, 1, 32, 87);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (96, 1, 39, 111);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (98, 0, 29, 51);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (99, 1, 35, 77);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (103, 0, 43, 125);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (104, 0, 3, 127);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (109, 0, 31, 79);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (111, 1, 32, 96);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (113, 0, 42, 120);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (114, 0, 2, 91);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (118, 1, 33, 129);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (119, 0, 16, 82);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (123, 1, 22, 52);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (127, 0, 19, 108);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (128, 0, 11, 58);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (130, 0, 13, 75);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (131, 0, 50, 68);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (140, 0, 36, 89);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (144, 1, 34, 92);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (146, 0, 19, 101);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (150, 1, 30, 88);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (151, 0, 47, 121);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (152, 0, 30, 88);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (153, 0, 25, 135);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (159, 1, 30, 48);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (160, 0, 4, 64);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (161, 1, 15, 85);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (162, 0, 19, 101);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (166, 0, 38, 134);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (168, 1, 4, 119);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (169, 1, 49, 139);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (170, 1, 39, 111);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (172, 0, 28, 90);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (174, 0, 30, 48);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (175, 0, 39, 50);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (180, 0, 25, 78);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (183, 0, 30, 48);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (188, 1, 36, 128);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (189, 0, 28, 70);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (190, 0, 39, 69);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (195, 0, 36, 128);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (196, 0, 7, 115);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (197, 0, 36, 89);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (200, 0, 8, 141);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (202, 0, 16, 82);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (203, 0, 42, 66);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (205, 1, 34, 92);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (208, 1, 49, 57);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (223, 1, 47, 130);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (226, 1, 4, 64);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (227, 1, 19, 101);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (230, 1, 31, 79);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (231, 1, 44, 112);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (233, 1, 30, 48);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (234, 0, 25, 94);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (237, 0, 47, 121);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (240, 0, 37, 98);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (245, 1, 49, 104);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (247, 1, 25, 135);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (249, 0, 4, 100);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (250, 0, 39, 111);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (251, 0, 30, 67);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (252, 1, 31, 106);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (253, 0, 24, 83);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (255, 1, 35, 59);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (259, 0, 29, 84);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (262, 0, 33, 129);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (264, 0, 12, 99);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (270, 0, 28, 131);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (281, 0, 32, 96);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (282, 1, 37, 60);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (283, 1, 19, 101);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (285, 0, 11, 109);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (288, 1, 12, 99);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (290, 1, 39, 69);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (296, 1, 19, 56);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (297, 1, 30, 71);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (298, 0, 35, 77);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (301, 0, 39, 111);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (304, 0, 7, 115);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (306, 1, 11, 58);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (307, 0, 42, 123);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (308, 0, 28, 65);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (309, 0, 2, 91);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (310, 1, 28, 70);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (311, 1, 37, 60);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (313, 0, 25, 146);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (314, 1, 3, 80);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (316, 0, 42, 66);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (320, 1, 39, 69);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (322, 0, 25, 135);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (323, 1, 3, 127);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (325, 0, 17, 114);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (326, 1, 48, 61);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (327, 0, 49, 139);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (331, 0, 43, 125);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (333, 1, 7, 132);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (334, 0, 7, 132);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (335, 0, 40, 55);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (336, 1, 42, 120);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (337, 1, 30, 48);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (339, 1, 49, 57);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (342, 0, 3, 80);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (343, 1, 30, 48);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (348, 0, 25, 94);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (349, 1, 36, 89);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (350, 0, 26, 110);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (351, 1, 28, 90);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (353, 1, 39, 69);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (355, 0, 49, 139);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (359, 1, 30, 48);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (360, 0, 47, 121);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (362, 1, 26, 110);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (364, 1, 12, 95);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (365, 1, 40, 55);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (370, 1, 27, 133);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (372, 1, 42, 123);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (373, 1, 27, 62);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (376, 1, 49, 57);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (377, 0, 28, 65);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (378, 0, 39, 111);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (379, 1, 28, 131);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (380, 1, 12, 95);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (382, 0, 7, 115);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (385, 1, 24, 86);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (386, 1, 37, 98);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (387, 1, 49, 97);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (388, 1, 16, 82);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (392, 0, 12, 99);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (394, 1, 39, 69);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (396, 1, 30, 88);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (397, 1, 47, 130);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (398, 0, 33, 81);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (400, 1, 29, 51);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (402, 0, 28, 65);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (403, 1, 28, 90);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (405, 0, 4, 126);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (406, 1, 40, 55);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (408, 0, 4, 119);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (409, 1, 36, 89);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (410, 0, 38, 134);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (412, 1, 12, 99);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (416, 1, 25, 146);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (419, 1, 19, 108);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (421, 1, 7, 115);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (422, 1, 3, 80);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (424, 1, 19, 108);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (427, 1, 37, 98);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (430, 0, 10, 102);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (431, 0, 48, 61);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (432, 0, 13, 75);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (434, 0, 4, 63);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (436, 0, 32, 96);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (440, 0, 35, 54);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (441, 0, 22, 52);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (444, 0, 44, 112);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (446, 1, 13, 75);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (448, 1, 26, 110);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (450, 1, 49, 139);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (452, 0, 17, 124);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (453, 0, 4, 63);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (455, 1, 17, 103);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (460, 0, 4, 63);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (462, 0, 16, 82);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (464, 1, 30, 48);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (466, 0, 29, 51);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (468, 1, 42, 66);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (470, 1, 49, 97);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (471, 1, 10, 102);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (474, 1, 47, 121);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (476, 0, 30, 88);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (477, 1, 28, 90);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (478, 0, 49, 139);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (483, 0, 49, 104);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (485, 1, 17, 114);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (491, 1, 8, 141);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (494, 1, 37, 98);
INSERT INTO sentimientos (id, sentimiento, id_usuario, id_comentario)
  VALUES (498, 0, 8, 141);

SET IDENTITY_INSERT sentimientos OFF;

