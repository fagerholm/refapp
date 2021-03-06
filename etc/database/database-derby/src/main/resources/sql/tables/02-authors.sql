-- Table definitions

CREATE TABLE REFAPP.AUTHORS
(
	USERNAME	VARCHAR(20) NOT NULL,
	FIRSTNAME	VARCHAR(50) NOT NULL,
	LASTNAME	VARCHAR(50) NOT NULL,
	BIRTHDATE	DATE NOT NULL,
	GENDER		VARCHAR(10) NOT NULL,
	EMAIL		VARCHAR(50) NOT NULL,
	PHONE		VARCHAR(50),
	CONSTRAINT AUTHORS_PK	PRIMARY KEY (USERNAME),
	CONSTRAINT AUTHORS_FK1	FOREIGN KEY (GENDER) REFERENCES REFAPP.REF_GENDER (GENDER),
	CONSTRAINT AUTHORS_UC1	UNIQUE (EMAIL)
);

CREATE TABLE REFAPP.AUTHORS_STATUS
(
	AUTHOR		VARCHAR(20) NOT NULL,
	STATUS		VARCHAR(10) NOT NULL,
	CREATED		TIMESTAMP NOT NULL,
	MODIFIED	TIMESTAMP NOT NULL,
	CONSTRAINT AUTHORS_STATUS_PK	PRIMARY KEY (AUTHOR),
	CONSTRAINT AUTHORS_STATUS_FK1	FOREIGN KEY (AUTHOR) REFERENCES REFAPP.AUTHORS (USERNAME) ON DELETE CASCADE,
	CONSTRAINT AUTHORS_STATUS_FK2	FOREIGN KEY (STATUS) REFERENCES REFAPP.REF_AUTHORS_STATUS (STATUS),
	CONSTRAINT AUTHORS_STATUS_CC1	CHECK (MODIFIED >= CREATED)
);

CREATE TABLE REFAPP.AUTHORS_PASSWORD
(
	AUTHOR		VARCHAR(20) NOT NULL,
	PASSWORD	VARCHAR(100) NOT NULL,
	CONSTRAINT AUTHORS_PASSWORD_PK	PRIMARY KEY (AUTHOR),
	CONSTRAINT AUTHORS_PASSWORD_FK1	FOREIGN KEY (AUTHOR) REFERENCES REFAPP.AUTHORS (USERNAME) ON DELETE CASCADE
);

CREATE TABLE REFAPP.AUTHORS_ADDRESS
(
	AUTHOR			VARCHAR(20) NOT NULL,
	ADDRESS			VARCHAR(50),
	POSTALCODE		VARCHAR(10),
	MUNICIPALITY	VARCHAR(50),
	REGION			VARCHAR(50),
	COUNTRY			VARCHAR(50),
	CONSTRAINT AUTHORS_ADDRESS_PK	PRIMARY KEY (AUTHOR),
	CONSTRAINT AUTHORS_ADDRESS_FK1	FOREIGN KEY (AUTHOR) REFERENCES REFAPP.AUTHORS (USERNAME) ON DELETE CASCADE
);
