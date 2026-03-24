-- ============================== ===========
-- BASE DE DONNÉES : CATALOGUE VOD
-- ============================== ===========

USE master;
GO

CREATE DATABASE catalogue_vod;
GO

USE catalogue_vod;
GO

-- ============================== ===========
-- TABLE : genres_film
-- ============================== ===========
CREATE TABLE genres_film (
    code_genre CHAR(2) PRIMARY KEY,
    signification VARCHAR(30) NOT NULL
);
GO

-- ============================= ===========
-- TABLE : realisateurs
-- ============================== ===========
CREATE TABLE realisateurs (
    code_realisateur CHAR(6) PRIMARY KEY,
    prenom VARCHAR(20),
    nom VARCHAR(20) NOT NULL,
    annee_naissance NUMERIC,
    paie VARCHAR(20)
);
ALLER

-- ============================= ===========
-- TABLE : dvd
-- ============================== ===========
CREATE TABLE dvd (
    num_dvd INT IDENTITY(1,1) PRIMARY KEY,
    titre VARCHAR(40) NOT NULL,
    prix_base MONEY NOT NULL,
    code_realisateur CHAR(6),
    code_genre CHAR(2) NOT NULL,
    année DECIMAL,
    descriptif VARCHAR(300),
    duree INT,

    CONSTRAINT fk_dvd_genre
        FOREIGN KEY (code_genre)
        REFERENCES genres_film(code_genre),

    CONTRAINTE fk_dvd_realisateur
        CLÉ ÉTRANGÈRE (code_realisateur)
        RÉFÉRENCES realisateurs(code_realisateur)
);
GO

-- ============================== ===========
-- TABLE : types_location
-- ============================== ===========
CRÉER TABLE types_location (
    code_type CHAR(2) PRIMARY KEY,
    libelle VARCHAR(30) NOT NULL,
    coefficient NUMERIC(4,2) NOT NULL,
    nb_jours NUMERIC(6,2) NOT NULL
);
GO

-- ============================== ===========
-- TABLE : clients
-- ============================== ===========
CRÉER TABLE clients (
    code_client CHAR(6) PRIMARY KEY,
    civilite VARCHAR(4) NOT NULL,
    prenom VARCHAR(30) NOT NULL,
    nom VARCHAR(30) NOT NULL,
    adresse_rue VARCHAR(45) NOT NULL,
    code_postal CHAR(5) NOT NULL,
    ville VARCHAR(30) NOT NULL,
    num_telephone CHAR(10) NOT NULL,
    date_naissance DATETIME,
    enfants BIT,

    CONSTRAINT ck_clients_civilite
        CHECK (civilite IN ('M.','Mme','Mlle'))
);
GO

-- ============================== ===========
-- TABLE : factures
-- ============================== ===========
CREATE TABLE factures (
    num_facture INT IDENTITY(1,1) PRIMARY KEY,
    code_client CHAR(6) NOT NULL,
    date_facture DATE NOT NULL,

    CONSTRAINT fk_factures_clients
        FOREIGN KEY (code_client)
        REFERENCES clients(code_client)
);
GO

-- ============================== ===========
-- TABLE : locations
-- ============================== ===========
CREATE TABLE locations (
    num_facture INT NOT NULL,
    num_dvd INT NOT NULL,
    code_type CHAR(2) NOT NULL,
    date_retour DATETIME,

    CONSTRAINT pk_locations
        PRIMARY KEY (num_facture, num_dvd),

    CONSTRAINT fk_locations_factures
        FOREIGN KEY (num_facture)
        REFERENCES factures(num_facture),

    CONSTRAINT fk_locations_dvd
        FOREIGN KEY (num_dvd)
        REFERENCES dvd(num_dvd),

    CONSTRAINT fk_locations_types
        FOREIGN KEY (code_type)
        REFERENCES types_location(code_type)
);
GO