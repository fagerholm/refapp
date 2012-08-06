-- Table definitions

CREATE TABLE REFAPP.AUTHOR
(
	USERNAME	VARCHAR(20) NOT NULL,
	FIRSTNAME	VARCHAR(50) NOT NULL,
	LASTNAME	VARCHAR(50) NOT NULL,
	BIRTHDATE	DATE NOT NULL,
	GENDER		VARCHAR(10) NOT NULL,
	EMAIL		VARCHAR(50) NOT NULL,
	PHONE		VARCHAR(50),
	CONSTRAINT AUTHOR_PK	PRIMARY KEY (USERNAME),
	CONSTRAINT AUTHOR_FK1	FOREIGN KEY (GENDER) REFERENCES REFAPP.REF_GENDER (GENDER),
	CONSTRAINT AUTHOR_UC1	UNIQUE (EMAIL)
);

CREATE TABLE REFAPP.AUTHOR_STATUS
(
	AUTHOR		VARCHAR(20) NOT NULL,
	STATUS		VARCHAR(10) NOT NULL,
	CREATED		DATE NOT NULL,
	MODIFIED	DATE NOT NULL,
	CONSTRAINT AUTHOR_STATUS_PK		PRIMARY KEY (AUTHOR),
	CONSTRAINT AUTHOR_STATUS_FK1	FOREIGN KEY (AUTHOR) REFERENCES REFAPP.AUTHOR (USERNAME) ON DELETE CASCADE,
	CONSTRAINT AUTHOR_STATUS_FK2	FOREIGN KEY (STATUS) REFERENCES REFAPP.REF_AUTHOR_STATUS (STATUS),
	CONSTRAINT AUTHOR_STATUS_CC1	CHECK (MODIFIED >= CREATED)
);

CREATE TABLE REFAPP.AUTHOR_PASSWORD
(
	AUTHOR		VARCHAR(20) NOT NULL,
	SALT		VARCHAR(50) NOT NULL,
	PASSWORD	VARCHAR(100) NOT NULL,
	CONSTRAINT AUTHOR_PASSWORD_PK	PRIMARY KEY (AUTHOR),
	CONSTRAINT AUTHOR_PASSWORD_FK1	FOREIGN KEY (AUTHOR) REFERENCES REFAPP.AUTHOR (USERNAME) ON DELETE CASCADE
);

CREATE TABLE REFAPP.AUTHOR_ADDRESS
(
	AUTHOR			VARCHAR(20) NOT NULL,
	ADDRESS			VARCHAR(50),
	POSTALCODE		VARCHAR(10),
	MUNICIPALITY	VARCHAR(50),
	REGION			VARCHAR(50),
	COUNTRY			VARCHAR(50),
	CONSTRAINT AUTHOR_ADDRESS_PK	PRIMARY KEY (AUTHOR),
	CONSTRAINT AUTHOR_ADDRESS_FK1	FOREIGN KEY (AUTHOR) REFERENCES REFAPP.AUTHOR (USERNAME) ON DELETE CASCADE
);
