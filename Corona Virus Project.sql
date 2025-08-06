-- Data Cleaning-- 

-- Q1. If null values are present, update them with zeros for all columns --

select *
from corona_virus.corona_data
where Province is null 
or `Country/Region` is null 
or Latitude is null 
or `Date` is null 
or Confirmed is null
or Deaths is null 
or Recovered is null;

-- Q2. Check total number of rows in the table --

select count(*)
from corona_virus.corona_data;

-- Q3. Check the total number of provinces that have the spread of corona virus --

select count(distinct province)
from corona_virus.corona_data;

-- Q4. What is the start date and end date --

select min(`date`) as start_date, max(`date`) as end_date
from corona_virus.corona_data;

-- Q5. How many months are present in the dataset --

select count(distinct substring(`date`,1,7)) as months
from corona_virus.corona_data;

-- Q6. What is the monthly average for confirmed, deaths, and recovered --

select distinct substring(`date`,1,7) as months,
round(avg(confirmed), 2) as average_confirmed, 
round(avg(deaths), 2) as average_deaths, 
round(avg(recovered), 2) as average_recovered
from corona_virus.corona_data
group by months;

-- Q6. Find minimum values for confirmed, deaths, and recovered per year --

select year(`date`) as `year`,
min(confirmed) as minimum_confirmed, 
min(deaths) as minimum_deaths, 
 min(recovered) as minimum_recovered 
from corona_virus.corona_data
where confirmed !=0 and deaths !=0 and recovered !=0
group by `year`;

-- Q7. Find maximum values for confirmed, deaths, and recovered per year --

select year(`date`) as `year`,
max(confirmed) as maximum_confirmed,
 max(deaths) as maximum_deaths, 
 max(recovered) as maximum_recovered
from corona_virus.corona_data
group by `year`;

-- Q8. What is the total number of cases of confirmed, deaths, and recovered each month --

select distinct substring(`date`,1,7) as months,
round(sum(confirmed), 2) as total_confirmed, 
round(sum(deaths), 2) as total_deaths, 
round(sum(recovered), 2) as total_recovered
from corona_virus.corona_data
group by months;
