use sakila;

#1 How many films are there for each of the categories in the category table. Use appropriate join to write this query.

select name as category, count(distinct film_id) as films
from film_category fc
left join category c
using(category_id)
Group by name
order by 2 desc;

#2 Display the total amount rung up by each staff member in August of 2005.

select staff_id, date_format(payment_date, '%M') as month , date_format(payment_date, '%Y') as year,  sum(amount) as revenue
from payment
where date_format(payment_date, '%M') = 'August' 
group by 1,2,3
order by 1;

#3 Which actor has appeared in the most films?

select concat(first_name,' ', last_name) as actor , count(distinct film_id) as films_acted
from film_actor fa
left join actor a
using(actor_id)
group by 1
order by 2 desc
limit 1;

#4 Most active customer (the customer that has rented the most number of films)

select concat(first_name,' ', last_name) as customer , count(distinct rental_id) as rented
from rental r
left join customer c
using(customer_id)
group by 1
order by 2 desc
limit 1;

#5 Display the first and last names, as well as the address, of each staff member.

select first_name, last_name, address
from staff s
join address a
using(address_id);

#6 List each film and the number of actors who are listed for that film.

select title as film_name, count(distinct actor_id) as actors
from film f
join film_actor fa
using(film_id)
group by title
order by 2 desc;

#7 Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

select first_name, last_name, sum(amount) as total_paid
from payment p
join customer c
using(customer_id)
group by 1,2
order by 2;

#8 List number of films per category.

select name as category, count(distinct film_id) as films
from film_category fc
left join category c
using(category_id)
Group by name
order by 2 desc;