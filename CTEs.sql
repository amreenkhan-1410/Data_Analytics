-- cte's
use parks_and_recreation;
with cte_example as
(
select gender,avg(salary) avg_sal,min(salary),max(salary),count(salary)
from employee_demographics as dem
join employee_salary as sal
on dem.employee_id=sal.employee_id
group by gender
)
select avg(avg_sal)
from cte_example;

-- without cte 
select avg(avg_sal)
from (select gender, avg(salary) as avg_sal,min(salary),max(salary)
from employee_demographics as sem
join employee_salary as sal
on sem.employee_id=sal.employee_id
group by gender) sub_query;

with cte_example as
(
select employee_id ,gender,birth_date
from employee_demographics
where birth_date>'1945-05-13'
),
cte_example2 as
(select employee_id,salary
 from employee_salary
 where salary>50000
 )
 select * from cte_example
 join cte_example2 
 on cte_example.employee_id=cte_example2.employee_id ;