-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mcdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mcdb` ;

-- -----------------------------------------------------
-- Schema mcdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mcdb` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
SHOW WARNINGS;
USE `mcdb` ;

-- -----------------------------------------------------
-- Table `products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(45) NULL,
  `price` DECIMAL(45) NULL,
  `description` VARCHAR(95) NULL,
  `brand` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `address` VARCHAR(45) NULL,
  `type` VARCHAR(45) NULL DEFAULT 'home',
  PRIMARY KEY (`id`, `user_id`),
  CONSTRAINT `fk_address_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_address_users1_idx` ON `address` (`user_id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `shoppingCart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shoppingCart` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NULL DEFAULT 'shopping',
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  CONSTRAINT `fk_shoppingCart_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_shoppingCart_users1_idx` ON `shoppingCart` (`user_id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `review` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `rating` INT NULL,
  `date` DATE NULL,
  `review` VARCHAR(95) NULL,
  PRIMARY KEY (`id`, `product_id`, `user_id`),
  CONSTRAINT `fk_review_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_review_products1_idx` ON `review` (`product_id` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_review_users1_idx` ON `review` (`user_id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `title` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `bio` VARCHAR(200) NULL,
  `admin` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `shoppingCartItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shoppingCartItems` (
  `id` INT NOT NULL,
  `shoppingCart_id` INT NOT NULL,
  `products_id` INT NOT NULL,
  `quantity` INT NULL,
  PRIMARY KEY (`id`, `shoppingCart_id`, `products_id`),
  CONSTRAINT `fk_shoppingCart_has_products_shoppingCart1`
    FOREIGN KEY (`shoppingCart_id`)
    REFERENCES `shoppingCart` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_shoppingCart_has_products_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_shoppingCart_has_products_products1_idx` ON `shoppingCartItems` (`products_id` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_shoppingCart_has_products_shoppingCart1_idx` ON `shoppingCartItems` (`shoppingCart_id` ASC);

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `products`
-- -----------------------------------------------------
START TRANSACTION;
USE `mcdb`;
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (1, 'Power Supply', 24.99, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Corsair', 'Corsair 90X');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (2, 'Power Supply', 20.99, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Corsair', 'Corsair 85 W S');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (3, 'Power Supply', 30, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Corsair', 'Corsair 750 W');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (4, 'Power Supply', 24, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Corsair', 'C 130 W');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (5, 'Power Supply', 25, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Corsair', 'PSU Corsair 750');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (6, 'Power Supply', 24.9, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Corsair', 'Corsair AX90');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (7, 'Power Supply', 20.1, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Corsair', 'Corsair CX 20');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (8, 'Power Supply', 35.12, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'White Cloud', 'WC 190');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (9, 'Power Supply', 20, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'White Cloud', 'WC 5939');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (10, 'Power Supply', 15, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'White Cloud', 'WC 2029 700 W');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (11, 'Power Supply', 12, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'White Cloud', 'AWC 2XC 750 W');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (12, 'Power Supply', 30, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'White Cloud', 'AWC 3XC 800 W');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (13, 'Power Supply', 31, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'White Cloud', 'WC Shocker 2');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (14, 'Power Supply', 12, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'White Cloud', 'WC Rec 292');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (15, 'Power Supply', 30, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'White Cloud', 'WC 292');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (16, 'Power Supply', 25, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Wattage PSU', 'WPSU 101');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (17, 'Power Supply', 23, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Wattage PSU', 'WPSU 202');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (18, 'Power Supply', 26, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Wattage PSU', 'WPSU 4303');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (19, 'Power Supply', 70, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Wattage PSU', 'WPSU 540');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (20, 'Power Supply', 25, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Wattage PSU', 'WPSU 200');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (21, 'Power Supply', 120, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Wattage PSU', 'WPSU 300');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (22, 'Power Supply', 20, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Wattage PSU', 'WPSU 101-X');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (23, 'Power Supply', 20, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Wattage PSU', 'WPSU 202-Y');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (24, 'Power Supply', 18, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Wattage PSU', 'WPSU 303-Y');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (25, 'Power Supply', 17, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Wattage PSU', 'WPSU 202-X');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (26, 'Computer Case', 30, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Corsair', 'Corsair Avenger');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (27, 'Computer Case', 30, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Corsair', 'Corsair Revenant');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (28, 'Computer Case', 40, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Corsair', 'Corsair Pirate');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (29, 'Computer Case', 40, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Corsair', 'Corsair Protector');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (30, 'Computer Case', 37, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Corsair', 'Corsair Rear Guard');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (31, 'Computer Case', 55, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Corsair', 'Corsair Van Guard');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (32, 'Computer Case', 65, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Corsair', 'Corsair Soccer Mom');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (33, 'Computer Case', 80, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Corsair', 'Corsair Stay At Home Dad');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (34, 'Computer Case', 20, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Corsair', 'Corsair Man Van');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (35, 'Computer Case', 21, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Corsair', 'Corsair Tissue ');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (36, 'Computer Case', 15, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Corsair', 'Corsair Spectacle');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (37, 'Computer Case', 39, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Corsair', 'Corsair Calvary');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (38, 'Computer Case', 65, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Ocean Gate', 'Ocean Gate Katrina');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (39, 'Computer Case', 65, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Ocean Gate', 'Ocean Gate Mandy');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (40, 'Computer Case', 52, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Ocean Gate', 'Ocean Gate Red Line');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (41, 'Computer Case', 50, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Ocean Gate', 'Ocean Gate Nancy');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (42, 'Computer Case', 20, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Ocean Gate', 'Ocean Gate Remy');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (43, 'Computer Case', 80, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Ocean Gate', 'Ocean Gate Daddy Issues');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (44, 'Computer Case', 120, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Ocean Gate', 'Ocean Gate Cinema');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (45, 'Computer Case', 98, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Ocean Gate', 'Ocean Gate Meme');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (46, 'CPU', 399, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'UnIntel', 'UnIntel CPU 650');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (47, 'CPU', 450, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'UnIntel', 'UnIntel CPU 220');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (48, 'CPU', 150, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'UnIntel', 'Unintel 4670K');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (49, 'CPU', 190, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'UnIntel', 'Unintel 2349K');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (50, 'CPU', 250, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'UnIntel', 'Unintel 2921K');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (51, 'CPU', 459, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'UnIntel', 'Unintel 4932K');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (52, 'CPU', 360, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'UnIntel', 'Unintel 1231K');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (53, 'CPU', 500, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'UnIntel', 'Unintel Advanced 4932 K-X');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (54, 'CPU', 630, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'UnIntel', 'Unintel FeatherWeight 3320K-X');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (55, 'CPU', 750, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'UnIntel', 'Unintel 1238-X K');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (56, 'CPU', 700, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'DMA', 'DMA Radiant');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (57, 'CPU', 630, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'DMA', 'DMA Shining');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (58, 'CPU', 250, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'DMA', 'DMA Help Please');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (59, 'CPU', 120, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'DMA', 'DMA Reddit Browser');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (60, 'CPU', 250, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'DMA', 'DMA Dalliance');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (61, 'CPU', 350, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'DMA', 'DMA Radiant');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (62, 'CPU', 300, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'DMA', 'DMA Dart');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (63, 'CPU', 300, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'DMA', 'DMA Smart Dart');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (64, 'CPU', 350, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'DMA', 'DMA Meerkat');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (65, 'Mother Board', 200, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Asus', 'Asus Cup');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (66, 'Mother Board', 200, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Asus', 'Asus MotherBored');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (67, 'Mother Board', 250, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Asus', 'Asus Libre');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (68, 'Mother Board', 225, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Asus', 'Asus Caliber');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (69, 'Mother Board', 230, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'AsRock', 'ASRock Rock');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (70, 'Mother Board', 290, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'AsRock', 'ASRock Boulder');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (71, 'Mother Board', 310, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'AsRock', 'ASRock Mesa');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (72, 'Mother Board', 380, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'AsRock', 'ASRock Mountain');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (73, 'Mother Board', 259, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'AsRock', 'ASRock Cliff');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (74, 'Mother Board', 700, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'AsRock', 'ASRock Gentle Sloping Hill');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (75, 'Mother Board', 850, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Mother Ship', 'Mother Ship Xenu');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (76, 'Mother Board', 980, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Mother Ship', 'Mother Ship Frock Nbiru');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (77, 'Mother Board', 202, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Mother Ship', 'Mother Ship A51');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (78, 'Mother Board', 321, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Mother Ship', 'Mother Ship Independence');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (79, 'Mother Board', 450, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Mother Ship', 'Mother Ship Radiate');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (80, 'Mother Board', 500, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Mother Ship', 'Mother Ship Invasion');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (81, 'GPU', 70, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Me Force', 'Me Force GTX-780');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (82, 'GPU', 120, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Me Force', 'Me Force GTX-750');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (83, 'GPU', 130, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Me Force', 'Me Force GTX-800');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (84, 'GPU', 120, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Me Force', 'Me Force MyTan ');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (85, 'GPU', 200, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Me Force', 'Me Force McDouble');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (86, 'GPU', 250, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Me Force', 'Me Force Something');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (87, 'GPU', 300, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Mvidia', 'Mvidia General');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (88, 'GPU', 500, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Mvidia', 'Mvidia Captain');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (89, 'GPU', 700, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Mvidia', 'Mvidia Private');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (90, 'Data Storage', 30, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Eastern Analog', 'Eastern Analog 1Tb SSD');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (91, 'Data Storage', 50, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Eastern Analog', 'Eastern Analog 2 Tb SSD');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (92, 'Data Storage', 300, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Ocean Gate', 'Ocean Gate Habitat 1Tb HDD');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (93, 'Data Storage', 120, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Ocean Gate', 'Ocean Gate Bio 2 Tb HDD');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (94, 'RAM', 80, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Corsair', 'Corsair SpeedyFast Ram');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (95, 'RAM', 120, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Corsair', 'Corsair Some Fast Ram');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (96, 'RAM', 150, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Mvidia', 'Mvidia BrainBow Road');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (97, 'FANS', 20, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Corsair', 'SYS ‰ÛÒ 100 Fan');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (98, 'FANS', 15, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Ocean Gate', 'Gate 240 Fan');
INSERT INTO `products` (`id`, `category`, `price`, `description`, `brand`, `name`) VALUES (99, 'FANS', 15, ' Salami landjaeger chuck chicken alcatra porchetta. Turkey pork loin ball tip swine doner cow. Corned beef swine pork, turducken ground round turkey chuck ham shank boudin venison. Pork loin sausage drumstick flank salami pancetta prosciutto. Jowl bacon andouille venison.', 'Corsair', 'Ship 180 Fan');

COMMIT;

