-- #1
-- How many actors are there with the last name ‘Wahlberg’?
SELECT count(DISTINCT last_name)
FROM actor;
-- 121

-- #2
-- How many payments were made between $3.99 and $5.99?
SELECT count(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;
-- 5607

-- #3
-- What film does the store have the most of? (search in inventory)?
SELECT film_id, count(film_id)
FROM inventory
GROUP BY film_id
ORDER BY count(film_id) DESC
LIMIT 1;
-- many have 8 which is the highest count


SELECT inventory.film_id, film.title, count(inventory.film_id) as film_count
FROM inventory INNER JOIN film
ON inventory.film_id = film.film_id
GROUP BY inventory.film_id, film.title
ORDER BY film_count DESC
LIMIT 1;
-- many have 8 which is the highest count


-- #4
-- How many customers have the last name ‘William’?
SELECT count(last_name)
FROM customer
WHERE last_name = 'William';
-- 0

-- #5
-- What store employee (get the id) sold the most rentals?
SELECT staff_id, count(rental_id) as rental_count
FROM rental
GROUP BY staff_id
ORDER BY rental_count DESC
LIMIT 1;
-- staff_id 1


-- #6
-- How many different district names are there?
SELECT count(DISTINCT district)
FROM address;
-- 378

-- #7
-- What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, count(actor_id) as actor_count
FROM film_actor
GROUP BY film_id
ORDER BY actor_count DESC
LIMIT 1;
-- film_id 508, actor_count 15

SELECT film.title, film.film_id, count(actor_id) as actor_count
FROM film INNER JOIN film_actor
ON film.film_id = film_actor.film_id
GROUP BY film.film_id
ORDER BY actor_count DESC
LIMIT 1;
-- Lambs Cincinatti, 508, 15

SELECT film.title, film_actor.film_id, count(actor_id) as actor_count
FROM film INNER JOIN film_actor
ON film.film_id = film_actor.film_id
GROUP BY film.title, film_actor.film_id
ORDER BY actor_count DESC
LIMIT 1;
-- Lambs Cincinatti, 508, 15

-- #8
-- From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT count(customer_id)
FROM customer
WHERE last_name LIKE '%es' and store_id = 1;
-- 13

SELECT count(customer.customer_id)
FROM customer JOIN store
ON customer.store_id = store.store_id
WHERE store.store_id = 1 AND customer.last_name LIKE '%es'
-- 13

-- #9
-- How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430? (use group by and having > 250)
SELECT amount, count(DISTINCT amount)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING count(amount) > 250;
-- 3

-- #10
-- Within the film table, how many rating categories are there? And what rating has the most movies total?
SELECT count(DISTINCT rating)
from film;
-- 5

SELECT rating, count(film_id) as film_count
from film
GROUP BY rating
ORDER BY film_count DESC
LIMIT 1;
-- PG-13, 223





