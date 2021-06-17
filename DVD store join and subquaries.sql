
SELECT first_name,last_name, district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';
---------------------------------------------\

SELECT first_name,last_name,
FROM payment
LEFT JOIN customer
ON customer.costumer_id = payment.customer_id
WHERE amount > 6.99;
--------------------------------------

SELECT first_name, last_name, customer.customer_id
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);
--------------------------------------

SELECT customer.first_name, customer.last_name, country
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';
-------------------------------------

SELECT staff.first_name, staff.last_name, SUM(payment.amount)
FROM staff
FULL JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.first_name, staff.last_name;
-------------------------------------

SELECT staff.first_name, staff.last_name, SUM(payment.amount)
FROM staff
FULL JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.first_name, staff.last_name;
-------------------------------------
-- PS I did a bit more reasurch regarding line 50 to be able to solve this Question.
SELECT COUNT (*) "number of movies", rating
FROM film
GROUP BY rating;

--------------------------------------
select count(number_of_payments)
from(select customer_id, first_name, last_name, count(amount) as number_of_payments 
     from(
        select c.customer_id,first_name, last_name, amount
        from customer as c
        inner join payment as p
        on c.customer_id = p.customer_id
        where amount > 6.99) sub1
    group by customer_id, first_name, last_name
    having count(amount) =1) sub2


--------------------------------------
SELECT * 
FROM film
WHERE rental_rate = 0.00;


