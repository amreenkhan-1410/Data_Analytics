use parks_recreation;
#--unions--
select age ,gender from employee_demographics union select first_name,last_name from employee_salary;# but this generates a bad data
select first_name,last_name from employee_demographics union select first_name,last_name from employee_salary;# its default union distinct 
select first_name,last_name from employee_demographics union  all select first_name,last_name from employee_salary;# this gives all values including duplicates


select first_name,last_name,'old ' as label from employee_demographics where age>50 union
select first_name,last_name,'highly_paid_employee' as label from employee_salary where salary>70000;


select first_name,last_name,'old man' as label from employee_demographics where age>40 and gender ='male' union
select first_name,last_name,'old lady' as label from employee_demographics where age>40 and gender ='female' union
select first_name,last_name,'highly paid employee' as label from employee_salary where salary>70000;