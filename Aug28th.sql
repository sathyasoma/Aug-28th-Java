

/*

DDL:DATA DEFINITION LANG:( CREATE,RENAME,TRUNCATE,DROP ,ALTER)
DML:DATA MANIPULATION  LANG:(INSERT,UPDATE,DELETE)
DRL:DATA RETIRVAL LANG:(SELECT)
DCL;DAT CONTROL LANG:(GRANT,REVOKE)
TCL:TRANSACTION CONTROL LANG:(COMMIT,ROLBACK)




*/
create database aug28th;

use aug28th;



create table student(stid int(20),stname varchar(30),stmarks int);

describe student;

select * from student;


rename table student to sathya;


alter table student add column stadd varchar(20); /*--inserting new column--*/
alter table student rename column stid to rollnum;/*--rename old column--*/
alter table student modify column stadd varchar(50);/*--modify old column--*/
alter table student drop column stadd;/*--drop column--*/

drop table sathya;


insert into student values(123,'devaena',89);

insert into student value 
          (1023,'bahu',90),
           (575,'bali',34),
            (846,'goat',23),
             (274,'kik',98),
              (956,'remo',12);
              
select * from student;
select stid,stname,stmarks from student;

update student set stname='tiger' where stname='goat';
delete from student where stid=956;



use aug28th;

create table emp(empid int(5),empname varchar(30),empadd varchar(20));

/*--structure of the table*/
describe employee;
/*----updating table columns--->alter*/

alter table employee add column empadd varchar(10);
alter table employee rename column empsal to salary;
alter table employee modify column salary decimal(6,2);
alter table employee drop column salary;

/*renaming the table name */

rename table employee to emp;
describe emp;

/* drop the table from database*/

drop table emp;


/*------------------DML(INSERT,UPDATE,DELETE)=======================*/

insert into emp values(123,'devasena','kuntala');

describe emp;

select empid,empname,empadd from emp;
select empname from emp;
select * from emp;


insert into emp values
    (100,'ballala','mahishmathi'),
     (546,'kalakeya','no idea'),
      (197,'bahubali','mahishmathi'),
       (738,'rajmatha','hyd');


update emp set empadd='mahishmathi' where empid=738;

delete from emp where empname='kalakeya';

/*--------------TCL COMMIT ROLLBACK============*/

set autocommit=0;
insert into emp values(990,'vivek','hyd');
insert into emp values(991,'kaushal','goa');
insert into emp values(992,'karan','maharasta');
commit;

select * from emp;

rollback;
delete from emp where empid=991;

/*===============dcl-grant revcoke================*/

create role karthik_db;

grant insert,update,delete on aug28th.*  to 'karthik_db';
revoke insert,update,delete on aug28th.* from 'karthik_db';

create user 'karthik' identified by 'karthik123' default role 'karthik_db';

insert into emp values(100,'ballala','mahishmathi');

select * from emp;

/*=====================Constraints======================*/

create table emp1(empid int not null,empname varchar(20),empadd varchar(20));

describe emp1;
describe emp;

insert into emp1 values(123,'soma','hyd');
insert into emp1 values(null,'soma','hyd');
insert into emp1(empname,empadd) values('sathya','nlg');
select * from emp1;

alter table emp1 add constraint unique (empname);

select * from emp1;

insert into emp1(empname,empadd) values('soma','hyu');

create table emp2(
empid int primary key auto_increment,
empname varchar(20) not null,
empsal int default 1000,
empadd varchar(20) unique
);

insert into emp2(empname,empadd) values('sathya','hyd');
insert into emp2(empname,empsal,empadd) values('sathya',90000,'kpl');
select * from emp2;


