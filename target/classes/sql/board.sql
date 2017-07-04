
<!----------------------------------
 
sqlplus system 
conn/as sysdba;
create user hanbit identified by hanbit;
grant resource, connect to hanbit;

GRANT CONNECT, RESOURCE TO hanbit;
GRANT CREATE VIEW, CREATE SYNONYM TO hanbit;      

conn hanbit/hanbit;
show user; 

----------------------------------->


DROP TABLE Article;
DROP TABLE BoardUser;
DROP SEQUENCE seq;

-- CREATE SEQUENCE seq
CREATE SEQUENCE seq
START WITH 1
INCREMENT BY 1
NOCACHE NOCYCLE;

-- CREATE
CREATE TABLE BoardUser (
	id VARCHAR2(10) NOT NULL,
	pass VARCHAR2(20) NOT NULL,
	phone VARCHAR2(15) NOT NULL,
	gender VARCHAR2(1) NOT NULL,
	age VARCHAR2(2) NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE Article (
	seq DECIMAL NOT NULL,
	id VARCHAR2(10) NOT NULL,
	title VARCHAR2(30) NOT NULL,
	content VARCHAR2(1000) NOT NULL,
	regdate VARCHAR2(30) NOT NULL,
	readCount VARCHAR2(5) NOT NULL,
	PRIMARY KEY(seq),
	CONSTRAINT fk_column
    FOREIGN KEY (id)
    REFERENCES BoardUser(id)
);

ALTER TABLE Article
ADD CONSTRAINT FK_User FOREIGN KEY (id)
REFERENCE BoardUser(id);

select * from user_constraints where constraint_name = 'SYS_C003190';
alter table table_name DROP CONSTRAINT constraint_name;

SELECT * FROM BoardUser;
DELETE FROM BoardUser WHERE id = 'test';

-- INSERT 
INSERT INTO BoardUser(id, pass, phone, gender, age) VALUES ('admin', '1234', '010-2206-8900', 'M', '28');
INSERT INTO BoardUser(id, pass, phone, gender, age) VALUES ('babungv', '1234', '010-2206-8900', 'M', '28');

INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Hi','Hello my friends', sysdate,'3');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Second','MY SECOND ARTICLE',sysdate,'5');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Third','MY THIRD ARTICLE',sysdate,'7');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Forth','MY FOUTH ARTICLE',sysdate,'4');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Fifth','MY FIFTH ARTICLE',sysdate,'2');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'admin','Hi2','Hello my friends2',sysdate,'3');

INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Hi1','Hello my friends', sysdate,'3');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Second1','MY SECOND ARTICLE',sysdate,'5');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Third1','MY THIRD ARTICLE',sysdate,'7');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Forth1','MY FOUTH ARTICLE',sysdate,'4');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Fifth1','MY FIFTH ARTICLE',sysdate,'2');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'admin','Hi11','Hello my friends2',sysdate,'3');

INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Hi2','Hello my friends', sysdate,'3');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Second2','MY SECOND ARTICLE',sysdate,'5');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Third2','MY THIRD ARTICLE',sysdate,'7');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Forth2','MY FOUTH ARTICLE',sysdate,'4');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Fifth2','MY FIFTH ARTICLE',sysdate,'2');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'admin','Hi22','Hello my friends2',sysdate,'3');

INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Hi3','Hello my friends', sysdate,'3');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Second3','MY SECOND ARTICLE',sysdate,'5');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Third3','MY THIRD ARTICLE',sysdate,'7');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Forth3','MY FOUTH ARTICLE',sysdate,'4');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Fifth3','MY FIFTH ARTICLE',sysdate,'2');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'admin','Hi33','Hello my friends2',sysdate,'3');

INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Hi4','Hello my friends', sysdate,'3');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Second4','MY SECOND ARTICLE',sysdate,'5');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Third4','MY THIRD ARTICLE',sysdate,'7');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Forth4','MY FOUTH ARTICLE',sysdate,'4');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Fifth4','MY FIFTH ARTICLE',sysdate,'2');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'admin','Hi44','Hello my friends2',sysdate,'3');

INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Hi5','Hello my friends', sysdate,'3');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Second5','MY SECOND ARTICLE',sysdate,'5');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Third5','MY THIRD ARTICLE',sysdate,'7');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Forth5','MY FOUTH ARTICLE',sysdate,'4');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Fifth5','MY FIFTH ARTICLE',sysdate,'2');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'admin','Hi55','Hello my friends2',sysdate,'3');

SELECT * FROM Article;

-- QUERY FOR Pagination
SELECT t2.*
FROM (SELECT ROWNUM art_seq, t.* 
FROM (SELECT * FROM Article ORDER BY seq DESC) t) t2
WHERE t2.art_seq BETWEEN 1 AND 5;

-- IN MAPPER
SELECT t2.* FROM (SELECT ROWNUM art_seq, t.* FROM (SELECT * FROM Article ORDER BY seq DESC) t) t2 WHERE t2.art_seq BETWEEN 1 AND 5
SELECT t2.* FROM (SELECT ROWNUM art_seq, t.* FROM (SELECT * FROM Article ORDER BY seq DESC) t) t2 WHERE t2.art_seq BETWEEN ${startRow} AND ${endRow}

