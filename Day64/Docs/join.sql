SELECT empno, ename, sal, dname, loc, emp.deptno
FROM emp INNER JOIN dept ON(emp.deptno = dept.deptno); 
/*
Natural join, join using에는 식별자를 사용하지 않지만
join on은 식별자를 사용해야한다.
*/