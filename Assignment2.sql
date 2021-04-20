use training21; 
-- 1
select * from emp;
-- 2
select DISTINCT JOB from emp;
-- 3
select ENAME,SAL from emp ORDER BY SAL;
-- 4
select * from emp
ORDER BY DEPTNO ASC,SAL DESC;
-- 5
select DISTINCT JOB from emp ORDER BY JOB DESC;
-- 6
select * from emp WHERE JOB= 'MANAGER';
-- 7
select ENAME,HIREDATE from emp
WHERE year(HIREDATE)<1981;
-- 8
select EMPNO, ENAME,SAL,COMM,(SAL+ifnull(comm,0)) AS TOTALSAL,((SAL+ifnull(comm,0))/30) AS DAILYSAL ,((SAL+ifnull(comm,0))*12) AS ANNSAL
from emp ORDER BY ANNSAL;
-- 9
select EMPNO,ENAME,JOB,HIREDATE, YEAR(NOW())-YEAR(HIREDATE)AS EXP from emp
WHERE JOB='MANAGER';
-- 10
select EMPNO,ENAME,SAL,YEAR(NOW())-YEAR(HIREDATE)AS EXP from emp WHERE MGR='7369';
select EMPNO,ENAME,SAL,YEAR(NOW())-YEAR(HIREDATE)AS EXP from emp WHERE EMPNO IN(select EMPNO from emp WHERE MGR='7369');
select * from emp;
-- 11
select * from emp WHERE ifnull(COMM,0)>SAL;
-- 13
select EMPNO,ENAME,YEAR(NOW())-YEAR(HIREDATE) AS EXP,((SAL+ifnull(comm,0))/30) AS DAILYSAL from emp 
WHERE ((SAL+ifnull(comm,0))/30) >100;
-- 14
select * from emp WHERE JOB IN('CLERK','ANALYST') ORDER BY JOB DESC;
-- 15
select * from emp WHERE HIREDATE IN('1981-05-01','1981-12-03','1981-12-17','1980-01-19') ORDER BY HIREDATE;
-- 16
select * from emp WHERE DEPTNO IN ('10','20');
-- 17
select * from emp WHERE YEAR(HIREDATE)=1981;
-- select * from emp;
-- 19
 select ENAME, SAL*12 AS ANNSAL from emp WHERE SAL*12 BETWEEN 22000 AND 45000;
 select ENAME, ((SAL+ifnull(comm,0))*12) AS ANNSAL from emp WHERE ((SAL+ifnull(comm,0))*12) BETWEEN 22000 AND 45000;
 -- 20
 select ENAME from emp WHERE length(ENAME)=5;
 -- 21
 select ENAME from emp WHERE ENAME LIKE 'S%' AND length(ENAME)=5;
 -- 22
 select ENAME from emp WHERE ENAME LIKE '__r_';
 select * from emp;
 -- 23
 select ENAME from emp WHERE ENAME LIKE 'S%H' AND length(ENAME)=5;
 -- 24
 select ENAME,HIREDATE from emp WHERE MONTH(HIREDATE)=01;
 -- 27
 select ENAME from emp WHERE ENAME LIKE '%ll%';
 -- 29
 select ENAME,DEPTNO from emp WHERE DEPTNO!=20;
 -- 30
 select * from emp WHERE JOB NOT IN('PRESIDENT','MANAGER') ORDER BY SAL;
 -- 31
 select ENAME,EMPNO from emp WHERE EMPNO NOT LIKE '78%';
 -- 33
 select * from emp WHERE MGR IS NOT NULL;
 -- 34
 select ENAME,HIREDATE from emp WHERE MONTH(HIREDATE)!=03;
 -- 35
 select * from emp WHERE JOB='CLERK' AND DEPTNO=20;
 -- 36
 select DEPTNO,ENAME from emp
WHERE DEPTNO IN(30,10) AND YEAR(HIREDATE)=1981;
-- 37
select * from emp WHERE ENAME= 'SMITH';
-- 38
select * from dept;
select * from emp;
select a.loc,b.ENAME from dept a,emp b
WHERE a.deptno=b.DEPTNO AND b.ENAME='SMITH';
-- MANAGER TABLE
create table MANAGER (
MGRID INT NOT NULL PRIMARY KEY,
)