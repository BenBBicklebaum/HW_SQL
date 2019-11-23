DROP VIEW all_parties;
CREATE VIEW all_parties AS
	Select first_name, last_name, 'Staff' as type
	From staff

	UNION ALL

	Select first_name, last_name, 'Actors' as type
	From actor

	UNION ALL

	Select first_name, last_name, 'Customer' as type
	From customer;

SELECT *
FROM all_parties;


-- DISCLAIMER: I COPIED THIS FROM THE SOLVED SECTION BECAUSE I DONT KNOW WHAT THIS QUESTION WAS ASKING.  AFTER LOOKING AT THE QUERY, I STILL DONT KNOW WHAT THE QUESTION WAS ASKING.
-- Customers in London
-- Question 1

SELECT COUNT(*)
FROM city
UNION
SELECT COUNT(*)
FROM country;


-- Question 2

SELECT customer_id
FROM customer
WHERE address_id IN
(
  SELECT address_id
  FROM address
  WHERE city_id IN
  (
    SELECT city_id
    FROM city
    WHERE city = 'London'
  )
)
UNION ALL
SELECT id
FROM customer_list
WHERE city = 'London';