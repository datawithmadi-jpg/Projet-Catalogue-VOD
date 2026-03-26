--======================================================
-- Création de la base de donnnées
-- =====================================================
USE master;
CREATE DATABASE catalogue_vod_final;
USE catalogue_vod_final;

--======================================================
-- Table : genre de film
--======================================================
CREATE TABLE genre_film (
	code_genre CHAR(2) CONSTRAINT pk_code_genre PRIMARY KEY,
	signification VARCHAR(30) NOT NULL
);

-- =====================================================
-- Table : réalisateurs
-- =====================================================
CREATE TABLE realisateurs (
    code_realisateur CHAR(6) CONSTRAINT pk_realisateurs PRIMARY KEY,
    prenom VARCHAR(20) NOT NULL,
    nom VARCHAR(20) NOT NULL,
    annee_naissance INT NOT NULL,
    pays VARCHAR(20) NOT NULL
);

-- =========================================
-- Table : DVD
-- =========================================
CREATE TABLE dvd (
    num_dvd INT IDENTITY(1,1) CONSTRAINT pk_dvd PRIMARY KEY,
    titre VARCHAR(40) NOT NULL,
    prix_base MONEY NOT NULL,
    code_realisateur CHAR(6) NOT NULL,
    code_genre CHAR(2) NOT NULL,
    annee INT NOT NULL,
    descriptif VARCHAR(300) NULL,
    duree INT NULL,

    -- Clés étrangères
    CONSTRAINT fk_dvd_genre
        FOREIGN KEY (code_genre)
        REFERENCES genre_film(code_genre),

    CONSTRAINT fk_dvd_realisateurs
        FOREIGN KEY (code_realisateur)
        REFERENCES realisateurs(code_realisateur)
);

-- =========================================
-- Table : types de location
-- =========================================
CREATE TABLE types_location (
    code_type CHAR(2) CONSTRAINT pk_types_location PRIMARY KEY,
    libelle VARCHAR(30) NOT NULL,
    coefficient NUMERIC(4,2) NOT NULL,
    nb_jours NUMERIC(6,2) NOT NULL
);

-- =========================================
-- Table : clients
-- =========================================
CREATE TABLE clients (
    code_client CHAR(6) CONSTRAINT pk_clients PRIMARY KEY,
    civilite VARCHAR(4) NOT NULL,
    prenom VARCHAR(30) NOT NULL,
    nom VARCHAR(30) NOT NULL,
    adresse_rue VARCHAR(45) NOT NULL,
    code_postal CHAR(5) NOT NULL,
    ville VARCHAR(30) NOT NULL,
    num_telephone CHAR(10) NOT NULL,
    date_naissance DATETIME NULL,
    enfants BIT NULL,

    -- Contrainte
    CONSTRAINT ck_clients_titre
        CHECK (civilite IN ('M.','Mme','Mlle'))
);

-- =========================================
-- Table : factures
-- =========================================
CREATE TABLE factures (
    num_facture INT IDENTITY(1,1) CONSTRAINT pk_factures PRIMARY KEY,
    code_client CHAR(6) NOT NULL,
    date_facture DATE NOT NULL,

    CONSTRAINT fk_factures_clients
        FOREIGN KEY (code_client)
        REFERENCES clients(code_client)
);

-- =========================================
-- Table : locations
-- =========================================
CREATE TABLE locations (
    num_facture INT NOT NULL,
    num_dvd INT NOT NULL,
    code_type CHAR(2) NOT NULL,
    date_retour DATETIME NULL,

    CONSTRAINT pk_locations
        PRIMARY KEY (num_facture, num_dvd),

    CONSTRAINT fk_locations_factures
        FOREIGN KEY (num_facture)
        REFERENCES factures(num_facture),

    CONSTRAINT fk_locations_dvd
        FOREIGN KEY (num_dvd)
        REFERENCES dvd(num_dvd),

    CONSTRAINT fk_locations_types_location
        FOREIGN KEY (code_type)
        REFERENCES types_location(code_type)
);
