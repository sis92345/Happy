/* ȸ�� */
CREATE TABLE scott.Member (
	userid CHAR(14) NOT NULL, /* ���̵� */
	passwd CHAR(10) NOT NULL, /* ��й�ȣ */
	name VARCHAR2(20) NOT NULL, /* ȸ���̸� */
	email VARCHAR2(50) NOT NULL, /* ȸ���̸��� */
	gender CHAR(1) DEFAULT 2 NOT NULL, /* ���� */
	city VARCHAR2(20), /* ������ */
	age NUMBER(3) /* ���� */
);

COMMENT ON TABLE scott.Member IS 'ȸ��';

COMMENT ON COLUMN scott.Member.userid IS '���̵�';

COMMENT ON COLUMN scott.Member.passwd IS '��й�ȣ';

COMMENT ON COLUMN scott.Member.name IS 'ȸ���̸�';

COMMENT ON COLUMN scott.Member.email IS 'ȸ���̸���';

COMMENT ON COLUMN scott.Member.gender IS '����';

COMMENT ON COLUMN scott.Member.city IS '������';

COMMENT ON COLUMN scott.Member.age IS '����';

CREATE UNIQUE INDEX scott.PK_Member
	ON scott.Member (
		userid ASC
	);

ALTER TABLE scott.Member
	ADD
		CONSTRAINT PK_Member
		PRIMARY KEY (
			userid
		);
		

CREATE OR REPLACE PROCEDURE sp_member_login
(
    v_userid     IN      member.userid%TYPE,
    login_record     OUT      SYS_REFCURSOR
)
IS
BEGIN
    OPEN login_record FOR
    SELECT passwd FROM Member
    WHERE userid = v_userid;
    
END;


CREATE OR REPLACE PROCEDURE sp_member_insert
(
    v_userid     IN    member.userid%TYPE,
    v_passwd     IN    member.passwd%TYPE,
    v_name     IN    member.name%TYPE,
    v_email     IN    member.email%TYPE,
    v_gender     IN    member.gender%TYPE,
    v_city     IN    member.city%TYPE,
    v_age     IN    member.age%TYPE
)
IS
BEGIN
    INSERT INTO Member(userid, passwd, name, email, gender, city, age, flag)
    VALUES(v_userid, v_passwd, v_name, v_email, v_gender, v_city, v_age, 1);
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE sp_member_select
(
    v_userid    IN  member.userid%TYPE,
    member_record OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN member_record FOR
    SELECT name, email, gender, city, age, flag
    FROM Member
    WHERE userid = v_userid;
END;

CREATE OR REPLACE PROCEDURE sp_member_delete
(
    v_userid    IN  member.userid%TYPE
)
IS
BEGIN
    DELETE FROM Member
    WHERE userid = v_userid;
END;

CREATE OR REPLACE PROCEDURE sp_member_update
(
    v_userid    IN  member.userid%TYPE,
    v_email     IN  member.email%TYPE,
    v_city      IN  member.city%TYPE,
    v_age       IN  member.age%TYPE
)
AS
BEGIN
    UPDATE Member
    SET email = v_email, city = v_city, age = v_age
    WHERE userid = v_userid;
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE sp_member_select_all
(
  member_record OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN member_record FOR
    SELECT  userid ,name, email, gender, city, age
    FROM member;
END;

CREATE OR REPLACE PROCEDURE sp_member_idcheck
(
    v_userid    IN  member.userid%TYPE,
    member_record   OUT SYS_REFCURSOR
)
IS
BEGIN
    --��� ������ ���̵��� SELECT�� ����� NULL�̾���Ѵ�.
    OPEN member_record FOR
    SELECT userid
    FROM Member
    WHERE userid = v_userid;
END;


ALTER TABLE Member
ADD flag NUMBER(1)   DEFAULT 1 NOT NULL;

INSERT INTO Member(userid, passwd, name, email, gender, city, age, flag)
VALUES('admin','admin','������','admin@example.com','2', NULL, NULL, 0);

