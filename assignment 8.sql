use sakila;

# question 1
#Rank films by length (filter out the rows with nulls or zeros in length column). Select only columns title, length and rank in your output.
SELECT title,
       length,
       row_number() over
       (order by length)rank_no
       from film;


#question 2
#Rank films by length within the rating category (filter out the rows with nulls or zeros in length column). In your output, only select the columns title, length, rating and rank.
 
SELECT title,
       length,rating,
       row_number() over
       (order by length)
        rank_no from film;
#How many films are there for each of the categories in the category table? Hint: Use appropriate join between the tables "category" and "film_category".
select * from film_category,category;



SELECT distinct category.category_id,category.name 
FROM Category
LEFT JOIN film_category ON film_category.category_id = category.category_id
ORDER BY Category.category_id,category.name;

#Which actor has appeared in the most films? Hint: You can create a join between the tables "actor" and "film actor" and count the number of times an actor appears.
select * from actor;
select * from film_actor;

SELECT actor.actor_id, actor.first_name,actor.last_name
FROM actor
LEFT JOIN film_actor ON film_actor.actor_id=actor.actor_id
group by actor.actor_id,actor.first_name,actor.last_name
order by count(film_actor.actor_id=actor.actor_id) desc;

#Which is the most active customer (the customer that has rented the most number of films)? Hint: Use appropriate join between the tables "customer" and "rental" and count the rental_id for each customer.

select * from customer;
select * from rental;

SELECT count(Customer.Customer_id), customer.first_name, customer.last_name
FROM Customer
LEFT JOIN rental ON customer.customer_id = rental.customer_id
group by Customer.Customer_id,customer.first_name,customer.last_name
order by rental.customer_id asc;
#not so sure. my code is showing mary smith is the most active customer.# i checked my query it was showing ELEANOR HUNT as the most active user with 46 count.

#Which is the most rented film? (The answer is Bucket Brotherhood).
#You can use join between three tables - "Film", "Inventory", and "Rental" and count the rental ids for each film.
select * from film;
select * from inventory;
select * from rental;