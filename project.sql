create database project;
show databases;
use lab1;
create table Admin_Dept(
Admin_ID int(5) primary key,
NAME varchar(20) not null,
Designation varchar(20) not null,
qualification varchar(10) not null,
email varchar(20) not null,
phone int(10) not null,
salary int(5));
select * from Admin_Dept;
create table student(
s_roll_no int(5)  primary key,
s_name varchar(20),
class int(2),
section varchar(2), 
fees varchar(10));
select * from student;
Create table parent(
roll_num int(5) references student(s_roll_no),
P_name varchar(100),
p_Ph_No int(10),
p_occupation varchar(10),
primary key(P_name,roll_num));
select * from parent;
Create table subjects(
Sub_id varchar(10) primary key,
sub_Name varchar(100),
Total int(50));
select * from subjects;
create table Teacher(
t_id varchar(10) primary key,
t_name varchar(20),
t_Qualification varchar(10),
t_salary int(8),
class_taken varchar(5),
t_ph_num int(10),
Admin_id int(5),
Sub_id varchar(10),
constraint teacher_adid_fk foreign key(Admin_id) references Admin_Dept(Admin_ID),
constraint teacher_sid_fk foreign key(Sub_id) references subjects(Sub_id));
select * from teacher;
Create table Class(
Std_sec varchar(5) primary key,
Admin_ID int(5),
t_id varchar(10),
strength int(10),
Constraint cl_ad_fk foreign key(Admin_ID) references Admin_Dept(Admin_ID),
CONSTRAINT C_T_FK foreign key(t_id) references Teacher(t_id));
select * from class;
Create table Homework(
H_id varchar(10) primary key,
Sub_assign varchar(10),
T_ID varchar(10),
Due_date date,
No_of_stu int(3),
Constraint hw_fk foreign key(T_ID) references teacher(t_id));
select * from homework;
Create table Exam(
Ex_code varchar(10) primary key,
Ex_sub varchar(10),
Ex_date date,
Ex_qpaper varchar(20),
T_ID varchar(10),
Constraint ex_fk foreign key(T_ID) references teacher(t_id));
select * from exam;
Create table marks(
Paper_No varchar(10)primary key,
Marks_ob int(3),
Tot_mark int(3),
Subject varchar(100),
T_ID varchar(10),
Roll_No int(5),
Constraint mk_fk1 foreign key(T_ID) references teacher(t_id),
Constraint mk_fk2 foreign key(Roll_No) references student(s_roll_no));
select * from marks;
INSERT INTO ADMIN_DEPT values(00001,'gagan','PRINCIPAL','PhD Chem','gagan@gmail.com',868845646,20000);
INSERT INTO ADMIN_DEPT VALUES(00002,'jatin','HEADMASTER','PhD Hist','jatin@gmail.com',991234239,15000);
INSERT INTO ADMIN_DEPT VALUES(00003,'cherith','COORDINATOR A','BScMat','cherith@gmail.com',817988095,10000);
INSERT INTO ADMIN_DEPT VALUES(00004,'rasheed','COORDINATOR B','BTechCS','rasheed@gmail.com',949109038,10000);
select * from ADMIN_DEPT;
INSERT INTO student VALUES(26,'Sree',11,'A','PAID');
INSERT INTO student VALUES(12,'Uday',12,'A','PAID');
INSERT INTO student VALUES(14,'Sahasra',10,'A','PAID');
INSERT INTO student VALUES(25,'Kedar',12,'F','NOTPAID');
INSERT INTO student VALUES(21,'Akhil',12,'C','LOAN');
INSERT INTO student VALUES(05,'Abhijeet',11,'A','NOTPAID');
select * from student;
INSERT INTO PARENT VALUES(14,'BadriNath',986600646,'doctor');
INSERT INTO PARENT VALUES(12,'Lakshmi',989809099,'soldier');
INSERT INTO PARENT VALUES(21,'Raghuram',898989899,'dancer');
INSERT INTO PARENT VALUES(25,'Narayana rao',970970070,'postman');
INSERT INTO PARENT VALUES(05,'Koteswar Rao',900908090,'police');
INSERT INTO PARENT VALUES(26,'Kusuma',908099099,'architect'); 
select * from parent;
INSERT INTO SUBJECTS VALUES('PHY1001','Introduction to Physics',70);
INSERT INTO SUBJECTS VALUES('CHY1001','Introduction to Chemistry',35);
INSERT INTO SUBJECTS VALUES('ITE1003','DBMS',80);
INSERT INTO SUBJECTS VALUES('ITE2002','OS',75);
INSERT INTO SUBJECTS VALUES('ITE1014','HCI',70);
select * from subjects;
INSERT INTO TEACHER VALUES('PMT001','RoySantiago','BSc',40000,'CL001',676767676,3,'PHY1001');
INSERT INTO TEACHER VALUES('TMP002','DineshKumar','BA',3500,'CL018',898989899,4,'CHY1001');
INSERT INTO TEACHER VALUES('PMT003','BimalKumar','BSc',4000,'CL120',787878778,2,'ITE1003');
INSERT INTO TEACHER VALUES('TMP004','Vijayan','BA',3500,'CL121',868686866,1,'ITE2002');
INSERT INTO TEACHER VALUES('PMT005','ReshmaThomas','BSc',2500,'CL102',979769769,4,'ITE1014');
SELECT * from teacher;
INSERT INTO CLASS VALUES('12A',3,'PMT001',33);
INSERT INTO CLASS VALUES('12C',4,'TMP002',28);
INSERT INTO CLASS VALUES('12F',2,'PMT003',32);
INSERT INTO CLASS VALUES('11A',1,'TMP004',30);
INSERT INTO CLASS VALUES('11F',3,'PMT005',28); 
select * from class;
INSERT INTO HOMEWORK VALUES('HW1001','DBMS','PMT003',DATE'2021-12-08',33);
INSERT INTO HOMEWORK VALUES('HW1002','HCI','PMT005',DATE'2021-12-06',50);
INSERT INTO HOMEWORK VALUES('HW1003','OS','TMP004',DATE'2021-12-29',25);
INSERT INTO HOMEWORK VALUES('HW1004','DBMS','PMT003',DATE'2021-11-25',33);
INSERT INTO HOMEWORK VALUES('HW1005','CHEM','TMP002',DATE'2021-12-20',28);
select * from homework;
INSERT INTO EXAM VALUES('EXM001','PHY',DATE'2021-12-08','qpaper1.docx','PMT001');
INSERT INTO EXAM VALUES('EXM002','CHEM',DATE'2021-12-07','qpaper2.docx','TMP002');
INSERT INTO EXAM VALUES('EXM003','HCI',DATE'2021-12-05','qpaper3.docx','PMT005');
INSERT INTO EXAM VALUES('EXM004','OS',DATE'2021-12-04','qpaper4.docx','TMP004');
INSERT INTO EXAM VALUES('EXM005','DBMS',DATE'2021-12-03','qpaper5.docx','PMT003');
select * from exam;
INSERT INTO MARKS VALUES('SL001',98,100,'PHYSICS','PMT001',14);
INSERT INTO MARKS VALUES('SL002',97,100,'PHYSICS','PMT001',26);
INSERT INTO MARKS VALUES('SL003',94,100,'PHYSICS','PMT001',12);
INSERT INTO MARKS VALUES('SL004',92,100,'CHEMISTRY','TMP002',14);
INSERT INTO MARKS VALUES('SL005',90,100,'CHEMISTRY','TMP002',26);
select * from marks;
alter table marks add std_name varchar(20);
select * from marks;
alter table student add p_name varchar(20);
select * from student;
alter table student drop COLUMN p_name;
ALTER TABLE marks MODIFY COLUMN marks_ob varchar(10);
ALTER TABLE marks MODIFY COLUMN marks_ob int(3);
select * from marks;
update parent set p_Ph_No=957722488 where roll_num=14;
select * from parent;
UPDATE `lab1`.`parent` SET `p_Ph_No` = '957722488' WHERE (`P_name` = 'BadriNath') and (`roll_num` = '14');
select * from parent;
select * from marks;
update `marks` set `marks_ob`='91' where `paper_no`='SL001';
select * from marks;
select * from exam;
update `exam` set `Ex_qpaper`='qpaperx.docx' where `Ex_code`='EXM004';
select * from exam;
select * from student;
delete from student where  s_roll_no=25;
select * from student;
select * from homework;
select * from subjects;
delete from homework where h_id='hw1005'; 
DELETE FROM `lab1`.`subjects` WHERE (`Sub_id` = 'CHY1001');
delete from subjects where sub_id='chy1001';
DELETE FROM subjects WHERE Sub_name = 'Introduction to chemistry';
select * from exam;
delete from exam where Ex_code='exm004';
select * from marks;
select std_name,marks_ob from marks where marks_ob > 91;
select * from admin_dept;
select admin_id,name from admin_dept where qualification='bscmat';
select * from student;
select s_roll_no,s_name from student where fees='loan';
select * from  student;
select * from student order by class;
select * from teacher;
select * from teacher order by admin_id;
select * from marks;
select * from marks order by marks_ob;
select * from parent;
SELECT * FROM parent WHERE P_name LIKE 'K_%';
select * from admin_dept;
select * from admin_dept where designation like'%l';
select * from homework;
select * from homework where sub_assign like 'd%s';
select * from subjects;
select * from subjects where total is null;
select * from teacher where t_name is not null;
select * from class where std_sec is null;
select * from marks;
select avg(marks_ob),paper_no,std_name,roll_no from marks group by std_name having roll_no>12;
select * from student;
select count(fees),s_name,fees from student group by s_roll_no having s_name like 's%';
select * from class;
select avg(strength),admin_id from class group by admin_id having admin_id>1;
select count(strength) from class;
select avg(marks_ob) from marks;
select max(t_salary),t_name from teacher;
select min(salary) from admin_dept;
select * from marks;
select sum(marks_ob),subject from marks group by subject;
select ascii(subject),subject from marks;
select char_length(s_name),s_name from student;
select concat_ws('-',p_name,p_occupation) ,p_name,p_occupation from parent;
select lcase(p_name),p_name from parent;
select lpad(s_name,'8','$'),s_name from student;
select cos(marks_ob),marks_ob,std_name from marks;
select degrees(marks_ob),marks_ob,std_name from marks;
select log(marks_ob) , marks_ob,std_name from marks;
select * from homework;
select * from exam;
select now(),ex_date,ex_sub from exam;
select current_timestamp(),ex_date,ex_sub from exam;
SELECT sub_assign, DATE(due_date) AS due_date FROM homework;
SELECT sub_assign, extract(day from due_date) AS due_date FROM homework;
select current_time(),due_date,sub_assign from homework;

select s_roll_no,s_name,class,section,subject,paper_no,marks_ob,t.t_id,t_name,class_taken,t_ph_num,fees from student s inner join 
marks m on s.s_roll_no = m.Roll_No inner join teacher t on m.T_ID = t.t_id;