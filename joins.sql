use parks_and_recreation;
#--joins
select *
 from employee_demographics as dm
 inner join employee_salary as al
 on dm.employee_id=al.employee_id;
select dm.employee_id , dm.age, al.occupation from employee_demographics as dm inner join employee_salary as al on dm.employee_id=al.employee_id;
select * from employee_demographics as dm left join employee_salary as al on dm.employee_id=al.employee_id;
select * from employee_demographics as dm right join employee_salary as al on dm.employee_id=al.employee_id;

#--self join
select * from employee_salary emp1 join employee_salary emp2 on emp1.employee_id = emp2.employee_id;
select emp1.employee_id as emp_santa ,emp1.first_name as first_name_santa,emp1.last_name as last_name_santa, emp2.employee_id as emp_santa ,emp2.first_name as first_name_santa,emp2.last_name as last_name_santa from employee_salary emp1 join  employee_salary emp2 on emp1.employee_id=emp2.employee_id;



#-- joining multiple tables--
select * 
from employee_demographics as dm
inner join employee_salary as sl
   on dm.employee_id=sl.employee_id
inner join parks_departments as dp
    on sl.dept_id=dp.department_id;
