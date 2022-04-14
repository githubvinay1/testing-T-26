use vinay;

--------------------union all    it is jion a no. of rows from two or more table
------diffrence in union and joint is union join rows and joint join column

create table student01(                    ------------no. of column must be same
s_rollno int,
s_name varchar(40),
s_dob date,
s_mailid varchar(30)); 
select * from student01 
insert into student01 values (10,'shunham','10/20/1990','shubham@gmail.com'); 
insert into student01 values (50,'vinay','5/20/1990','vinay@gmail.com')
select * from student01; 
insert into student01 values (20,'bhau','11/20/1990','bhau@gmail.com');  
select * from student01;  

create table student02(
s_rollno int,
s_name varchar(40),
s_dob date,
s_mailid varchar(30)); 
select * from student02
insert into student02 values (50,'vinay','05/20/1990','vinay@gmail.com'); 
select * from student02; 
insert into student02 values (100,'kamlesh','07/20/1990','kamles@gmail.com');  
select * from student02;  

select * from student01 ---------sagle column and row yete result madhe
union all
select * from student02   

select * from student01 -----------je same row ahe te ekach da show hote
union
select * from student02  

select s_name from student01 
union 
select s_mailid from student02 

select s_name as deptname from student01               ---          deptname= duplicae name for a column.....
union 
select s_mailid from student02  
----------------------------------------------------------------------------------------------------------------------------------------------------------------- 
-----search a name in table staring from A
create table searchtable(
s_rollno int,
s_name varchar(40),
s_dob date,
s_mailid varchar(30)); 
insert into searchtable values (10,'vinay','05/20/1990','vinay@gmail.com'); 
insert into searchtable values (20,'kamlesh','05/20/1990','vinay@gmail.com'); 
select * from searchtable; 

select s_name from searchtable where s_name like 'V%%%%___' 
select s_name from searchtable where s_name like 'K%%%%___'
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----indexing = fast serching..to fast access the record..only they gives result fast we dont use in quary.
use=goto object explorer , then goto database , then goto our database , then goto table , then goto table and goto indeses , then right click on indexex,
select new index ,cluster index , then add any column whoose values or name is unique , then ok and ok ...then create a new index. this only help us for fast access. 
cluster index aseednding order desending order sort out sequence madhe aste. 
non cluster = sequence madhe naste data.
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
comand fuction  clasofication of statements
         ddl=data defination launguge.
drcat=(drop,rename,create,alter,truncate)   statement. 
         dml=(data manipulation launguge)
diu=(delete,insert,update)    statement. 
         dcl=(data control launguge) 
rg=(revoke,grant)     statement. 
          dql=(data querry language)
s=(select)   statement. 
         tcl=(transaction control launguage) 
crs=(commit,rollback,savepoint) statement. 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
function  
-----this is agregate function
          ----- systym defined fuction 
(-----aggeration : sum ,count.min,max,first,last )
select count(*) from college where dept_id>01; 
select max(1) from college where dept_id=1;  
select min (1) from college where dept_id=5; 
select sum(1) from college where dept_type='ele'; 
select upper(dept_head) from college; 
select lower(dept_head) from college; 
   -----       scalar function 
(u case, l case,mid,round) 
   -----       user defined function  
create function fun_name() returns data_type as begin statement end go    -----    function is the building blog of statements which perform a specific task there
                                                                          ------     are three type system,scaler,user defined 
create table ordered(
ord_id int,
ord_name varchar(20),
ord_mob bigint,
ord_mailid varchar(20));
insert into ordered values (151,'abcd',74941165,'abcd@gmail.com');
insert into ordered values (102,'shubham',74941154,'efgh@gmail.com');
insert into ordered values (103,'ijkl',74964715,'ijkl@gmail.com');
insert into ordered values (104,'mnop',74416191,'mnop@gmail.com');  
select * from ordered; 

create function my_function()
returns table 
as
return (select ord_name from ordered where ord_id=102) 
go
select * from my_function(); 

create function my_functions()
returns table 
as 
return ( select ord_name from ordered) 
go 
select * from my_functions(); 

alter function my_function()
returns table 
as 
return (select * from ordered)
go  
select * from my_function();

alter function my_function() 
returns table 
as 
return (select ord_mailid from ordered where ord_id between 100 and 200) 
go 
select * from my_function(); 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
scaler value/ single value pass tecnique or multi value or inline function

-----single value function 

create table employ( 
emp_id int,
emp_name varchar(20),
emp_dept varchar(20),
emp_salary decimal,
emp_age int,
emp_city varchar(20)); 
insert into employ values (101,'abhi','mech',10000.00,20,'amravati');
insert into employ values (102,'shubham','civil',15000.00,21,'pune');
insert into employ values (103,'vinay','cse',20000.00,21,'pune');
insert into employ values (104,'pratik','it',25000.00,20,'amravati');
insert into employ values (105,'kamlesh','civil',30000.00,21,'pune'); 
select * from employ;
---EXAMPLE 
create function newinline (@vinay varchar(20))
returns table 
as 
return (select * from employ where emp_city=@vinay)
go 
select * from dbo.newinline ('pune') 

create function inline_fun (@str varchar(20)) 
returns table 
as  
return (select * from employ where emp_name =@str) 
go
select * from dbo.inline_fun('pratik');  
---EXAMPLE
create function inline_func (@abc int) 
returns table 
as  
return (select * from employ where emp_age=@abc) 
go
select * from dbo.inline_func(21) where emp_salary=15000;  

-------multivalue function

create function multivalue_fun(@id int, @value decimal) 
returns table 
as 
return(select emp_name,emp_city,emp_dept from employ where emp_id=@id and emp_salary=@value) 
go
select * from dbo.multivalue_fun(101,10000.00);

--------EXAMPLE

create function multivalue_funct(@id varchar(20), @value decimal) 
returns table 
as 
return(select emp_name,emp_city,emp_dept from employ where emp_name=@id and emp_salary=@value) 
go
select * from dbo.multivalue_funct('shubham',15000.00);

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ---order by ==== sequence nusar lavne 
  
  select * from student; 

  select * from student order by stu_age asc;
  select * from student order by stu_age desc;
  select stu_name from student order by stu_id asc;  

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
aggregate fuction sobat where use nai karne having use karne     ex. sum vagere kartana. 

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
use= row la no. dene                               ----------       how to findout duplicates record in table\how to give the uniqe no. to the record

create table employ1( 
emp_id int,
emp_name varchar(20),
emp_dept varchar(20),
emp_salary decimal,
emp_age int,
emp_city varchar(20)); 
insert into employ1 values (101,'abhi','mech',10000.00,20,'amravati');
insert into employ1 values (102,'shubham','civil',15000.00,18,'pune');
insert into employ1 values (103,'vinay','cse',20000.00,15,'pune');
insert into employ1 values (104,'pratik','it',25000.00,10,'amravati');
insert into employ1 values (104,'pratik','it',30000.00,12,'pune'); 
select * from employ1; 

select emp_name,emp_dept,emp_salary,emp_city, ROW_NUMBER()                     -------give a ROW NUMBER to each row
over 
(order by emp_age) as rowno from employ1;

select emp_name,emp_dept, ROW_NUMBER()                                     ---------show duplicae value like duplicate1,duplicate2
over 
(partition by emp_name,emp_dept order by emp_age asc) as rowno from employ1; 

select emp_name,emp_dept,RANK()                 -----------------show duplicate value 
over
(order by emp_age)as rowno from employ1; 

select emp_name,emp_dept,DENSE_RANK()   ---------------------------show output by default rank ,rank baground la run hote pan ikde same dakhavte
over 
(order by emp_age) as rowno from employ1;

select emp_name ,ROW_NUMBER() over (order by emp_age) as rowno from employ1;   --------row no to row as per age order

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------building function
select REVERSE (emp_name) from employ1; 
select right (emp_name,2) from employ1;  
select left (emp_name,2) from employ1;
select datalength (emp_name) from employ1; -------show lenght or number of character
select replace (emp_name,'pratik','shreyash') as replac from employ1; 
select soundex (emp_name) as sound from employ1; ---------------sound of name 
select space (1) as spl from employ1; ----------show space in the name 
select str (emp_name) from employ1; 
select substring ((emp_name) ,2,3) from employ1; -----2 pasun chalu hote,3min somorche character pahije 
select substring ((emp_name),2,4) from employ1; 
select replace (emp_name,'','')from employ1; 
select stuff (emp_name,2,3,'am')from employ1;----adding the nabe betweein the word
select space (10); 
select 'vinay' +space(2)+'gulhane' full_name from employ1 order by emp_age; 
select count (space(2))from employ1; 
select str(9) from employ1; 
select ltrim('   hellow'+space(0)+'world   ') as rtri; ---remove the space side 
select str (45.47,4,2) as avl;---alias round krun sangte 2=45 4=all values 
select nchar (122);   ------upperletter-65-A    90-Z asya value dilelya ahet yaat purn alfabates la 
select nchar(90);    ----------lowerletter 97-a   122-z  

select QUOTENAME('kam_lesh','""'); -----------add the delimwter='"/{[
select QUOTENAME('shubham',''); --------[]
select QUOTENAME('pratik',' ');---------null 
select QUOTENAME ( 'vinay','{}[]'); 
select patindex ('%tik%','pratik');-------possition of pattern in the string 
select replicate('shu',6) as repli from employ1;---------ruplicate the number of times in the column 
select difference ('shu','bham'); -------diffrence of sound value
select soundex('shu');
select unicode('pratik')as unisex;-------unicode ascii value 
select ascii (emp_name)as asci from employ1;--uppercase - hash function=h()
select charindex ('pratik','t')as charind;
declare @d datetime ='10/5/21';
select('@d','d','india')as indian;

------------date finction 

select getdate () as d1;-------show time date at minisecond 
select datepart (YYYY,getdate()) as date; 
select datepart (YY, getdate()) as date; 
select datepart (QQ, getdate()) as date; --------3 month=1corter
select datepart (HH, getdate()) as date;
select datepart (SS, getdate ()) as date; 
select datepart (NS, getdate()) as date; 
-----same as above  convert
select getdate () as d1,-------show time date at minisecond 
 datepart (YYYY,getdate()) as date, 
 datepart (YY, getdate()) as date, 
 datepart (QQ, getdate()) as date, --------3 month=1corter
 datepart (HH, getdate()) as date,
 datepart (SS, getdate ()) as date,
 datepart (NS, getdate()) as date;  
--------------convert 
select convert (varchar(19),getdate())as date; -------------------no.=country code
select convert (varchar(10),getdate(),7)as date;
select convert (varchar(10),getdate(),110)as date;
select convert (varchar(10),getdate(),6)as date;
select convert (varchar(10),getdate())as date;
select convert (varchar(10),'2020/21/7')as date;  
--------------time
select day ('7/21/2021'), select datepart (mm,'10/26/2021') as dpart; 
select month ('10/20/2021') as months,year ('10/20/2021') as yr; 
select datename ('10/20/2021') as date; 
select dateadd (day,2,'10/20/2021') as date;
select dateadd (month,2,'10/20/2021') as date;
select datediff (day,'10/21/1990','11/20/1990') as date; 
select convert (varchar(20), ('10/20/2021'),103 as date;  
select year (1990); 
date ('10/20/2021'); 
select datename ('10/20/2021')  as date;
select timestamp (30); 
select dateadd (hh,1,getdate()),110 as date; 
select convert (varchar(10),getdate(),110) as date; 
select datename (getdate(),2);
select cast ('1 jan 2021' as) as date;
select sysdatetime() as date; 
select sysdatetimeoffset () as date; 
select sysutcdatetime () as time; 
select current_timestamp  as time; 
select getutcdate() as date; ,
select datename (dayofyear,getdate()) as date; 
select datename (weekday,getdate()) as date; 
select datename (week,getdate()) as date; 
select datename (iso_week,getdate()) date; 
select datediff (day) as date; 
select ecomonth (getdate(),1) as lastdayofmonth; 
select isdate ('10/20/1990'); 
select switchoffset ('2021/10/20',-10) as date;






----------------------------------------------------------------------------------------------------------------------------------------------------------------------

create table student2(
stu_name varchar(40), 
stu_class varchar(20),
stu_rollno int);
insert into student2 values ('Anaya Majumdar','IX',10);
insert into student2 values ('Anushka Samanta','X',20);
insert into student2 values ('Aniket Sharma','XI',30);
insert into student2 values ('Ankit Das','IX',40);
insert into student2 values ('Riya Jain','XII',50);
insert into student2 values ('Tapan Samanta','IX',60);
insert into student2 values ('Deepak Sharma','X',70);
insert into student2 values ('Akansha Das','XII',80);
insert into student2 values ('Shreya Ghosh','X',90);
insert into student2 values ('Ankush Rathod','XI',100);  
alter table student2 add stu_dob int;
alter table student2 add stu_date1 int; 
alter table student2 add stu_date2 int; 
alter table student2 add stu_date3 int; 
alter table student2 add stu_date4 date; 
alter table student2 add stu_date5 varchar(20); 
select * from student2;
select convert (varchar(10),getdate(),108)as dates; ------------------------------------show time
insert into student2 (stu_date5) values (select datepart (day,getdate());--------------? 
update student2 set stu_date5=sysutcdatetime() where stu_rollno=100;  
update student2 set stu_date4=getdate() where stu_name='riya jain';
update student2 set stu_date5= datename(YY,getdate()) where stu_rollno=80; 
update student2 set stu_date5= datename(MM,getdate()) where stu_rollno=70; 
update student2 set stu_date2= datename(DD,getdate()) where stu_rollno between 1 and 100; 
update student2 set stu_date5= datename (weekday,getdate()) where stu_rollno=10;  
update student2 set stu_date1= datepart (ss,getdate()) where stu_name like'A%%%%'; 
update student2 set stu_date3= datepart (HH,getdate()) where stu_name like'A%%%%'; 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------integer function 

create table employ01( 
emp_id int,
emp_name varchar(20),
emp_salary bigint,
emp_age int,
emp_city varchar(20));  
insert into employ01 values (10,'vinay',50000,25,'amravati');
insert into employ01 values (20,'kamlesh',60000,27,'pune');
insert into employ01 values (30,'pranit',40000,26,'amravati');
insert into employ01 values (40,'shreyash',70000,28,'pune');
insert into employ01 values (50,'rushabh',50000,30,'amravati');
create table employ02( 
emp_id int,
emp_name varchar(20),
emp_salary bigint,
emp_age int,
emp_city varchar(20)); 
insert into employ02 values (10,'akash',25000,25,'amravati');
insert into employ02 values (20,'rohit',30000,30,'pune');
insert into employ02 values (30,'shubham',50000,28,'amravati');
insert into employ02 values (40,'rahul',60000,25,'pune');
insert into employ02 values (50,'akash',25000,28,'amravati');
select * from employ01; 
select * from employ02; 
------------------------------------------------------------------------------------------------
update employ01 set emp_salary=emp_salary*1.5 where emp_age in    ----------increse salary by %%%%%%%%%%%%%
(select emp_age from employ01 where emp_age>25); 

update employ02 set emp_salary=emp_salary+10000 where emp_name in 
(select emp_name from employ02 where emp_name like 'r%%%%%');  
------------------------------------------------------------------------------------------------
select * from employ01 where emp_city in 
(select emp_city from employ02 where emp_city='pune'); --------------------value show based on onother table 

select * from employ01;  
select distinct (emp_name),emp_salary=emp_salary*1.5 from employ01 where emp_age in 
(select emp_age  from employ02 where emp_age>20);
select *from employ02;

select emp_name, emp_salary from employ01 where emp_salary in 
(select MAX (emp_salary) from employ01 where emp_id<100);--------------------MAX salary

select emp_name, emp_salary from employ01 where emp_salary in 
(select MIN (emp_salary) from employ01 where emp_id<100);  


create table fullname( 
first_name varchar(20),
middle_name varchar(20),
last_name varchar(20)); 
insert into fullname ( first_name,middle_name) values ('shubham','sachin');
insert into fullname (middle_name,last_name) values ('abhi','sachin');
insert into fullname ( first_name,last_name) values ('sager','akash');
insert into fullname (last_name) values ('pratik');
insert into fullname (middle_name) values ('pranit'); 
select * from fullname;

select isnull (first_name,middle_name) as allname from fullname;---------------show only two
select coalesce (first_name,middle_name,last_name) as allname from fullname;-------unlimited value 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
window function=lead lag first last ntile;

select * from employ1; 
select emp_id,emp_name,emp_age ,lead (emp_age,1,-1)over (order by emp_age) as leads from employ1;---------- ek sodun samorche dakhavte
select emp_id,emp_name,emp_age ,lag (emp_age,1,-1)over (order by emp_age) as lags from employ1; 

select first_value (emp_name) over(order by emp_age) as firstvalues from employ1;
select last_value (emp_name)over(order by emp_age) as lastvalues  from employ1;
select * from employ1


delete from fullnames where first_name='pratik';------specify whole condition for proper approach                                 DELETE TRUNCATE DROP
truncate table fullnames;-------delete all records from table  
drop table fullnames;-------delete whole records with stucture
 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------how to fetch all table name from databace 

select * from information_schema.tables where table_type='base_table'; 
select * from information_schema.columns where table_name='student2';  
select * from information_schema.views where table_name='student2'; 
select * from information_schema.check_constraints where constraint_name='check';  
select name, create_date, modify_date from sys.objects where type_desc='user_table'; 

consider take data from database.i order to make suppose to do.
user id 
password 
-----if the sucessful match;
false-----let me just highlight of the part input the get the information is correct; 
select column_name from information_schema.columns where table_name='student2'; 
select name from sys.columns where object_id=object_id('student2'); 
select name from sys.columns where object_id=object_id('student2'); 


DROP DATABASE LEARNING; 

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------tcl comand ( commit rollback save point) 
create table tcl(                                                                           ----rollback=undo last statement 
id int,                                                                                            ----- commit comand lavli ki kahich change 
names varchar(20),                                                                                             ---honar nai rollback pan nai honar. commit= save  
city varchar(20));																				    -----dml(insert update delete) he asala ki rollback honar nai
insert into tcl values (10,'vinay','amravati') ;                                                    ------karan he uto commit aste.              
insert into tcl values (20,'kamlesh','amravati');                                      --jump         -----savepoint  jar dila tar tithparyantacha data save houn jate
begin tran
save tran savepointAA; 
insert into tcl values (30,'shubham','amravati'); 
insert into tcl values (40,'bhau','amravati');
begin tran 
save tran savepointB; 
insert into tcl values (50,'pranit','amravati'); 
begin tran 
save tran savepointC;
select * from tcl;  

rollback tran savepointC; 
rollback tran savepointAA; 
rollback tran savepointB; 
 
 rollback; 
 --------------------------------------------------------------------------------------------------------------------------------------------------------------------
 --------DML TRIGGER--------------------------
 
------------ trigger are stored program which are automatically executed or fixed when some events occur.  

------------1 statements like (DIU delete, insert, update)
-------------2 statements like (DDL create, alter,drop)
-------------login , logoff , start up , stutdown 
--BENIFITS=gain stong contol over security, preventing invalid transaction. 
--------eka table madhla deta dusra table madhe pahaycha asel  
----------------------------after insert------------------------
-----instead of 
create table emp(
emp_id int,
emp_name varchar(20),
emp_salary decimal); 
insert into emp values (100,'vinay',10000)
select * from emp;

create table emp_logs(
emp_id int ,
emp_name varchar(20),
emp_salary decimal, 
log_action varchar(20),
dates date); 
select * from emp_logs;

create trigger inserttrigger on emp
after insert 
as 
declare @emp_id int; --------------------------declare
declare @emp_name varchar(20);
declare @emp_salary decimal;
declare @log_action varchar(20); 

select @emp_id=i.emp_id,@emp_name=i.emp_name,@emp_salary=i.emp_salary from inserted i;

set @log_action='after inserted';

insert into emp_logs (emp_id,emp_name,emp_salary,log_action,dates)values(@emp_id,@emp_name,@emp_salary,@log_action,getdate());-------------insert
print 'after insert';
go
insert into emp values (100,'kamlesh',35000); 
select * from emp; 
select * from emp_logs;

---------------------after update-----------------------------------
create trigger updatetrigger on emp
after update
as 
declare @emp_id int;   ------------------------declare
declare @emp_name varchar(20);
declare @emp_salary decimal;
declare @log_action varchar(20); 

select @emp_id=i.emp_id,@emp_name=i.emp_name,@emp_salary=i.emp_salary from inserted i;

set @log_action='after updated record';

insert into emp_logs(emp_id,emp_name,emp_salary,log_action,dates)values(@emp_id,@emp_name,@emp_salary,@log_action,getdate());-------------insert
print 'updated succesfully ';
go 
update emp set emp_name='vinay' where emp_id=200;
select * from emp; 
select * from emp_logs;
 
 ----------------------------after delete------------------------------------
create trigger deletetrigger on emp
after delete
as 
declare @emp_id int;   ------------------------declare
declare @emp_name varchar(20);
declare @emp_salary decimal;
declare @log_action varchar(20); 

select @emp_id=d.emp_id,@emp_name=d.emp_name,@emp_salary=d.emp_salary from deleted d;

set @log_action='after deleted record';

insert into emp_logs (emp_id,emp_name,emp_salary,log_action,dates)values(@emp_id,@emp_name,@emp_salary,@log_action,getdate());-------------insert
print 'deleted succesfully ';
go 
delete from emp where emp_id=100;
select * from emp; 
select * from emp_logs;

------------------------insted of---------------------------------------------
create trigger insteadtrigger on emp-----------dml diu
instead of delete
as 
select emp_name,emp_salary from emp;
go 
delete from emp where emp_name='vinay';

create trigger insteadupdatetrigger on emp-----------dml diu
instead of update
as 
select emp_name,emp_salary from emp;
go 
update emp set emp_name='pratik' where emp_salary=10000;

create trigger insteadinserttrigger on emp
instead of insert
as
select emp_salary from emp;
go
insert into emp values (10,'shubham',35000);


--------------------------------------------------------------------------------------------------------------------------------------------------------------------
 ------------------------pivotate function---------------------------------
 ---unique value apan baher kadhato. use eka country la kiti ammoubt challi te kadhu shakto.  limited pahije 

 create table pivotate(
 sale_id int identity(1,1),
 sale_agent varchar(20),
 sale_country varchar(20), 
 sale_amount int); 
 insert into pivotate values ('vinay','amravati',50000)
 insert into pivotate values ('vinay','mumbai',20000)
 insert into pivotate values ('vinay','pune',1000)
 insert into pivotate values ('shubham','amravati',50000)
 insert into pivotate values ('shubham','mumbai',20000)
 insert into pivotate values ('shaubham','pune',1500)
 insert into pivotate values ('pratik','amravati',50000)
 insert into pivotate values ('pratik','mumbai',5000)
 insert into pivotate values ('pratik','pune',1000) 
 select * from pivotate; 
 select sale_agent,amravati,mumbai,pune from
 (select sale_agent,sale_country,sale_amount from pivotate) as sourcetable
 pivot(
 sum(sale_amount) for sale_country in (amravati,mumbai,pune)
 )
 as pivottable;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------- stored procedure             
create table eng(
er_id int,
er_name varchar(20),
er_mob int not null unique,
er_dept varchar (50),
er_postpin int,
er_salary decimal); 
----inserting elements in tables

insert into eng values (10,'rahul',789516116,'cse',454664,50000);
insert into eng values (20,'mahesh',78641417,'it',458976,70000);
select * from eng; 

create procedure cp_proc
as
begin
select* from eng;
end
go

execute cp_proc;----------------------------excc exec also use


alter procedure cp_proc ----------------------@id key word 
@id int
as 
begin
if @id>0----------------------5>0  if condition true zali tar begin part run hote ani condition jar false zali tar else run hote
begin
select * from eng;
end
else
begin
select er_name from eng;
end 
end
go
execute cp_proc 0;
execute cp_proc 5;
execute cp_proc -5;
drop procedure cp_proc;
execute cp_proc;
create view (myview) as
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------unpivot

create table survey(
survey_id int not null identity (1,1),
[how the villege clean was] tinyint,
[how the facility provided was]tinyint,
[how the lunch was]tinyint,
[will you visit again]tinyint)
select * from survey;
insert into survey values (1,2,5,1)
insert into survey values (1,2,5,1)
insert into survey values (3,2,4,1)
insert into survey values (2,5,3,1)
insert into survey values (1,2,5,1)

select survey_id,rating,marks from survey    ---------unpivot cha conversion column onvert into row
unpivot
(rating for marks in (
[how the villege clean was],
[how the facility provided was],
[how the lunch was],
[will you visit again])
)
as unpio

----------------------------------------------reverse pivot

 create table bajajfin(
 sale_id int,
 sale_agent varchar(20),
 sale_country varchar(20), 
 sale_amount int); 
 select * from bajajfin;
 insert into bajajfin values (121,'mahesh','india', 85000);
 insert into bajajfin values (131,'ganesh','pak', 95000);
 insert into bajajfin values (141,'suresh','shrilanka', 90000);
 select sale_id,sale_agent,sale_country,sale_amount from---------nantar ithun run karaycha2

 (select sale_id,sale_agent,india,pak,shrilanka from----------pahile ithun run 1
 (select * from bajajfin) as sourcetable
 pivot
 (
 sum (sale_amount)for sale_country in (india,pak,shrilanka)
 )
 as pivottable)as p ------run pahile mag select javal braget lavaycha n as piviote nantar close karaycha n as a lihaycha----ithparyant1 fakt as p nai

unpivot
 (
 sale_amount for sale_country in (india,pak,shrilanka)
 )
 as unpivotexam--------ithparyant2
---------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
---------------------------------table name change

create table amazon_one(----------------ata amazon_name table cha nav ahe 
cust_id int,
cust_name varchar(20),
cust_ads varchar (30),
cust_pin bigint)

exec sp_rename 'amazon_one','amazon_name';
select * from amazon_one;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------database change
alter database vinay modify name datas;--------nav changekela database cha
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------data type change ekach column madhe varchar ani int value
create table amazon(
cust_id int,
cust_name varchar(20),
cust_ads varchar (30),
cust_pin bigint)
insert into amazon values (126,'raj','vairag',46451654)
insert into amazon values (130,'shubham','vinay',46451654)
select * from amazon
alter table amazon alter column cust_pin varchar (20);
insert into amazon values (130,'shubham','pratik','kameesh') 
insert into amazon values (130,'shubham','pratik',1651151)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------table name change,data type change,column name change

create table f1(
fk_id int,
fk_name varchar(20),
fk_ads varchar(20),
fk_pin bigint,
fk_amount bigint) 
insert into f1 values (101,'vinay','amravati',482311,10000); 
insert into f1 values (102,'kamlesh','amravati',465491,10000); 
select * from f1; 

exec sp_rename'f1','f2'; --------------change table name 
select * from f2; 

alter table f2 alter column fk_pin varchar(20);-------fk_pin cha data type change nanter flip pin nav dila 
alter table f2 rename column fk_pin to flip_pin;-------------column cha nav change kela
exec sp_rename 'f2.fk_pin','flip_pin','column';----------column name change kela fk_pin cha flip_pin 
select * from f2; 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------index details
create table indexdetails(
emp_id int primary key,
emp_name varchar(20),
emp_ads varchar(20)) 
select * from indexdetails; 

exec sp_helpindex indexdetails;
insert into indexdetails values (100,'shubham','pune') 
create index myindex on indexdetails (emp_name,emp_ads);
exec sp_helpindex indexdetails;

insert into indexdetails values (10,'vinay','pune')
insert into indexdetails values (20,'bhau','pune')
insert into indexdetails values (30,'kamlesh','pune')
insert into indexdetails values (40,'mahesh','pune') 
select * from indexdetails; 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 ----------------------stored procedure
 create table jio( 
 jio_id int,
 jio_name varchar(20)); 
 select * from jio;
 insert into jio values (121,'ganesh');
 create proc jiopro---                                  ---------procedure create keli ki delete jar kela ani nantar execute kela ta te delete hot nai save rahate
as
begin
insert into jio values (122,'ravi');
insert into jio values (123,'rao');
insert into jio values (124,'dadasaheb');
insert into jio values (125,'sahebrao');
insert into jio values (126,'teremeri');
insert into jio values (127,'dada');
insert into jio values (128,'shubham');
insert into jio values (129,'vinay');
insert into jio values (130,'kamlesh');
end------
exec jiopro------- 
select * from jio;
delete from jio where jio_id=125;


create proc teledelete
as 
begin
delete from jio where jio_id=122;
delete from jio where jio_id=124;
delete from jio where jio_id=126;
delete from jio where jio_id=127;
delete from jio where jio_id=128;
end
exec jiopro;
select * from jio;
exec teledelete;


----------------------------------------------------------------------------------------------------------------------------------------------------------------------
select top 2 from (emp_salary) from-----------top salary
(select top 2 (emp_salary) from employ order by emp_salary desc)
as result
order by emp_salary asc;
---------------------------------------------------------------------------------------------------------------------------------------------------------
----------having clause or group by or where 
create table emps(
e_id int primary key identity (1,1),
e_name varchar(20),
dept varchar(20),
salary bigint); 
insert into emps values ('ramesh','HR',10000); 
insert into emps values ('amit','MARK',20000);
insert into emps values ('ramesh','HR',30000);
insert into emps values ('akash','MARK',40000);
insert into emps values ('varun','IT',50000); 
select * from emps;
--------HAVING                           group by kartana apan where chya jagi having use karto
select dept from emps group by dept;------ithe fakt same dept walyanche group banavle 

select dept from emps group by dept ------count karne
having count(*)<2;

select e_name from emps ---------less than 2 wala jo employ ahe tyat kon kon lok kaam karat ahe
where dept in                ------less than 2 wala ekach ahe IT and techyat varun kam karat ahe
(select dept from emps group by dept
having count(*)<2);

-----where =will filter at row level (to individuval row) or it can be work on rows data 
-----hving = will filter at group level (aggregate) or it can be used with aggregate data
-----having clause cannot be used without group by 
-----where and having is used together in a query 
-------------------------------------------------------------------------------------------------------------------------------