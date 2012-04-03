-- View definitions

CREATE VIEW APP.AUTHOR_V
(USERNAME, REALNAME, EMAIL, STATUS, CREATED, MODIFIED)
AS SELECT A.USERNAME, A.REALNAME, A.EMAIL, S.STATUS, S.CREATED, S.MODIFIED FROM APP.AUTHOR A, APP.AUTHOR_STATUS S WHERE A.USERNAME = S.AUTHOR;

CREATE VIEW APP.NOTES_V
(AUTHOR, TITLE, NOTE, STATUS, CREATED, MODIFIED)
AS SELECT N.AUTHOR, N.TITLE, N.NOTE, S.STATUS, S.CREATED, S.MODIFIED FROM APP.NOTES N, APP.NOTES_STATUS S WHERE N.ID = S.ID;
