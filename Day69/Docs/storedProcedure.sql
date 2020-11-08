#mySQL의 Stored Procedure
SELECT * FROM emp;
#mySQL이라도 비표준 조인은 가능하다.
SELECT empno, ename, job, dname, loc
FROM emp e, dept d
WHERE e.deptno = d.deptno;
#하지만 표준 조인을 권장한다.
SELECT empno, ename, job, dname, loc
FROM emp e INNER JOIN dept d ON e.deptno = d.deptno;


####Stored Procedure on mySQL####
##delimiter: 구분자를 지정한다.
## ;은 한 문장의 구분자이고
## Procredure의 최종 구분자는 $$
delimiter $$
CREATE PROCEDURE sp_test()
BEGIN 
	SELECT empno, ename, job, dname, loc
	FROM emp e INNER JOIN dept d ON e.deptno = d.deptno;
END$$
#근데 계속 $$를 사용해야 하니까끝나면 다시 delimiter를  ;로 맞춘다.
delimiter ;

#Procedure 실행: call
CALL sp_test();
#Procdure 삭제: drop procedure
DROP PROCEDURE sp_test;
#Procedure 수정: 지우고 새로 만들어라, 수정은 비권장

#Procedure: How to Use Paramter
delimiter $$
CREATE PROCEDURE sp_test(v_deptno INT)
BEGIN 
	SELECT empno, ename, job, d.deptno, dname, loc
	FROM emp e INNER JOIN dept d ON e.deptno = d.deptno
	WHERE e.DEPTNO = v_deptno;
END$$
delimiter ;
CALL sp_test(30);