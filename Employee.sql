CREATE TABLE Empl(
empno int primary key NOT NULL,
ename varchar(30) NOT NULL,
job varchar(20) NOT NULL,
mgr varchar(10),
hiredate date NOT NULL,
sal float NOT NULL,
comm varchar(20),
deptno int NOT NULL
);

insert into Empl values(8369,'SMITH','CLERK',8902,'1990-12-18',800,'NULL',20);
INSERT INTO Empl values(8499,'ANYA','SALESMAN',8698,'1911-02-20',1600,'300',30);
INSERT INTO Empl values(8521,'SETH','SALESMAN',8698,'1991-02-22',1250,'500',30);
INSERT INTO Empl values(8566,'MAHADEVAN','MANAGER',8839,'1991-04-02',2985,'NULL',20);
INSERT INTO Empl values(8654,'MOMIN','SALESMAN',8698,'1991-09-28',1250,1400,30);
INSERT INTO Empl values(8698,'BINA','MANAGER',8839,'1991-05-01',2850,'NULL',30);
INSERT INTO Empl values(8882,'SHIVANSH','MANAGER',8839,'1991-06-09',2450,'NULL',10);
INSERT INTO Empl values(8888,'SCOTT','ANALYST',8566,'1992-12-09',3000,'NULL',20);
INSERT INTO Empl values(8839,'AMIR','PRESIDENT',NULL,'1991-11-18',5000,'NULL',10);
INSERT INTO Empl values(8844,'KULDEEP','SALESMAN',8698,'1991-09-08',1500,0.0,30);

DELETE FROM empl WHERE empno=8844;
-- 2. Write a query to display EName and Sal of employees whose salary are greater than
-- or equal to 2200?
SELECT ename,sal from Empl where sal>=2200;
-- 3. Write a query to display details of employs who are not getting commission?
SELECT * from Empl WHERE comm=NULL;
-- 4. Write a query to display employee name and salary of those employees who don’t have
-- their salary in range of 2500 to 4000?
SELECT ename,sal from empl where sal NOT between 2500 AND 4000;
-- 5. Write a query to display the name, job title and salary of employees who don’t have manager?
SELECT ename,job,sal from empl where job<>'manager';
-- 6. Write a query to display the name of employee whose name contains “A” as third alphabet?
SELECT ename from Empl where ename LIKE "__a%";

-- 7. Write a query to display the name of employee whose name contains “T” as last alphabet?
SELECT ename from Empl where ename LIKE "%T";
-- 8. Write a query to display the name of employee whose name contains ”M” as First and
-- “L” as third alphabet?
SELECT ename from Empl where ename LIKE "M%_L%";
-- 9. Write a query to display details of employs with the text “Not given”, if commission is null?
UPDATE Empl set comm='not given' where comm='null';