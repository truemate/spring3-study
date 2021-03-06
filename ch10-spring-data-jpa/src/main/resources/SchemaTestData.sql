﻿CREATE TABLE CONTACT (
ID INT NOT NULL AUTO_INCREMENT
, FIRST_NAME VARCHAR(60) NOT NULL
, LAST_NAME VARCHAR(40) NOT NULL
, BIRTH_DATE DATE
, VERSION INT NOT NULL DEFAULT 0
, UNIQUE UQ_CONTACT_1 (FIRST_NAME, LAST_NAME)
, PRIMARY KEY (ID)
);

CREATE TABLE HOBBY (
HOBBY_ID VARCHAR(20) NOT NULL
, PRIMARY KEY (HOBBY_ID)
);

CREATE TABLE CONTACT_TEL_DETAIL (
ID INT NOT NULL AUTO_INCREMENT
, CONTACT_ID INT NOT NULL
, TEL_TYPE VARCHAR(20) NOT NULL
, TEL_NUMBER VARCHAR(20) NOT NULL
, VERSION INT NOT NULL DEFAULT 0
, UNIQUE UQ_CONTACT_TEL_DETAIL_1 (CONTACT_ID, TEL_TYPE)
, PRIMARY KEY (ID)
, CONSTRAINT FK_CONTACT_TEL_DETAIL_1 FOREIGN KEY (CONTACT_ID)
REFERENCES CONTACT (ID)
);

CREATE TABLE CONTACT_HOBBY_DETAIL (
CONTACT_ID INT NOT NULL
, HOBBY_ID VARCHAR(20) NOT NULL
, PRIMARY KEY (CONTACT_ID, HOBBY_ID)
, CONSTRAINT FK_CONTACT_HOBBY_DETAIL_1 FOREIGN KEY (CONTACT_ID)
REFERENCES CONTACT (ID) ON DELETE CASCADE
, CONSTRAINT FK_CONTACT_HOBBY_DETAIL_2 FOREIGN KEY (HOBBY_ID)
REFERENCES HOBBY (HOBBY_ID)
);

insert into contact (first_name, last_name, birth_date) values ('Clarence', 'Ho', '1980-07-30');
insert into contact (first_name, last_name, birth_date) values ('Scott', 'Tiger', '1990-11-02');
insert into contact (first_name, last_name, birth_date) values ('John', 'Smith', '1964-02-28');

insert into contact_tel_detail (contact_id, tel_type, tel_number) values (1, 'Mobile', '1234567890');
insert into contact_tel_detail (contact_id, tel_type, tel_number) values (1, 'Home', '1234567890');
insert into contact_tel_detail (contact_id, tel_type, tel_number) values (2, 'Home', '1234567890');

insert into hobby (hobby_id) values ('Swimming');
insert into hobby (hobby_id) values ('Jogging');
insert into hobby (hobby_id) values ('Programming');
insert into hobby (hobby_id) values ('Movies');
insert into hobby (hobby_id) values ('Reading');

insert into contact_hobby_detail(contact_id, hobby_id) values (1, 'Swimming');
insert into contact_hobby_detail(contact_id, hobby_id) values (1, 'Movies');
insert into contact_hobby_detail(contact_id, hobby_id) values (2, 'Swimming');

CREATE TABLE CONTACT_AUDIT (
ID INT NOT NULL AUTO_INCREMENT
, FIRST_NAME VARCHAR(60) NOT NULL
, LAST_NAME VARCHAR(40) NOT NULL
, BIRTH_DATE DATE
, VERSION INT NOT NULL DEFAULT 0
, CREATED_BY VARCHAR(20)
, CREATED_DATE TIMESTAMP
, LAST_MODIFIED_BY VARCHAR(20)
, LAST_MODIFIED_DATE TIMESTAMP
, UNIQUE UQ_CONTACT_AUDIT_1 (FIRST_NAME, LAST_NAME)
, PRIMARY KEY (ID)
);

CREATE TABLE CONTACT_AUDIT_H (
ID INT NOT NULL
, FIRST_NAME VARCHAR(60) NOT NULL
, LAST_NAME VARCHAR(40) NOT NULL
, BIRTH_DATE DATE
, VERSION INT NOT NULL DEFAULT 0
, CREATED_BY VARCHAR(20)
, CREATED_DATE TIMESTAMP
, LAST_MODIFIED_BY VARCHAR(20)
, LAST_MODIFIED_DATE TIMESTAMP
, AUDIT_REVISION INT NOT NULL
, ACTION_TYPE INT
, AUDIT_REVISION_END INT
, AUDIT_REVISION_END_TS TIMESTAMP
, UNIQUE UQ_CONTACT_AUDIT_H_1 (FIRST_NAME, LAST_NAME)
, PRIMARY KEY (ID, AUDIT_REVISION)
);

CREATE TABLE REVINFO (
REVTSTMP BIGINT NOT NULL
, REV INT NOT NULL AUTO_INCREMENT
, PRIMARY KEY (REV)
);