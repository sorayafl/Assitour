DROP DATABASE IF EXISTS assistour;

DROP database assistour;

CREATE DATABASE assistour;


--- TABLE RAPATRIEMENT ---


CREATE TABLE RAPATRIEMENT
   (
    NUMRAPATRIEMENT char(32) NOT NULL  ,
    NUMSINISTRE char(32) NOT NULL  ,
    NUMORDRE int8 NULL  ,
    COMPAGNIE varchar NULL  ,
    COUT int4 NULL  ,
    VILLEDEPART varchar NULL  ,
    VILLEARRIVEE varchar NULL  ,
    HEUREDEPART time NULL  ,
    HEUREARRIVEE time NULL  
,   CONSTRAINT PK_RAPATRIEMENT PRIMARY KEY (NUMRAPATRIEMENT)
   );


CREATE  INDEX I_FK_RAPATRIEMENT_SINISTRE
     ON RAPATRIEMENT (NUMSINISTRE)
    ;


--- TABLE COMPAGNIETRANS ---

CREATE TABLE COMPAGNIETRANS
   (
    NUMINSEE int8 NOT NULL  ,
    RAISONSOCIAL varchar NULL  
,   CONSTRAINT PK_COMPAGNIETRANS PRIMARY KEY (NUMINSEE)
   );


--- TABLE MARQUE ---


CREATE TABLE MARQUE
   (
    NUM char(32) NOT NULL  ,
    RAISONSOCIAL varchar NULL  
,   CONSTRAINT PK_MARQUE PRIMARY KEY (NUM)
   );


--- TABLE GARAGE ---


CREATE TABLE GARAGE
   (
    NUMEROGARAGE char(32) NOT NULL  ,
    NOM varchar NULL  ,
    ADRESSE varchar NULL  ,
    TEL varchar NULL  ,
    MARQUE varchar NULL  ,
    PRIX int4 NULL  ,
    AVANCERFRAISOK bool NULL  
,   CONSTRAINT PK_GARAGE PRIMARY KEY (NUMEROGARAGE)
   );


--- TABLE VEHICULE ---


CREATE TABLE VEHICULE
   (
    IMMATRICULATION char(32) NOT NULL  ,
    IDETYPECONTRAT char(32) NOT NULL  ,
    NUMADHERENT char(32) NOT NULL  ,
    NUM char(32) NOT NULL  ,
    MARQUE varchar NULL  ,
    TYPE varchar NULL  ,
    MODELE varchar NULL  ,
    DATEMISEENCIRCULATION date NULL  
,   CONSTRAINT PK_VEHICULE PRIMARY KEY (IMMATRICULATION)
   );


CREATE  INDEX I_FK_VEHICULE_TYPECONTRAT
     ON VEHICULE (IDETYPECONTRAT)
    ;

CREATE  INDEX I_FK_VEHICULE_ADHERENT
     ON VEHICULE (NUMADHERENT)
    ;

CREATE  INDEX I_FK_VEHICULE_MARQUE
     ON VEHICULE (NUM)
    ;


--- TABLE HOTEL ---


CREATE TABLE HOTEL
   (
    NUMERO char(32) NOT NULL  ,
    NOM varchar NULL  ,
    ADRESSE varchar NULL  ,
    TEL varchar NULL  ,
    PRIXPARNUIT int4 NULL  
,   CONSTRAINT PK_HOTEL PRIMARY KEY (NUMERO)
   );


--- TABLE ADHERENT ---


CREATE TABLE ADHERENT
   (
    NUMADHERENT char(32) NOT NULL  ,
    NOMADHERENT varchar NULL  ,
    PRENOMADHERENT varchar NULL  ,
    ADRESSEADHERENT varchar NULL  ,
    CODEPOSTALADHERENT varchar NULL  ,
    VILLEADHERENT varchar NULL  ,
    TELEPHONEADHERENT varchar NULL  
,   CONSTRAINT PK_ADHERENT PRIMARY KEY (NUMADHERENT)
   );


--- TABLE TYPECONTRAT ---


CREATE TABLE TYPECONTRAT
   (
    IDETYPECONTRAT char(32) NOT NULL  ,
    NOIMTYPECONTRAT varchar NULL  ,
    CLAUSE varchar NULL  
,   CONSTRAINT PK_TYPECONTRAT PRIMARY KEY (IDETYPECONTRAT)
   );


--- TABLE SINISTRE --- 

CREATE TABLE SINISTRE
   (
    NUMSINISTRE char(32) NOT NULL  ,
    IDTA char(32) NOT NULL  ,
    NUMEROGARAGE char(32) NOT NULL  ,
    IMMATRICULATION char(32) NOT NULL  ,
    DATESINISTRE date NULL  ,
    HEURESINISTRE time NULL  ,
    CAUSESINISTRE varchar NULL  ,
    DIAGNOSTICSINISTRE varchar NULL  ,
    LIEUSINISTRE varchar NULL  ,
    NBPERS int4 NULL  
,   CONSTRAINT PK_SINISTRE PRIMARY KEY (NUMSINISTRE)
   );


CREATE  INDEX I_FK_SINISTRE_TECHNIQUEASSISTA
     ON SINISTRE (IDTA)
    ;

CREATE  INDEX I_FK_SINISTRE_GARAGE
     ON SINISTRE (NUMEROGARAGE)
    ;

CREATE  INDEX I_FK_SINISTRE_VEHICULE
     ON SINISTRE (IMMATRICULATION)
    ;


--- TABLE TECHNIQUEASSISTANCE --- 


CREATE TABLE TECHNIQUEASSISTANCE
   (
    IDTA char(32) NOT NULL  ,
    NOMTA varchar NULL  ,
    PRENOMTA varchar NULL  
,   CONSTRAINT PK_TECHNIQUEASSISTANCE PRIMARY KEY (IDTA)
   );


--- TABLE RAPATRIER --- 


CREATE TABLE RAPATRIER
   (
    NUMINSEE int8 NOT NULL  ,
    NUMRAPATRIEMENT char(32) NOT NULL  
,   CONSTRAINT PK_RAPATRIER PRIMARY KEY (NUMINSEE, NUMRAPATRIEMENT)
   );


CREATE  INDEX I_FK_RAPATRIER_COMPAGNIETRANS
     ON RAPATRIER (NUMINSEE)
    ;

CREATE  INDEX I_FK_RAPATRIER_RAPATRIEMENT
     ON RAPATRIER (NUMRAPATRIEMENT)
    ;


--- TABLE AVOIR --- 


CREATE TABLE AVOIR
   (
    NUMEROGARAGE char(32) NOT NULL  ,
    NUM char(32) NOT NULL  
,   CONSTRAINT PK_AVOIR PRIMARY KEY (NUMEROGARAGE, NUM)
   );


CREATE  INDEX I_FK_AVOIR_GARAGE
     ON AVOIR (NUMEROGARAGE)
    ;

CREATE  INDEX I_FK_AVOIR_MARQUE
     ON AVOIR (NUM)
    ;


--- TABLE HEBERGER --- 


CREATE TABLE HEBERGER
   (
    NUMERO char(32) NOT NULL  ,
    NUMSINISTRE char(32) NOT NULL  ,
    NBNUITEE INT
,   CONSTRAINT PK_HEBERGER PRIMARY KEY (NUMERO, NUMSINISTRE)
   );



CREATE  INDEX I_FK_HEBERGER_HOTEL
     ON HEBERGER (NUMERO)
    ;

CREATE  INDEX I_FK_HEBERGER_SINISTRE
     ON HEBERGER (NUMSINISTRE)
    ;



--- CREATION DES CONTRAINTES ---



ALTER TABLE RAPATRIEMENT 
ADD CONSTRAINT FK_RAPATRIEMENT_SINISTRE
FOREIGN KEY (NUMSINISTRE)
REFERENCES SINISTRE (NUMSINISTRE);

ALTER TABLE VEHICULE 
ADD CONSTRAINT FK_VEHICULE_TYPECONTRAT
FOREIGN KEY (IDETYPECONTRAT)
REFERENCES TYPECONTRAT (IDETYPECONTRAT);

ALTER TABLE VEHICULE 
ADD CONSTRAINT FK_VEHICULE_ADHERENT
FOREIGN KEY (NUMADHERENT)
REFERENCES ADHERENT (NUMADHERENT);

ALTER TABLE VEHICULE 
ADD CONSTRAINT FK_VEHICULE_MARQUE
FOREIGN KEY (NUM)
REFERENCES MARQUE (NUM);

ALTER TABLE SINISTRE 
ADD CONSTRAINT FK_SINISTRE_TECHNIQUEASSISTANCE
FOREIGN KEY (IDTA)
REFERENCES TECHNIQUEASSISTANCE (IDTA);

ALTER TABLE SINISTRE 
ADD CONSTRAINT FK_SINISTRE_GARAGE
FOREIGN KEY (NUMEROGARAGE)
REFERENCES GARAGE (NUMEROGARAGE);

ALTER TABLE SINISTRE 
ADD CONSTRAINT FK_SINISTRE_VEHICULE
FOREIGN KEY (IMMATRICULATION)
REFERENCES VEHICULE (IMMATRICULATION);	

ALTER TABLE RAPATRIER 
ADD CONSTRAINT FK_RAPATRIER_COMPAGNIETRANS
FOREIGN KEY (NUMINSEE)
REFERENCES COMPAGNIETRANS (NUMINSEE);

ALTER TABLE RAPATRIER 
ADD CONSTRAINT FK_RAPATRIER_RAPATRIEMENT
FOREIGN KEY (NUMRAPATRIEMENT)
REFERENCES RAPATRIEMENT (NUMRAPATRIEMENT);

ALTER TABLE AVOIR 
ADD CONSTRAINT FK_AVOIR_GARAGE
FOREIGN KEY (NUMEROGARAGE)
REFERENCES GARAGE (NUMEROGARAGE);

ALTER TABLE AVOIR 
ADD CONSTRAINT FK_AVOIR_MARQUE
FOREIGN KEY (NUM)
REFERENCES MARQUE (NUM);

ALTER TABLE HEBERGER 
ADD CONSTRAINT FK_HEBERGER_HOTEL
FOREIGN KEY (NUMERO)
REFERENCES HOTEL (NUMERO);

ALTER TABLE HEBERGER 
ADD CONSTRAINT FK_HEBERGER_SINISTRE
FOREIGN KEY (NUMSINISTRE)
REFERENCES SINISTRE (NUMSINISTRE);
