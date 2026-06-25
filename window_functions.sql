use parks_and_recreation;
-- window function
select gender,avg(salary) 
from employee_demographics as dem 
join employee_salary as sl
on dem.employee_id=sl.employee_id
group by gender;

-- instead we can use over()  function 
select dm.first_name,dm.last_name, avg(salary) over(partition by gender)
from employee_demographics as dm 
join employee_salary as sl
on dm.employee_id=sl.employee_id;

-- rolling total
select dm.first_name,dm.last_name,gender,salary,sum(salary) over(partition by gender order by dm.employee_id) as rolling_total
from employee_demographics as dm 
join employee_salary as sl
on dm.employee_id=sl.employee_id;

select dm.employee_id,dm.first_name,dm.last_name,gender,salary,
row_number() over(partition by gender order by salary desc) as row_num,
rank() over(partition by gender order by salary desc) as rank_num,
dense_rank() over(partition by gender order by salary desc) as dense_rank_num
from employee_demographics as dm 
join employee_salary as sl
on dm.employee_id=sl.employee_id;




