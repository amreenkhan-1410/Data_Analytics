use parks_and_recreation;
#--limit & Aliasing--
select * from parks_and_recreation.employee_demographics  order by age desc limit 2,1;
#--Aliasing-- it can be implemented een without as
select gender,avg(age) As avg_age from employee_demographics group by gender having avg_age > 40;