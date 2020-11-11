----------------------------------------------USER CREATE ON ORACLE
ALTER SESSION SET "_ORACLE_SCRIPT" = true;

CREATE USER sungjukmgmt
IDENTIFIED BY sungjukmgmt
DEFAULT tablespace USERS
TEMPORARY tablespace temp;

ALTER USER sungjukmgmt QUOTA UNLIMITED ON USERS;

GRANT resource, connect TO sungjukmgmt;
------------------------------------------------CREATE TABLE
CREATE TABLE Student
(
	hakbun		CHAR(7),
	name		VARCHAR2(20)		CONSTRAINT student_name_nn NOT NULL,
	kor			NUMBER(3)			CONSTRAINT student_kor_nn NOT NULL,
	eng			NUMBER(3)			CONSTRAINT student_eng_nn NOT NULL,
	mat			NUMBER(3)			CONSTRAINT student_mat_nn NOT NULL,
	tot			NUMBER(3),
	avg			NUMBER(5,2),
	grade		CHAR(1),
	CONSTRAINT student_hakbun_pk PRIMARY KEY(hakbun),
	CONSTRAINT student_kor_ck CHECK(kor BETWEEN 0 AND 100),
	CONSTRAINT student_eng_ck CHECK(eng BETWEEN 0 AND 100),
	CONSTRAINT student_mat_ck CHECK(mat BETWEEN 0 AND 100),
	CONSTRAINT student_grade_ck CHECK(grade IN ('A', 'B', 'C', 'D', 'F'))
)
------------------------------------------------CREATE STORED PROCEDURE: USING SQL DEVELOPER
CREATE OR REPLACE PROCEDURE SP_SELECT_ALL
(
	student_recode OUT SYS_REFCURSOR
)
AS
BEGIN
	OPEN student_recode FOR
	SELECT hakbun, name, kor, eng, mat
	FROM Student
	ORDER BY tot DESC;
END;

CREATE OR REPLACE PROCEDURE SP_STUDENT_INSERT
(
	hakbun      IN student.hakbun%Type,
    name        IN student.name%Type,
    kor         IN student.kor%Type,
    eng         IN student.eng%Type,
    mat         IN student.mat%Type
)
IS
    v_tot       student.tot%TYPE;
    v_avg       student.avg%TYPE;
    v_grade     student.grade%TYPE;
BEGIN
	v_tot := kor + eng + mat;
    v_avg := v_tot / 3;
    IF v_avg >= 90 AND v_avg < 100 THEN
        v_grade := 'A';
    ELSIF v_avg >= 80 THEN
        v_grade := 'B';
    ELSIF v_avg >= 70 THEN
        v_grade := 'C';
    ELSIF v_avg >= 60 THEN
        v_grade := 'D';
    ELSE
        v_grade := 'F';
    END IF;
    INSERT INTO Student 
    VALUES(hakbun, name, kor, eng, mat, v_tot, v_avg, v_grade);
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE SP_SELECT
(
    v_hakbun IN student.hakbun%TYPE,
    student_record OUT SYS_REFCURSOR --�븰踰덉뿉 �빐�떦�븯�뒗 �븰�깮�쓣 �꽆湲대떎.
)
AS
BEGIN
    OPEN student_record FOR 
    SELECT *
    FROM Student 
    WHERE hakbun = v_hakbun;
END;

CREATE OR REPLACE PROCEDURE SP_DELETE
(
    v_hakbun IN student.hakbun%TYPE
)
IS
BEGIN
  DELETE FROM Student
  WHERE hakbun = v_hakbun;
  COMMIT;
END;

create or replace NONEDITIONABLE PROCEDURE SP_UPDATE
(
    v_hakbun   IN   Student.hakbun%Type,
    v_kor      IN   Student.kor%Type,
    v_eng      IN   Student.eng%Type,
    v_mat      IN   Student.mat%Type
)
IS
    v_tot       Student.tot%Type;
    v_avg       Student.avg%Type;
    v_grade     Student.grade%Type;
BEGIN
    v_tot := v_kor + v_eng + v_mat;
    v_avg := v_tot / 3;
    IF v_avg >= 90 AND v_avg < 100 THEN
        v_grade := 'A';
    ELSIF v_avg >= 80 THEN
        v_grade := 'B';
    ELSIF v_avg >= 70 THEN
        v_grade := 'C';
    ELSIF v_avg >= 60 THEN
        v_grade := 'D';
    ELSE
        v_grade := 'F';
    END IF;
    UPDATE Student
    SET kor = v_kor, eng = v_eng, mat = v_mat, tot = v_tot, avg = v_avg, grade = v_grade
    WHERE hakbun = v_hakbun;
    COMMIT;
END;