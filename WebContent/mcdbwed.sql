-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mcdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mcdb` ;

-- -----------------------------------------------------
-- Schema mcdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mcdb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema companydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `companydb` ;

-- -----------------------------------------------------
-- Schema companydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `companydb` DEFAULT CHARACTER SET latin1 ;
USE `mcdb` ;

-- -----------------------------------------------------
-- Table `mcdb`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mcdb`.`users` ;

CREATE TABLE IF NOT EXISTS `mcdb`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mcdb`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mcdb`.`address` ;

CREATE TABLE IF NOT EXISTS `mcdb`.`address` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `type` VARCHAR(45) NULL DEFAULT 'home',
  PRIMARY KEY (`id`, `user_id`),
  INDEX `fk_address_users1_idx` (`user_id` ASC),
  CONSTRAINT `fk_address_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mcdb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mcdb`.`employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mcdb`.`employees` ;

CREATE TABLE IF NOT EXISTS `mcdb`.`employees` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `title` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `bio` VARCHAR(200) NULL DEFAULT NULL,
  `admin` TINYINT(1) NULL DEFAULT '0',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mcdb`.`products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mcdb`.`products` ;

CREATE TABLE IF NOT EXISTS `mcdb`.`products` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `catagory` VARCHAR(45) NULL DEFAULT NULL,
  `price` DECIMAL(45,0) NULL DEFAULT NULL,
  `description` VARCHAR(95) NULL DEFAULT NULL,
  `brand` VARCHAR(45) NULL DEFAULT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 100
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mcdb`.`review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mcdb`.`review` ;

CREATE TABLE IF NOT EXISTS `mcdb`.`review` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `product_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  `rating` INT(11) NULL DEFAULT NULL,
  `date` DATE NULL DEFAULT NULL,
  `review` VARCHAR(95) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `product_id`, `user_id`),
  INDEX `fk_review_products1_idx` (`product_id` ASC),
  INDEX `fk_review_users1_idx` (`user_id` ASC),
  CONSTRAINT `fk_review_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `mcdb`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `mcdb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mcdb`.`shoppingcart`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mcdb`.`shoppingcart` ;

CREATE TABLE IF NOT EXISTS `mcdb`.`shoppingcart` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NULL DEFAULT 'shopping',
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  INDEX `fk_shoppingCart_users1_idx` (`user_id` ASC),
  CONSTRAINT `fk_shoppingCart_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mcdb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mcdb`.`shoppingcartitems`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mcdb`.`shoppingcartitems` ;

CREATE TABLE IF NOT EXISTS `mcdb`.`shoppingcartitems` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `shoppingCart_id` INT(11) NOT NULL,
  `products_id` INT(11) NOT NULL,
  `quantity` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_shoppingCart_has_products_products1_idx` (`products_id` ASC),
  INDEX `fk_shoppingCart_has_products_shoppingCart1_idx` (`shoppingCart_id` ASC),
  CONSTRAINT `fk_shoppingCart_has_products_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `mcdb`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_shoppingCart_has_products_shoppingCart1`
    FOREIGN KEY (`shoppingCart_id`)
    REFERENCES `mcdb`.`shoppingcart` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `companydb` ;

-- -----------------------------------------------------
-- Table `companydb`.`locations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `companydb`.`locations` ;

CREATE TABLE IF NOT EXISTS `companydb`.`locations` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `square_footage` INT(11) NULL DEFAULT NULL,
  `street_address` VARCHAR(30) NULL DEFAULT NULL,
  `city` VARCHAR(20) NULL DEFAULT NULL,
  `state` CHAR(2) NULL DEFAULT NULL,
  `zipcode` CHAR(5) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `companydb`.`departments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `companydb`.`departments` ;

CREATE TABLE IF NOT EXISTS `companydb`.`departments` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  `manager_id` INT(11) NOT NULL DEFAULT '0',
  `location_id` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `departments_mgr_u` (`manager_id` ASC),
  INDEX `department_loc_fk` (`location_id` ASC),
  CONSTRAINT `department_loc_fk`
    FOREIGN KEY (`location_id`)
    REFERENCES `companydb`.`locations` (`id`),
  CONSTRAINT `department_mgr_fk`
    FOREIGN KEY (`manager_id`)
    REFERENCES `companydb`.`employees` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `companydb`.`jobs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `companydb`.`jobs` ;

CREATE TABLE IF NOT EXISTS `companydb`.`jobs` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NULL DEFAULT NULL,
  `minimum_salary` INT(11) NULL DEFAULT NULL,
  `maximum_salary` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 33
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `companydb`.`employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `companydb`.`employees` ;

CREATE TABLE IF NOT EXISTS `companydb`.`employees` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(20) NOT NULL,
  `middlename` VARCHAR(20) NULL DEFAULT NULL,
  `lastname` VARCHAR(30) NOT NULL,
  `gender` CHAR(1) NULL DEFAULT NULL,
  `email` VARCHAR(31) NULL DEFAULT NULL,
  `extension` SMALLINT(6) NULL DEFAULT NULL,
  `hiredate` DATE NULL DEFAULT NULL,
  `salary` INT(11) NULL DEFAULT NULL,
  `commission_pct` INT(11) NULL DEFAULT NULL,
  `department_id` INT(11) NOT NULL,
  `job_id` INT(11) NOT NULL,
  `address` VARCHAR(30) NULL DEFAULT NULL,
  `city` VARCHAR(20) NULL DEFAULT NULL,
  `state` CHAR(2) NULL DEFAULT NULL,
  `zipcode` CHAR(5) NULL DEFAULT NULL,
  `version` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `employee_job_fk` (`job_id` ASC),
  INDEX `employee_dept_fk` (`department_id` ASC),
  CONSTRAINT `employee_dept_fk`
    FOREIGN KEY (`department_id`)
    REFERENCES `companydb`.`departments` (`id`),
  CONSTRAINT `employee_job_fk`
    FOREIGN KEY (`job_id`)
    REFERENCES `companydb`.`jobs` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1136
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `companydb`.`projects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `companydb`.`projects` ;

CREATE TABLE IF NOT EXISTS `companydb`.`projects` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(40) NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NULL DEFAULT NULL,
  `parent_project_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `project_parent_project_fk` (`parent_project_id` ASC),
  CONSTRAINT `project_parent_project_fk`
    FOREIGN KEY (`parent_project_id`)
    REFERENCES `companydb`.`projects` (`id`)
    ON DELETE SET NULL)
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `companydb`.`assignments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `companydb`.`assignments` ;

CREATE TABLE IF NOT EXISTS `companydb`.`assignments` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NULL DEFAULT NULL,
  `start_date` DATE NULL DEFAULT NULL,
  `end_date` DATE NULL DEFAULT NULL,
  `employee_id` INT(11) NOT NULL,
  `project_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `assignment_employee_fk` (`employee_id` ASC),
  INDEX `assignment_project_fk` (`project_id` ASC),
  CONSTRAINT `assignment_employee_fk`
    FOREIGN KEY (`employee_id`)
    REFERENCES `companydb`.`employees` (`id`),
  CONSTRAINT `assignment_project_fk`
    FOREIGN KEY (`project_id`)
    REFERENCES `companydb`.`projects` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 61
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
