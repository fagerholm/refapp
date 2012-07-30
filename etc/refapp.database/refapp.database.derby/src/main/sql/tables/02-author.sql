-- Table definitions

CREATE TABLE REFAPP.AUTHOR
(
	USERNAME	VARCHAR(20) NOT NULL,
	REALNAME	VARCHAR(50) NOT NULL,
	EMAIL		VARCHAR(50) NOT NULL,
	CONSTRAINT AUTHOR_PK	PRIMARY KEY (USERNAME),
	CONSTRAINT AUTHOR_UC	UNIQUE (EMAIL)
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
