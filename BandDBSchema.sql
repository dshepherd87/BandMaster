DROP TABLE IF EXISTS instrument;
DROP TABLE IF EXISTS instrumentType;
DROP TABLE IF EXISTS instrumentSubType;
DROP TABLE IF EXISTS personnelOffice;
DROP TABLE IF EXISTS personnel;
DROP TABLE IF EXISTS office;


CREATE TABLE			personnel(
personnel_UID			INT AUTO_INCREMENT PRIMARY KEY,
realWorld_ID			CHAR(30),
firstName				CHAR(30),
lastName				CHAR(40),
middleName				CHAR(30),
title					CHAR(20)
);

CREATE TABLE			office(
office_UID				INT AUTO_INCREMENT PRIMARY KEY,
officeName				CHAR(30)
);

CREATE TABLE			personnelOffice(
personnel_UID			INT,
office_UID				INT,
PRIMARY KEY 			(personnel_UID, office_UID),
CONSTRAINT `fk_personnelOffice_personnel`
	FOREIGN KEY (personnel_UID) REFERENCES personnel (personnel_UID)
	ON DELETE CASCADE
	ON UPDATE RESTRICT,
CONSTRAINT `fk_personnelOffice_office`
	FOREIGN KEY (office_UID) REFERENCES office (office_UID)
	ON DELETE CASCADE
	ON UPDATE RESTRICT
);

CREATE TABLE			instrumentType(
instrumentType_UID		INT AUTO_INCREMENT PRIMARY KEY,
description				CHAR(40)
);

CREATE TABLE			instrumentSubType(
instrumentSubType_UID	INT AUTO_INCREMENT PRIMARY KEY,
description				CHAR(20)
);

CREATE TABLE			instrument(
instrument_UID			INT AUTO_INCREMENT PRIMARY KEY,
serialNumber			CHAR(40),
manufacturer			CHAR(40) NOT NULL,
model					CHAR(40) NOT NULL,
type_UID				INT NOT NULL,
subType_UID				INT,
personnel_UID			INT,
CONSTRAINT `fk_instrument_instrumentType`
	FOREIGN KEY (type_UID) REFERENCES instrumentType (instrumentType_UID)
	ON DELETE CASCADE
	ON UPDATE RESTRICT,	
CONSTRAINT `fk_instrument_instrumentSubType`
	FOREIGN KEY (subType_UID) REFERENCES instrumentSubType (instrumentSubType_UID)
	ON DELETE CASCADE
	ON UPDATE RESTRICT,
CONSTRAINT `fk_instrument_personnel`
	FOREIGN KEY (personnel_UID) REFERENCES personnel (personnel_UID)
	ON DELETE CASCADE
	ON UPDATE RESTRICT
);