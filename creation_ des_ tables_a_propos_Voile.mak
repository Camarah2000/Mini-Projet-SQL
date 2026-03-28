DROP TABLE IF EXISTS Proprietaires;
DROP TABLE IF EXISTS Bateaux;
DROP TABLE IF EXISTS Emplacements;
DROP TABLE IF EXISTS Modeles;
DROP TABLE IF EXISTS TypesEmplacements;
DROP TABLE IF EXISTS Adherents;

-- Pour activer les FKs
PRAGMA FOREIGN_KEYS=ON;

--Types SQLite vs ORACLE (TEXT = VARCHAR; REAL & INTEGER = NUMBER)
CREATE TABLE Modeles (
   nom_modele TEXT,
   longueur_modele REAL,
   CONSTRAINT pk_modele PRIMARY KEY (nom_modele)

);

CREATE TABLE TypesEmplacements (
   taille_type_emplacement TEXT ,
   long_min_type_emplacement REAL,
   long_max_type_emplacement REAL,
   prix_type_emplacement REAL
   CONSTRAINT pk_types_emplacements PRIMARY KEY (taille_type_emplacement)
);

CREATE TABLE Emplacements (
   numero_emplacement INTEGER,
   longueur_emplacement REAL,
   taille_type_emplacement TEXT  not null,
   CONSTRAINT pk_emplacements PRIMARY KEY (numero_emplacement)

);

CREATE TABLE Bateaux (
   numero_bateau INTEGER, 
   date_construction_bateau DATE,
   nom_modele TEXT,
   numero_emplacement INTEGER not null,
   CONSTRAINT pk_bateaux PRIMARY KEY (numero_bateau)
);

CREATE TABLE Adherents (
   numero_adherent INTEGER,
   nom_adherent TEXT,
   prenom_adherent TEXT,
   date_naissance_adherent DATE
   CONSTRAINT pk_adherents PRIMARY KEY (numero_adherent)
);

CREATE TABLE Proprietaires (
   numero_adherent INTEGER,
   numero_bateau INTEGER
   CONSTRAINT pk_proprietaires PRIMARY KEY (numero_adherent, numero_bateau)
);
