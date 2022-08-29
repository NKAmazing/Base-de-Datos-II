USE sakila;

# Consultas basicas a las siguientes Tablas
SELECT * FROM rental;

SELECT * FROM film;

SELECT * FROM inventory;

SELECT * FROM customer;

SELECT * FROM staff;

# CREACION DE VISTA RENT FILMS - SUB CONSULTA INNER JOIN
CREATE VIEW RentFilms AS
SELECT F.title as "Film Title",
		F.description as "Film Description",
        F.release_year as "Release Year",
        S.username as "Seller's name",
        C.first_name as "Client's First name",
        C.last_name as "Client's Last name",
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
        C.first_name as "Client's First name",
        C.last_name as "Client's Last name",
        C.email as "Client email",
        R.rental_date as "Rental Date",
        R.return_date as "Return Date"
 FROM film F 
INNER JOIN inventory I ON (F.film_id = I.film_id) 
INNER JOIN rental R ON (I.inventory_id = R.inventory_id)
INNER JOIN customer C ON (C.customer_id = R.customer_id)
INNER JOIN staff S ON (S.staff_id = R.staff_id)
WHERE F.title LIKE "Y%";

