CREATE DATABASE mini_projet_groupe11;

USE mini_projet_groupe11;

CREATE TABLE Pays(
   Id_Pays_ISO CHAR(2),
   Nom_Pays VARCHAR(50),
   PRIMARY KEY(Id_Pays_ISO)
);

CREATE TABLE Staff(
   Id_Staff VARCHAR(10),
   Nom_Staff VARCHAR(50),
   Prenom_Staff VARCHAR(50),
   Role_Staff VARCHAR(20),
   PRIMARY KEY(Id_Staff)
);

CREATE TABLE Entrainement(
   Id_Entrainement VARCHAR(10),
   Date_Entrainement DATE,
   Debut_Créneau TIME,
   Fin_Créneau TIME,
   PRIMARY KEY(Id_Entrainement)
);

CREATE TABLE Arbitre(
   Id_Arbitre VARCHAR(10),
   Certification_Arbitre VARCHAR(15),
   Date_Naissance DATE,
   Date_Premier_Match DATE,
   Id_Pays_ISO CHAR(2) NOT NULL,
   Id_Staff VARCHAR(10) NOT NULL,
   PRIMARY KEY(Id_Arbitre),
   UNIQUE(Id_Staff),
   FOREIGN KEY(Id_Pays_ISO) REFERENCES Pays(Id_Pays_ISO),
   FOREIGN KEY(Id_Staff) REFERENCES Staff(Id_Staff)
);

CREATE TABLE Ville(
   Nom_Ville VARCHAR(50),
   Id_Pays_ISO CHAR(2) NOT NULL,
   PRIMARY KEY(Nom_Ville),
   FOREIGN KEY(Id_Pays_ISO) REFERENCES Pays(Id_Pays_ISO)
);

CREATE TABLE Tournoi(
   Id_Tournoi VARCHAR(10),
   Nom_Tournoi VARCHAR(50),
   Année SMALLINT,
   Division_Tournoi VARCHAR(20),
   Nom_Ville VARCHAR(50) NOT NULL,
   PRIMARY KEY(Id_Tournoi),
   FOREIGN KEY(Nom_Ville) REFERENCES Ville(Nom_Ville)
);

CREATE TABLE Tableau(
   Id_Tableau VARCHAR(10),
   Nombre_Points_Max SMALLINT,
   Genre_Tableau VARCHAR(3),
   Nom_Tableau VARCHAR(20),
   Id_Tournoi VARCHAR(10) NOT NULL,
   PRIMARY KEY(Id_Tableau),
   FOREIGN KEY(Id_Tournoi) REFERENCES Tournoi(Id_Tournoi)
);

CREATE TABLE Court(
   Id_Court VARCHAR(5),
   Nom_Court VARCHAR(30),
   Capacité_Court SMALLINT,
   Nom_Ville VARCHAR(50) NOT NULL,
   PRIMARY KEY(Id_Court),
   FOREIGN KEY(Nom_Ville) REFERENCES Ville(Nom_Ville)
);

CREATE TABLE Match_(
   Id_Match VARCHAR(12),
   Résultat_Match VARCHAR(50),
   Type_Surface VARCHAR(20),
   Durée_Match REAL,
   Heure_Début TIME,
   Id_Arbitre VARCHAR(10) NOT NULL,
   PRIMARY KEY(Id_Match),
   UNIQUE(Id_Arbitre),
   FOREIGN KEY(Id_Arbitre) REFERENCES Arbitre(Id_Arbitre)
);

CREATE TABLE Joueur(
   Id_Joueur VARCHAR(10),
   Nom_Joueur VARCHAR(50),
   Prenom_Joueur VARCHAR(50),
   Points_Classement INT,
   Date_Naissance DATE,
   _Classement_Mondial_ SMALLINT,
   Id_Pays_ISO CHAR(2) NOT NULL,
   Id_Match VARCHAR(12),
   PRIMARY KEY(Id_Joueur),
   FOREIGN KEY(Id_Match) REFERENCES Match_(Id_Match),
   FOREIGN KEY(Id_Pays_ISO) REFERENCES Pays(Id_Pays_ISO)
);

CREATE TABLE Ramasseur(
   Id_Ramasseur VARCHAR(10),
   Nom_Ramasseur VARCHAR(50),
   Prenom_Ramasseur VARCHAR(50),
   Date_Naissance DATE,
   Date_Premier_Match DATE,
   Id_Pays_ISO CHAR(2) NOT NULL,
   Id_Match VARCHAR(12),
   Id_Staff VARCHAR(10) NOT NULL,
   PRIMARY KEY(Id_Ramasseur),
   UNIQUE(Id_Staff),
   FOREIGN KEY(Id_Pays_ISO) REFERENCES Pays(Id_Pays_ISO),
   FOREIGN KEY(Id_Match) REFERENCES Match_(Id_Match),
   FOREIGN KEY(Id_Staff) REFERENCES Staff(Id_Staff)
);

CREATE TABLE Billet(
   Id_Match VARCHAR(12),
   Id_Billet VARCHAR(15),
   Prix_Billet DOUBLE,
   Numéro_Siège_Billet SMALLINT,
   Type_Billet VARCHAR(15),
   Date_Billet DATE,
   PRIMARY KEY(Id_Match, Id_Billet),
   FOREIGN KEY(Id_Match) REFERENCES Match_(Id_Match)
);

CREATE TABLE S_ENTRAINER(
   Id_Joueur VARCHAR(10),
   Id_Court VARCHAR(5),
   Id_Entrainement VARCHAR(10),
   PRIMARY KEY(Id_Joueur, Id_Court, Id_Entrainement),
   FOREIGN KEY(Id_Joueur) REFERENCES Joueur(Id_Joueur),
   FOREIGN KEY(Id_Court) REFERENCES Court(Id_Court),
   FOREIGN KEY(Id_Entrainement) REFERENCES Entrainement(Id_Entrainement)
);

CREATE TABLE SE_DEROULE(
   Id_Court VARCHAR(5),
   Id_Match VARCHAR(12),
   PRIMARY KEY(Id_Court, Id_Match),
   FOREIGN KEY(Id_Court) REFERENCES Court(Id_Court),
   FOREIGN KEY(Id_Match) REFERENCES Match_(Id_Match)
);

CREATE TABLE APPARTENIR(
   Id_Joueur VARCHAR(10),
   Points_Gagnés SMALLINT,
   Id_Tableau VARCHAR(10) NOT NULL,
   PRIMARY KEY(Id_Joueur),
   FOREIGN KEY(Id_Joueur) REFERENCES Joueur(Id_Joueur),
   FOREIGN KEY(Id_Tableau) REFERENCES Tableau(Id_Tableau)
);

CREATE TABLE RESULTAT(
   Id_Match VARCHAR(12),
   Gagnant VARCHAR(50),
   Score_Match VARCHAR(30),
   Id_Tableau VARCHAR(10) NOT NULL,
   PRIMARY KEY(Id_Match),
   FOREIGN KEY(Id_Match) REFERENCES Match_(Id_Match),
   FOREIGN KEY(Id_Tableau) REFERENCES Tableau(Id_Tableau)
);