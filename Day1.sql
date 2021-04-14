-- use mysql;
-- create database training22;
-- use training22;
-- drop database training22;
-- use training21;
-- create employee table--> department
 create table dept(
 deptno int not null, 
 dname varchar(20) not null,
loc varchar(30) not null);
-- drop and create apply primary key on column
drop table dept;
 create table dept(
 deptno int not null primary key, 
 dname varchar(20) not null,
loc varchar(30) not null);
-- DDL DML MANIPULATION Insert/Update/Delete
 INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES', 'CHICAGO');
 INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

select * from dept;

 CREATE TABLE EMP
(
 EMPNO int NOT NULL ,
 ENAME VARCHAR(20),
  JOB VARCHAR(9),
   MGR int ,
    HIREDATE DATETIME,
    SAL NUmeric(7, 2),
    COMM Numeric(7, 2),
    DEPTNO int 
 );
 -- EMPNO-->PRIMARY KEY
 alter table emp
 add constraint PK_EMPNO primary key(empno);
 -- DEPTNO-->FOREIGN KEY
 alter table emp
 add foreign key(deptno) references dept(deptno);
 -- mgr-->foreign key 
 alter table emp
 add foreign key(mgr) references emp(empno);
 
 INSERT INTO EMP VALUES   (7839, 'KING',   'PRESIDENT', NULL,    str_to_date('11/17/1981','%m/%d/%Y') , 5000, NULL, null);   
INSERT INTO EMP VALUES   (7566, 'JONES',  'MANAGER',   		7839, str_to_date('04/2/1981'	,'%m/%d/%Y'),  2975, NULL, 20);
INSERT INTO EMP VALUES   (7698, 'BLAKE',  'MANAGER',   		7839, str_to_date('05/01/1981'	,'%m/%d/%Y'),  2850, NULL, 30);
INSERT INTO EMP VALUES   (7782, 'CLARK',  'MANAGER',   		7839, str_to_date('06/09/1981'	,'%m/%d/%Y'),  2450, NULL, 10);
INSERT INTO EMP VALUES   (7999, 'RAHUL_DRAVID', 'MANAGER',  7839, str_to_date('01/01/2011'  ,'%m/%d/%Y'), 4000, NULL, 10);
INSERT INTO EMP VALUES   (7788, 'SCOTT',  'ANALYST',   		7566, str_to_date('12/09/1982'  ,'%m/%d/%Y'), 3000, NULL, 20);
INSERT INTO EMP VALUES   (7902, 'FORD',   'ANALYST',   		7566, str_to_date('12/03/1981'  ,'%m/%d/%Y'),  3000, NULL, 20);
INSERT INTO EMP VALUES   (7499, 'ALLEN',  'SALESMAN',  		7698, str_to_date('02/20/1981'  ,'%m/%d/%Y'), 1600,  300, 30);
INSERT INTO EMP VALUES   (7521, 'WARD',   'SALESMAN',  		7698, str_to_date('02/22/1981'  ,'%m/%d/%Y'), 1250,  500, 30);
INSERT INTO EMP VALUES   (7654, 'MARTIN', 'SALESMAN',  		7698, str_to_date('09/28/1981'  ,'%m/%d/%Y'), 1250, 1400, 30);
INSERT INTO EMP VALUES   (7844, 'TURNER', 'SALESMAN',  		7698, str_to_date('09/08/1981'  ,'%m/%d/%Y'),  1500,    0, 30);
INSERT INTO EMP VALUES   (7900, 'JAMES',  'CLERK',			7698, str_to_date('12/03/1981'  ,'%m/%d/%Y'),   950, NULL, 30);
INSERT INTO EMP VALUES   (7369, 'SMITH',  'CLERK',			7902, str_to_date('12/17/1980'  ,'%m/%d/%Y'), 800, NULL, 20);
INSERT INTO EMP VALUES   (7876, 'ADAMS',  'CLERK',			7788, str_to_date('01/12/2003'  ,'%m/%d/%Y'), 1100, NULL, 20);
INSERT INTO EMP VALUES   (7934, 'MILLER', 'CLERK',			7782, str_to_date('01/23/2002'  ,'%m/%d/%Y'), 1300, NULL, 10);
INSERT INTO EMP VALUES   (7901, 'RAHUL_DRAVID', 'MANAGER',  7839, str_to_date('01/23/2012'  ,'%m/%d/%Y'), 3000, NULL, 10);

select * from emp;
-- 1.
select * from emp WHERE JOB="MANAGER";
-- 2.
select * from emp WHERE JOB IN ('MANAGER','ANALYST','CLERK');
-- 3.
select * from emp WHERE SAL BETWEEN 3000 AND 5000;
-- 4.
select * from emp WHERE JOB IN('MANAGER','ANALYST','CLERK') AND SAL BETWEEN 3000 AND 5000;
-- 5
select * from emp WHERE COMM IS NOT NULL AND COMM!=0;
-- 6
select * from emp WHERE COMM IS NOT NULL;
-- 7
select * from emp WHERE ENAME LIKE 'S%';
-- 8
select * from emp WHERE ENAME LIKE '%R';
-- 9
select * from emp WHERE ENAME LIKE '%A%';
-- 10
select * from emp WHERE ENAME LIKE '_A%';
-- 11
select * from emp WHERE ENAME LIKE 'M%' OR '%S';
-- 12
-- select * from emp WHERE ENAME BETWEEN 'A' AND 'M';
-- select * from emp WHERE ENAME BETWEEN 'A%' AND 'M%';
select * from emp WHERE ENAME REGEXP '^[A-M]';
-- 13
-- select ENAME from emp WHERE ENAME LIKE '%_%'; THIS IS WRONG
select ENAME from emp WHERE ENAME REGEXP '_';
-- 14
select * from emp WHERE JOB='MANAGER' AND DEPTNO IN('10','20') OR JOB='CLERK' AND DEPTNO='30';
-- 15
select ENAME, SAL ,(SAL*10/100) AS BONUS FROM emp;
-- 16
select * from emp ORDER BY ENAME;
-- 17
select * from emp ORDER BY SAL DESC;
-- 18
select EMPNO,ENAME,DEPTNO,SAL from emp  ORDER BY DEPTNO , SAL DESC;
-- 19
select ENAME,SAL from emp ORDER BY SAL DESC LIMIT 3;
-- 20
-- IT WAS MISPRINT
-- 21
select EMPNO,ENAME,DEPTNO,SAL,
RANK() OVER(
partition by DEPTNO ORDER BY SAL DESC ) AS 'RANK' FROM emp;
-- 22
select EMPNO,ENAME,DEPTNO,SAL,
DENSE_RANK() OVER(
partition by DEPTNO ORDER BY SAL DESC ) AS 'RANK' FROM emp;

-- 23
select DISTINCT JOB FROM emp;
-- 24
select sum(SAL) AS TOTAL_ORG_SAL from emp;
-- 25
select DEPTNO,sum(SAL) AS TOTAL_DEPT_SAL from emp GROUP BY DEPTNO;
-- 26
select JOB,COUNT(*) AS EMP_COUNT from emp GROUP BY JOB;
-- 27
select * from emp WHERE MONTH(HIREDATE)=2;
-- 28
select count(*) AS EMP_COUNT from emp WHERE HIREDATE BETWEEN '1981-01-01' AND '1983-01-01';
-- 29
select ENAME,YEAR(NOW())-YEAR(HIREDATE) AS TENURE from emp ORDER BY TENURE;