select gender,avg(age) from employee_demographics where avg(age)>40 group by gender ;#to handle this having is used
select gender, avg(age)from employee_demographics group by gender having avg(age) >40; 
select occupation , avg(salary) from employee_salary group by  occupation ;
select occupation , avg(salary) from employee_salary where occupation  like '%manager%' group by  occupation having avg(salary) >75000;