CREATE TABLE IF NOT EXISTS `cursuri` (
  `id_curs` int(15) NOT NULL AUTO_INCREMENT,
  `id_categorie` int(15) NOT NULL,
  `id_responsabil` int(15) NOT NULL,
  `titlu` varchar(255) NOT NULL,
  `descriere` text NOT NULL,
  `data_inceput` datetime NOT NULL,
  `data_creare` datetime NOT NULL,
  PRIMARY KEY (`id_curs`),
  KEY `id_responsabil` (`id_responsabil`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `cursuri_activitati` (
  `id_activitate` int(10) NOT NULL AUTO_INCREMENT,
  `id_tip_activitate` int(10) NOT NULL,
  `titlu` varchar(255) NOT NULL,
  `data_creare` datetime NOT NULL,
  PRIMARY KEY (`id_activitate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `cursuri_categorii` (
  `id_categorie` int(15) NOT NULL AUTO_INCREMENT,
  `id_parinte` int(15) NOT NULL,
  `titlu` varchar(255) NOT NULL,
  `descriere` text NOT NULL,
  `data_creare` datetime NOT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

INSERT INTO `cursuri_categorii` (`id_categorie`, `id_parinte`, `titlu`, `descriere`, `data_creare`) VALUES
(1, 3, 'Departamentul de Informatica', '', '2013-05-17 00:20:08'),
(2, 3, 'Departamentul  de Matematica', '', '2013-05-17 00:20:34'),
(3, 0, 'Facultatea de Matematica si Informatica', '', '2013-05-17 00:21:59');

CREATE TABLE IF NOT EXISTS `cursuri_tipuri_activitati` (
  `id_tip_activitate` int(10) NOT NULL AUTO_INCREMENT,
  `tip_activitate` varchar(150) NOT NULL,
  PRIMARY KEY (`id_tip_activitate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `forum` (
  `id_forum` int(15) NOT NULL AUTO_INCREMENT,
  `id_curs` int(15) NOT NULL,
  `nume` varchar(255) NOT NULL,
  `descriere` varchar(255) NOT NULL,
  `data_creare` datetime NOT NULL,
  PRIMARY KEY (`id_forum`),
  KEY `id_curs` (`id_curs`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `forum_discutii` (
  `id_discutie` int(15) NOT NULL AUTO_INCREMENT,
  `id_forum` int(15) NOT NULL,
  `id_utilizator` int(15) NOT NULL,
  `titlu` int(11) NOT NULL,
  `data_creare` int(11) NOT NULL,
  PRIMARY KEY (`id_discutie`),
  KEY `id_forum` (`id_forum`),
  KEY `id_utilizator` (`id_utilizator`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `forum_postari` (
  `id_postare` int(15) NOT NULL AUTO_INCREMENT,
  `id_discutie` int(15) NOT NULL,
  `id_utilizator` int(15) NOT NULL,
  `mesaj` text NOT NULL,
  `data_creare` datetime NOT NULL,
  PRIMARY KEY (`id_postare`),
  KEY `id_discutie` (`id_discutie`),
  KEY `id_utilizator` (`id_utilizator`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `mesaje` (
  `id_mesaj` bigint(15) NOT NULL AUTO_INCREMENT,
  `de_la_utilizator` int(10) NOT NULL,
  `catre_utilizator` int(10) NOT NULL,
  `subiect` varchar(255) NOT NULL,
  `mesaj` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `data_creare` datetime NOT NULL,
  PRIMARY KEY (`id_mesaj`),
  KEY `de_la_utilizator` (`de_la_utilizator`),
  KEY `catre_utilizator` (`catre_utilizator`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

INSERT INTO `mesaje` (`id_mesaj`, `de_la_utilizator`, `catre_utilizator`, `subiect`, `mesaj`, `status`, `data_creare`) VALUES
(1, 1, 3, 'Raspuns privind data examen', 'Examenul va avea loc pe data de 12 iunie. Va rog sa-i anuntati si pe colegii din grupa dumneavoastra.<br><br>O zi buna,<br>Mihai Constantin<br>', 0, '2013-06-10 23:37:35');

CREATE TABLE IF NOT EXISTS `noutati` (
  `id_noutate` int(15) NOT NULL AUTO_INCREMENT,
  `id_utilizator` int(15) NOT NULL,
  `titlu` varchar(250) NOT NULL,
  `text` text NOT NULL,
  `data_creare` datetime NOT NULL,
  PRIMARY KEY (`id_noutate`),
  KEY `id_utilizator` (`id_utilizator`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

INSERT INTO `noutati` (`id_noutate`, `id_utilizator`, `titlu`, `text`, `data_creare`) VALUES
(1, 1, 'Conferinta "Romanian Cryptology Days"', 'Serviciul de Informatii Externe, organizeaza in parteneriat cu Academia \r\nRomana cea de-a doua editie a conferintei internationale <b>"Romanian \r\nCryptology Days"</b>, RCD-2013, in perioada <u>16-17 septembrie 2013</u> la \r\nBucuresti. Manifestarea este inscrisa in calendarul de evenimente \r\ncriptologice de pe site-ul IACR. Lucrarile sustinute vor fi publicate \r\nintr-un volum cotat ISI.<br>', '2013-06-10 20:59:44'),
(2, 1, 'Evaluare institutionala I', 'Potrivit unui studiu intern realizat in luna ianuarie 2011, absolventii \r\nFacultatii de Matematica si Informatica, specializarea Informatica, la \r\n6-18 luni de la absolvire, lucreaza in domeniu, cu program complet si \r\nurmeaza in paralel un program de Master.<br>', '2013-06-10 21:01:25'),
(3, 1, 'Evaluare institutionala II', 'Domeniile de studiu Matematica si Informatica din FMI au fost \r\nclasificate in categoria A, printre primele la nivel national \r\n(Matematica pe locul 3, Informatica pe locul 1), conform unui raport \r\npublicat de MECTS la inceputul noului an universitar 2011-2012.<br>', '2013-06-10 21:01:45');

CREATE TABLE IF NOT EXISTS `permisiuni` (
  `id_permisiune` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descriere_permisiune` varchar(50) NOT NULL,
  PRIMARY KEY (`id_permisiune`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `roluri` (
  `id_rol` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nume_rol` varchar(50) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

INSERT INTO `roluri` (`id_rol`, `nume_rol`) VALUES
(1, 'Administrator'),
(2, 'Profesor'),
(3, 'Student');

CREATE TABLE IF NOT EXISTS `roluri_permisiuni` (
  `id_rol` int(10) unsigned NOT NULL,
  `id_permisiune` int(10) unsigned NOT NULL,
  KEY `id_rol` (`id_rol`),
  KEY `id_permisiune` (`id_permisiune`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `roluri_utilizatori` (
  `id_utilizator` int(10) unsigned NOT NULL,
  `id_rol` int(10) unsigned NOT NULL,
  KEY `id_utilizator` (`id_utilizator`),
  KEY `id_rol` (`id_rol`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `roluri_utilizatori` (`id_utilizator`, `id_rol`) VALUES
(1, 1),
(2, 2),
(3, 3);

CREATE TABLE IF NOT EXISTS `utilizatori` (
  `id_utilizator` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `parola` varchar(32) NOT NULL,
  `nume` varchar(300) NOT NULL,
  `telefon` varchar(100) NOT NULL,
  `localitate` varchar(200) NOT NULL,
  `adresa` varchar(255) NOT NULL,
  `data_creare` datetime NOT NULL,
  `activ` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_utilizator`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

INSERT INTO `utilizatori` (`id_utilizator`, `email`, `username`, `parola`, `nume`, `telefon`, `localitate`, `adresa`, `data_creare`, `activ`) VALUES
(1, 'admin@site.ro', 'admin', 'fe01ce2a7fbac8fafaed7c982a04e229', 'Iulian Burcea', '', 'Bucuresti', '', '2013-05-10 00:13:04', 1),
(2, 'profesor@test.ro', 'profesor', 'fe01ce2a7fbac8fafaed7c982a04e229', 'Emil Popescu', '', '', '', '2013-05-16 23:01:56', 1),
(3, 'student@test.ro', 'student', 'fe01ce2a7fbac8fafaed7c982a04e229', 'Mihai Constantin', '', '', '', '2013-05-16 23:02:17', 1);