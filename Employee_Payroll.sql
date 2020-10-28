 
 create database payroll_service;
use payroll_service;
select databases();




 create table employee_payroll
    -> (
    -> id INT unsigned NOT NULL AUTO_INCREMENT,
    -> name VARCHAR(150) NOT NULL,
    -> salary Double NOT NULL,
    -> start DATE NOT NULL,
    -> PRIMARY KEY (id)
    -> );


     insert into employee_payroll (name,salary,start) Values
    -> ('Bill',100000.00,'2018-01-03'),
    -> ('Teresa',200000.00,'2019-11-13'),
    -> ('Charlie',300000.00,'2020-05-21');



    select * from employee_payroll where name='Teresa';
    select * from employee_payroll where start between cast('2019-01-01' as date) and DATE(NOW());


    alter table employee_payroll ADD gender CHAR(1) AFTER name;



     update employee_payroll set gender='F' where name='Teresa';
     	update employee_payroll set gender='F' where name='Bill' or name='Charlie';

     		 delete from employee_payroll where name='Bill';


     	 select avg(salary) from employee_payroll where gender='M' group by gender;

     	  select count(*) from employee_payroll where gender='M';
     	 select sum(salary),gender from employee_payroll group by gender;




     	 create table address_book_table
    -> (
    -> firstname VARCHAR(150) NOT NULL,
    -> lastname VARCHAR(150) NOT NULL,
    -> address VARCHAR(150) NOT NULL,
    -> city VARCHAR(150) NOT NULL,
    -> state VARCHAR(150) NOT NULL,
    -> zip VARCHAR(150) NOT NULL,
    -> number int NOT NULL,
    -> email VARCHAR(150) NOT NULL,


    alter table employee_payroll ALTER address SET DEFAULT 'TBD';



     update employee_payroll
    -> set department='Sales'
    -> where name='Teresa'
    -> ;
     alter table employee_payroll add net_pay double not null after tax;



      alter table employee_payroll
    -> add dept_id VARCHAR(150)
    -> after id
    -> ;

     insert into department(deptid,deptname) values
    -> ('103','HR');

    select name from employee_payroll,department
    -> where employee_payroll.dept=department.deptid
    -> and
    -> department.deptname='Sales'
    -> ;

     create table payroll
    -> (
    -> empID int ,
    -> basic_pay double,
    -> deductions double,
    -> taxable_pay double,
    -> tax double,
    -> net_pay double
    -> );



     insert into payroll(empID, basic_pay,deductions,taxable_pay,tax,net_pay)
    -> values
    -> (1,30000,2000,28000,50000,23000)
    -> ;


     select net_pay from payroll,employee_payroll
    -> where payroll.empID=employee_payroll.id
    -> and
    -> employee_payroll.name='Bill'
    -> ;