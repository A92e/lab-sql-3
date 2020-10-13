use sakila;
/* 
    How many distinct (different) actors' last names are there?
    In how many different languages where the films originally produced?
    How many movies were not originally filmed in English?
    Get 10 the longest movies from 2006.
    How many days has been the company operating (check DATEDIFF() function)?
    Show rental info with additional columns month and weekday. Get 20.
    Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
    How many rentals were in the last month of activity?
*/

--  How many distinct (different) actors' last names are there?
select count(distinct(last_name)) from actor;

--  In how many different languages where the films originally produced?
select count(distinct(original_language_id)) from film;

--  How many movies were not originally filmed in English?
select count(distinct(original_language_id <> 'English')) from film;


--  Get 10 the longest movies from 2006.
select title as 'the longest movies from 2006' from film order by length asc limit 10;



--  How many days has been the company operating (check DATEDIFF() function)?
SELECT DATEDIFF(max(return_date), min(rental_date)) as operating_in_days, min(rental_date) as first_rental, max(return_date) as last_return from rental;


-- Show rental info with additional columns month and weekday. Get 20.
select date_format(rental_date, '%w') as weekday, date_format(rental_date, '%m') as motnh from rental;


--  Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

select *,
case 
    when (date_format(rental_date, '%w') = 7) or (date_format(rental_date, '%w') = 6) then 'weekend'
    else 'workday'

END as day_type
from rental;


--    How many rentals were in the last month of activity?

select count(rental_id), return_date=(max(return_date)) from rental  where (return_date- INTERVAL 30 DAY) <= rental_date;



/*SELECT rental_date  FROM rental  WHERE rental_id=(
    SELECT max(rental_date) FROM rental)
    
select count(rental_id) from rental  where last_update=(select max(return_date) from rental where (rental_id - INTERVAL 30 DAY) <= rentun_date;
*/

select count(rental_id) from rental 
where ( "2006-02-14" - INTERVAL 30 DAY) <= rental_date; 
