CREATE DATABASE database_ej3;

USE database_ej3;

CREATE TABLE `database_ej3`.`table` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `telefono` INT NOT NULL,
  PRIMARY KEY (`id`));
  ALTER TABLE `database_ej3`.`table` 
CHANGE COLUMN `telefono` `telefono` VARCHAR(45) NOT NULL ;
ALTER TABLE `database_ej3`.`table` 
RENAME TO  `database_ej3`.`example_table` ;


INSERT INTO `database_ej3`.`table` (`nombre`, `apellido`, `telefono`) VALUES ('Nicolas', 'Mayoral', '2604348538');
INSERT INTO `database_ej3`.`table` (`nombre`, `apellido`, `telefono`) VALUES ('Alexis', 'Lino', '2604798325');
INSERT INTO `database_ej3`.`table` (`nombre`, `apellido`, `telefono`) VALUES ('Julian', 'Castillo ', '2604532791');

SELECT * FROM example_table;