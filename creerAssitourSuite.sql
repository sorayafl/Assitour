drop database assistour;
-- -----------------------------------------------------------------------------
--       CREATION DE LA BASE 
-- -----------------------------------------------------------------------------

CREATE DATABASE assistour;

-- -----------------------------------------------------------------------------
--       TABLE : RAPATRIEMENT
-- -----------------------------------------------------------------------------

CREATE TABLE RAPATRIEMENT
   (
    NUMRAPATRIEMENT char(32) NOT NULL  ,
    NUMSINISTRE char(32) NOT NULL  ,
    NUMORDRE int8 NULL  ,
    COMPAGNIE text NULL  ,
    COUT int4 NULL  ,
    VILLEDEPART text NULL  ,
    VILLEARRIVEE text NULL  ,
    HEUREDEPART time NULL  ,
    HEUREARRIVEE time NULL  
,   CONSTRAINT PK_RAPATRIEMENT PRIMARY KEY (NUMRAPATRIEMENT)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE RAPATRIEMENT
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_RAPATRIEMENT_SINISTRE
     ON RAPATRIEMENT (NUMSINISTRE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : TYPEOPERATION
-- -----------------------------------------------------------------------------

CREATE TABLE TYPEOPERATION
   (
    CODETYPEOPERATION char(32) NOT NULL  ,
    LIBELLETYPEOPERATION text NULL  
,   CONSTRAINT PK_TYPEOPERATION PRIMARY KEY (CODETYPEOPERATION)
   );

-- -----------------------------------------------------------------------------
--       TABLE : COMPAGNIETRANS
-- -----------------------------------------------------------------------------

CREATE TABLE COMPAGNIETRANS
   (
    NUMINSEE int8 NOT NULL  ,
    RAISONSOCIAL text NULL  
,   CONSTRAINT PK_COMPAGNIETRANS PRIMARY KEY (NUMINSEE)
   );

-- -----------------------------------------------------------------------------
--       TABLE : MARQUE
-- -----------------------------------------------------------------------------

CREATE TABLE MARQUE
   (
    NUM char(32) NOT NULL  ,
    RAISONSOCIAL text NULL  
,   CONSTRAINT PK_MARQUE PRIMARY KEY (NUM)
   );

-- -----------------------------------------------------------------------------
--       TABLE : COULEUR
-- -----------------------------------------------------------------------------

CREATE TABLE COULEUR
   (
    CODECOULEUR char(32) NOT NULL  ,
    LIBELLECOULEUR text NULL  
,   CONSTRAINT PK_COULEUR PRIMARY KEY (CODECOULEUR)
   );

-- -----------------------------------------------------------------------------
--       TABLE : GARAGE
-- -----------------------------------------------------------------------------

CREATE TABLE GARAGE
   (
    NUMEROGARAGE char(32) NOT NULL  ,
    NOM text NULL  ,
    ADRESSE text NULL  ,
    TEL text NULL  ,
    MARQUE text NULL  ,
    PRIX int4 NULL  ,
    AVANCERFRAISOK bool NULL  
,   CONSTRAINT PK_GARAGE PRIMARY KEY (NUMEROGARAGE)
   );

-- -----------------------------------------------------------------------------
--       TABLE : VEHICULE
-- -----------------------------------------------------------------------------

CREATE TABLE VEHICULE
   (
    IMMATRICULATION char(32) NOT NULL  ,
    IDETYPECONTRAT char(32) NOT NULL  ,
    NUMADHERENT char(32) NOT NULL  ,
    NUM char(32) NOT NULL  ,
    MARQUE text NULL  ,
    TYPE text NULL  ,
    MODELE text NULL  ,
    DATEMISEENCIRCULATION date NULL  
,   CONSTRAINT PK_VEHICULE PRIMARY KEY (IMMATRICULATION)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE VEHICULE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_VEHICULE_TYPECONTRAT
     ON VEHICULE (IDETYPECONTRAT)
    ;

CREATE  INDEX I_FK_VEHICULE_ADHERENT
     ON VEHICULE (NUMADHERENT)
    ;

CREATE  INDEX I_FK_VEHICULE_MARQUE
     ON VEHICULE (NUM)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : HOTEL
-- -----------------------------------------------------------------------------

CREATE TABLE HOTEL
   (
    NUMERO char(32) NOT NULL  ,
    NOM text NULL  ,
    ADRESSE text NULL  ,
    TEL text NULL  ,
    PRIXPARNUIT int4 NULL  
,   CONSTRAINT PK_HOTEL PRIMARY KEY (NUMERO)
   );

-- -----------------------------------------------------------------------------
--       TABLE : ADHERENT
-- -----------------------------------------------------------------------------

CREATE TABLE ADHERENT
   (
    NUMADHERENT char(32) NOT NULL  ,
    NOMADHERENT text NULL  ,
    PRENOMADHERENT text NULL  ,
    ADRESSEADHERENT text NULL  ,
    CODEPOSTALADHERENT text NULL  ,
    VILLEADHERENT text NULL  ,
    TELEPHONEADHERENT text NULL  
,   CONSTRAINT PK_ADHERENT PRIMARY KEY (NUMADHERENT)
   );

-- -----------------------------------------------------------------------------
--       TABLE : TYPECONTRAT
-- -----------------------------------------------------------------------------

CREATE TABLE TYPECONTRAT
   (
    IDETYPECONTRAT char(32) NOT NULL  ,
    NOIMTYPECONTRAT text NULL  ,
    CLAUSE text NULL  
,   CONSTRAINT PK_TYPECONTRAT PRIMARY KEY (IDETYPECONTRAT)
   );

-- -----------------------------------------------------------------------------
--       TABLE : SINISTRE
-- -----------------------------------------------------------------------------

CREATE TABLE SINISTRE
   (
    NUMSINISTRE char(32) NOT NULL  ,
    IDTA char(32) NOT NULL  ,
    NUMEROGARAGE char(32) NOT NULL  ,
    IMMATRICULATION char(32) NOT NULL  ,
    CODETYPEOPERATION char(32) NOT NULL  ,
    DATESINISTRE date NULL  ,
    HEURESINISTRE time NULL  ,
    CAUSESINISTRE text NULL  ,
    DIAGNOSTICSINISTRE text NULL  ,
    LIEUSINISTRE text NULL  ,
    NBPERS int4 NULL  
,   CONSTRAINT PK_SINISTRE PRIMARY KEY (NUMSINISTRE)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE SINISTRE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_SINISTRE_TECHNIQUEASSISTA
     ON SINISTRE (IDTA)
    ;

CREATE  INDEX I_FK_SINISTRE_GARAGE
     ON SINISTRE (NUMEROGARAGE)
    ;

CREATE  INDEX I_FK_SINISTRE_VEHICULE
     ON SINISTRE (IMMATRICULATION)
    ;

CREATE  INDEX I_FK_SINISTRE_TYPEOPERATION
     ON SINISTRE (CODETYPEOPERATION)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : TECHNIQUEASSISTANCE
-- -----------------------------------------------------------------------------

CREATE TABLE TECHNIQUEASSISTANCE
   (
    IDTA char(32) NOT NULL  ,
    NOMTA text NULL  ,
    PRENOMTA text NULL  
,   CONSTRAINT PK_TECHNIQUEASSISTANCE PRIMARY KEY (IDTA)
   );

-- -----------------------------------------------------------------------------
--       TABLE : EVALUER
-- -----------------------------------------------------------------------------

CREATE TABLE EVALUER
   (
    CODECOULEUR char(32) NOT NULL  ,
    NUMSINISTRE char(32) NOT NULL  ,
    NUMERO char(32) NOT NULL  
,   CONSTRAINT PK_EVALUER PRIMARY KEY (NUMSINISTRE, NUMERO)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE EVALUER
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_EVALUER_COULEUR
     ON EVALUER (CODECOULEUR)
    ;

CREATE  INDEX I_FK_EVALUER_SINISTRE
     ON EVALUER (NUMSINISTRE)
    ;

CREATE  INDEX I_FK_EVALUER_HOTEL
     ON EVALUER (NUMERO)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : RAPATRIER
-- -----------------------------------------------------------------------------

CREATE TABLE RAPATRIER
   (
    NUMINSEE int8 NOT NULL  ,
    NUMRAPATRIEMENT char(32) NOT NULL  
,   CONSTRAINT PK_RAPATRIER PRIMARY KEY (NUMINSEE, NUMRAPATRIEMENT)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE RAPATRIER
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_RAPATRIER_COMPAGNIETRANS
     ON RAPATRIER (NUMINSEE)
    ;

CREATE  INDEX I_FK_RAPATRIER_RAPATRIEMENT
     ON RAPATRIER (NUMRAPATRIEMENT)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : AVOIR
-- -----------------------------------------------------------------------------

CREATE TABLE AVOIR
   (
    NUMEROGARAGE char(32) NOT NULL  ,
    NUM char(32) NOT NULL  
,   CONSTRAINT PK_AVOIR PRIMARY KEY (NUMEROGARAGE, NUM)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE AVOIR
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_AVOIR_GARAGE
     ON AVOIR (NUMEROGARAGE)
    ;

CREATE  INDEX I_FK_AVOIR_MARQUE
     ON AVOIR (NUM)
    ;
    
-- -----------------------------------------------------------------------------
--       TABLE : REALISATION
-- -----------------------------------------------------------------------------
    
    CREATE TABLE REALISER
   (
    IMMATRICULATION char(32) NOT NULL  ,
    CODETYPEOPERATION char(32) NOT NULL  ,
    NUMS int4 NOT NULL  
,   CONSTRAINT PK_REALISATION PRIMARY KEY (IMMATRICULATION, CODETO)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE REALISATION
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_REALISER_TYPEOPERATION
     ON REALISER (CODETYPEOPERATION)
    ;

CREATE  INDEX I_FK_REALISER_SINISTRE
     ON REALISER (NUMS)
    ;

CREATE  INDEX I_FK_REALISER_VEHICULE
     ON REALISER (IMMATRICULATION)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : HEBERGER
-- -----------------------------------------------------------------------------

CREATE TABLE HEBERGER
   (
    NUMERO char(32) NOT NULL  ,
    NUMSINISTRE char(32) NOT NULL  
,   CONSTRAINT PK_HEBERGER PRIMARY KEY (NUMERO, NUMSINISTRE)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE HEBERGER
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_HEBERGER_HOTEL
     ON HEBERGER (NUMERO)
    ;

CREATE  INDEX I_FK_HEBERGER_SINISTRE
     ON HEBERGER (NUMSINISTRE)
    ;


-- -----------------------------------------------------------------------------
--       CREATION DES REFERENCES DE TABLE
-- -----------------------------------------------------------------------------


ALTER TABLE RAPATRIEMENT ADD 
     CONSTRAINT FK_RAPATRIEMENT_SINISTRE
          FOREIGN KEY (NUMSINISTRE)
               REFERENCES SINISTRE (NUMSINISTRE);

ALTER TABLE VEHICULE ADD 
     CONSTRAINT FK_VEHICULE_TYPECONTRAT
          FOREIGN KEY (IDETYPECONTRAT)
               REFERENCES TYPECONTRAT (IDETYPECONTRAT);

ALTER TABLE VEHICULE ADD 
     CONSTRAINT FK_VEHICULE_ADHERENT
          FOREIGN KEY (NUMADHERENT)
               REFERENCES ADHERENT (NUMADHERENT);

ALTER TABLE VEHICULE ADD 
     CONSTRAINT FK_VEHICULE_MARQUE
          FOREIGN KEY (NUM)
               REFERENCES MARQUE (NUM);

ALTER TABLE SINISTRE ADD 
     CONSTRAINT FK_SINISTRE_TECHNIQUEASSISTANCE
          FOREIGN KEY (IDTA)
               REFERENCES TECHNIQUEASSISTANCE (IDTA);

ALTER TABLE SINISTRE ADD 
     CONSTRAINT FK_SINISTRE_GARAGE
          FOREIGN KEY (NUMEROGARAGE)
               REFERENCES GARAGE (NUMEROGARAGE);

ALTER TABLE SINISTRE ADD 
     CONSTRAINT FK_SINISTRE_VEHICULE
          FOREIGN KEY (IMMATRICULATION)
               REFERENCES VEHICULE (IMMATRICULATION);

ALTER TABLE SINISTRE ADD 
     CONSTRAINT FK_SINISTRE_TYPEOPERATION
          FOREIGN KEY (CODETYPEOPERATION)
               REFERENCES TYPEOPERATION (CODETYPEOPERATION);

ALTER TABLE EVALUER ADD 
     CONSTRAINT FK_EVALUER_COULEUR
          FOREIGN KEY (CODECOULEUR)
               REFERENCES COULEUR (CODECOULEUR);

ALTER TABLE EVALUER ADD 
     CONSTRAINT FK_EVALUER_SINISTRE
          FOREIGN KEY (NUMSINISTRE)
               REFERENCES SINISTRE (NUMSINISTRE);

ALTER TABLE EVALUER ADD 
     CONSTRAINT FK_EVALUER_HOTEL
          FOREIGN KEY (NUMERO)
               REFERENCES HOTEL (NUMERO);


ALTER TABLE RAPATRIER ADD 
     CONSTRAINT FK_RAPATRIER_COMPAGNIETRANS
          FOREIGN KEY (NUMINSEE)
               REFERENCES COMPAGNIETRANS (NUMINSEE);

ALTER TABLE RAPATRIER ADD 
     CONSTRAINT FK_RAPATRIER_RAPATRIEMENT
          FOREIGN KEY (NUMRAPATRIEMENT)
               REFERENCES RAPATRIEMENT (NUMRAPATRIEMENT);

ALTER TABLE AVOIR ADD 
     CONSTRAINT FK_AVOIR_GARAGE
          FOREIGN KEY (NUMEROGARAGE)
               REFERENCES GARAGE (NUMEROGARAGE);

ALTER TABLE AVOIR ADD 
     CONSTRAINT FK_AVOIR_MARQUE
          FOREIGN KEY (NUM)
               REFERENCES MARQUE (NUM);

ALTER TABLE HEBERGER ADD 
     CONSTRAINT FK_HEBERGER_HOTEL
          FOREIGN KEY (NUMERO)
               REFERENCES HOTEL (NUMERO);

ALTER TABLE HEBERGER ADD 
     CONSTRAINT FK_HEBERGER_SINISTRE
          FOREIGN KEY (NUMSINISTRE)
               REFERENCES SINISTRE (NUMSINISTRE);
