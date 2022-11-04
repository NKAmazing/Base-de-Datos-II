CREATE DATABASE database_ej3;

USE database_ej3;

CREATE TABLE `database_ej3`.`table` (
  `nombre` VARCHAR(50) NOT NULL,
  `apellido` VARCHAR(50) NOT NULL,
  `telefono` VARCHAR(50) NOT NULL);
  
  ALTER TABLE `database_ej3`.`table` 
ADD COLUMN `id` INT NOT NULL AUTO_INCREMENT AFTER `telefono`,
ADD PRIMARY KEY (`id`);
;

INSERT INTO `database_ej3`.`table` (`nombre`, `apellido`, `telefono`) VALUES ('nicolas', 'mayoral', '2604348538');
INSERT INTO `database_ej3`.`table` (`nombre`, `apellido`, `telefono`) VALUES ('alexis ', 'lino', '2604563228');
INSERT INTO `database_ej3`.`table` (`nombre`, `apellido`, `telefono`) VALUES ('julian', 'castillo', '2604276591');


