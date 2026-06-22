#--GROUP BY--
select gender from employee_demographics group by gender;
select first_name from employee_demographics group by gender;# it should match or any aggrigate function 
select gender , avg(age), max(age),min(age),count(age) from employee_demographics group by gender;

#--ORDER BY--( ARRANGES IN ASCENDING OR DESCENDING ORDER )
select * from employee_demographics order by first_name;#default acs
select * from employee_demographics order by first_name desc; 
select * from employee_demographics order by gender, age desc;
select * from employee_demographics order by 5;# we can use column numbers intead of names some times
