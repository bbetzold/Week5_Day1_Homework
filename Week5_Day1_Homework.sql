-- Week 5 - Monday Questions

-- 1. How many actors are there with the last name ‘Wahlberg’?
-- 2 --
SELECT COUNT(last_name)
FROM actor
WHERE last_name = 'Wahlberg';

-- 2. How many payments were made between $3.99 and $5.99?
-- 5607 --
SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99

-- 3. What film does the store have the most of? (search in inventory)
-- 72 Different film_id's are tied at 8
SELECT COUNT(film_id) AS Film_ID_Count, film_id
FROM inventory
GROUP BY film_id
ORDER BY Film_ID_Count DESC;


-- 4. How many customers have the last name ‘William’?
-- the Query return no results, 0
SELECT first_name, last_name
FROM actor
WHERE last_name = 'William'



-- 5. What store employee (get the id) sold the most rentals?

-- staff_id 2 sold a higher quantity - 7,304
SELECT COUNT(rental_id), staff_id
FROM payment
GROUP BY staff_id
ORDER BY staff_id;

-- SELECT COUNT(*)
-- FROM payment
-- WHERE staff_id = 2;

-- SELECT COUNT(*)
-- FROM payment
-- WHERE staff_id = 1;

-- staff_id 2 sold a highter $ amount, $31,059.92
SELECT SUM(amount), staff_id
FROM payment
GROUP BY staff_id
ORDER BY staff_id;

-- 6. How many different district names are there?
-- 378
SELECT COUNT(DISTINCT district)
FROM address;

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
-- film_id 508, 15 actors
SELECT film_id, COUNT(actor_id) AS num_of_actors
FROM film_actor
GROUP BY film_id
ORDER BY num_of_actors DESC;

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
-- 13 -- 
SELECT COUNT(last_name) AS last_names_ending_in_ES
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es';


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
-- 3: $0.99, $2.99 and $4.99
SELECT COUNT(amount) AS count_amount, amount
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(amount) > 250
ORDER BY amount;


-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?

-- 5 rating categories, and PG-13 has the most, 223
SELECT COUNT(DISTINCT rating) AS film_rating, rating
FROM film
GROUP BY rating;

SELECT COUNT(rating) AS film_rating_count, rating
FROM film
GROUP BY rating;


-- ANSWER KEY:
-- 1. 2
-- 2. 5607
-- 3. Multiple films are tied at 8
-- 4. 0
-- 5. 1 - 8040
-- 6. 378
-- 7. film_id 508 - 15 actors
-- 8. 13
-- 9. 3
-- 10. 5 ratings, PG-13 has the most