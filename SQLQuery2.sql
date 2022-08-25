use Assignments


create table Clients
(
Client_id numeric(4) primary key,
Cname varchar(40) NOT NULL,
Addres varchar(30),
Email varchar(30) unique,
Phone numeric(10),
Business varchar(20) NOT NULL
)
select * from Clients

create table Departments
(
Deptno numeric(2) primary key,
Dname varchar(15) NOT NULL,
Loc varchar(20)
)

create table Employees
(
Empno numeric(4) primary key,
Ename varchar(20) NOT NULL,
Job varchar(15),
Salary numeric(7) constraint positive check(Salary>0),
Deptno numeric(2) references Departments(Deptno)
)

create table Projects
(
Project_ID numeric(3) primary key,
Descr varchar(30) NOT NULL,
Start_Date DATE,
Planned_End_Date DATE,
Actual_End_Date DATE,
Budget numeric(10) constraint positivebug check(Budget>0),
Client_id numeric(4) references Clients(Client_id)
)
alter table Projects
add constraint dateChk check(Actual_End_Date > Planned_End_Date)

create table EmpProjectTasks
(
Project_ID numeric(3) primary key foreign key references Projects(Project_ID),
Empno numeric(4) foreign key references Employees(Empno),
Start_Date Date,
End_Date Date,
Task varchar(25) not null,
Status varchar(15) not null
)

insert into Clients values(1001,'ACME Utilities',' Noida','contact@acmeutil.com',9567880032,'Manufacturing')
select * from Clients