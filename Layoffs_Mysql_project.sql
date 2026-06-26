-- Data Cleaning
USE layoffs_schema;

select * from layoffs;

-- 1. remove duplicates
-- 2. standardize the data
-- 3. null values or blank values
-- 4. remove any columns

-- 1. remove duplicates
create table layoffs_staging 
like layoffs;

select * from layoffs_staging;
insert into layoffs_staging select * from layoffs;

select * , row_number() over( 
partition by company, industry,total_laid_off,percentage_laid_off,`date`) as row_num
from layoffs_staging ;


# this gives the data that have duplicates 
with duplicate_cte as
(
select * , row_number() over( 
partition by company, location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoffs_staging 
)
select * from duplicate_cte where row_num >1;

select * from layoffs_staging 
where company='casper';


CREATE TABLE `layoffs_staging3` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into layoffs_staging3
select *, row_number() over( partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions ) from layoffs_staging;

select * from layoffs_staging3;
select * from layoffs_staging3 where row_num>1;
delete from layoffs_staging3 where row_num >1;


-- standardizing data

select company , trim(company) #1
from layoffs_staging3;

update layoffs_staging3 set company =trim(company) ; # this removes white spaces before and after company names

select distinct industry from layoffs_staging3 order by 1;#2
select distinct industry from layoffs_staging3 where industry like 'Crypto%';
update layoffs_staging3 set industry='crypto' where industry like 'Crypto%';
select distinct industry from layoffs_staging3 order by 1;

select distinct location from layoffs_staging3 order by 1;# 3
select distinct country  from layoffs_staging3 order by 1;# 4
select distinct country , trim( trailing '.' from country ) from layoffs_staging3 order by 1;
update layoffs_staging3 set country = trim(trailing '.' from country ) where country like 'United States%';


select `date` , str_to_date(`date`,'%m/%d/%Y') from layoffs_staging3;#5
update layoffs_staging3 set `date`=str_to_date(`date`,'%m/%d/%Y') ;
alter table layoffs_staging3 modify column `date` date;


-- 3. null values or blank values 

update layoffs_staging3 set industry = null where industry ='';
select * from layoffs_staging3 where company = 'Airbnb';

select * from layoffs_staging3 t1
join layoffs_staging3 t2
on t1.company = t2.company 
and t1.location = t2.location 
where ( t1. industry is null  or t1.industry ='')
and t2. industry is not null;

update layoffs_staging3 t1
join layoffs_staging3 t2
on t1.company = t2.company 
set t1.industry = t2.industry 
where ( t1. industry is null )
and t2. industry is not null;


-- 4. remove any column or row
select * 
from layoffs_staging3
 where total_laid_off is null
and percentage_laid_off is null;

delete 
from layoffs_staging3
 where total_laid_off is null
and percentage_laid_off is null;

select * from layoffs_staging3;
alter table layoffs_staging3 drop column row_num;
