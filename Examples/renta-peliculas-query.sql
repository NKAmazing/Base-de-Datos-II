USE sakila;

# Consultas basicas a las siguientes Tablas
SELECT * FROM rental;

SELECT * FROM film;

SELECT * FROM inventory;

SELECT * FROM customer;

SELECT * FROM staff;

SELECT * FROM address;

SELECT * FROM payment;

# CREACION DE VISTA RENT FILMS - SUB CONSULTA INNER JOIN
CREATE VIEW RentFilms AS
SELECT F.title as "Film Title",
		F.description as "Film Description",
        F.release_year as "Release Year",
        S.username as "Seller's name",
		concat(C.first_name, ' ', C.last_name) as "Client",
        C.email as "Client email",
        R.rental_date as "Rental Date",
        R.return_date as "Return Date"
 FROM film F 
INNER JOIN inventory I ON (F.film_id = I.film_id) 
INNER JOIN rental R ON (I.inventory_id = R.inventory_id)
INNER JOIN customer C ON (C.customer_id = R.customer_id)
INNER JOIN staff S ON (S.staff_id = R.staff_id);

# Seleccionamos la Vista
SELECT * FROM RentFilms;

# OTRAS SUB CONSULTAS
SELECT F.title as "Film Title",
		F.description as "Film Description",
        F.release_year as "Release Year",
        S.username as "Seller's name",
        concat(C.first_name, ' ', C.last_name) as "Client",
        C.email as "Client email",
        R.rental_date as "Rental Date",
        R.return_date as "Return Date"
 FROM film F 
INNER JOIN inventory I ON (F.film_id = I.film_id) 
INNER JOIN rental R ON (I.inventory_id = R.inventory_id)
INNER JOIN customer C ON (C.customer_id = R.customer_id)
INNER JOIN staff S ON (S.staff_id = R.staff_id)
WHERE F.title LIKE "Y%";

# SUBQUERY
SELECT 

	R.rental_date as "Rental Date",
    R.return_date as "Return Date",
    (SELECT concat(C.first_name, ' ', C.last_name) FROM customer C WHERE C.customer_id = R.customer_id) "Client",
    (SELECT C.email FROM customer C WHERE C.customer_id = R.customer_id) "Email",
    (SELECT concat(A.address, ' - ', A.district) FROM address A WHERE A.address_id = (SELECT C.address_id FROM customer C WHERE C.customer_id = R.customer_id)) "Address",
    (SELECT A.phone FROM address A WHERE A.address_id = (SELECT C.address_id FROM customer C WHERE C.customer_id = R.customer_id)) "Phone",
    P.staff_id "Code Seller - Payment",
    R.staff_id "Code Seller - Rent"
	
FROM rental R,
	payment P
    WHERE R.rental_id = P.rental_id;

