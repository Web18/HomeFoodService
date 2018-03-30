DROP DATABASE  IF EXISTS `home_food_service` ;
CREATE DATABASE `home_food_service`  DEFAULT CHARACTER SET utf8 ;
USE `home_food_service`;
SET NAMES utf8 ;

CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` blob NOT NULL,
  `salt` blob NOT NULL,
  `subscribed` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CustomerID_UNIQUE` (`id`)
);

CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `job_title` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL,
  `password` blob NOT NULL,
  `salt` blob NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
);


CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `name_fr` varchar(100) NOT NULL,
  `image` varchar(100),
  PRIMARY KEY (`id`),
  UNIQUE KEY `CateogoryID_UNIQUE` (`id`)
);

CREATE TABLE `size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `name_fr` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `SizeID_UNIQUE` (`id`)
);

CREATE TABLE `stage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  `name_fr` char(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
);

CREATE TABLE `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_type` varchar(25) NOT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_service_employee_id`
    FOREIGN KEY (`employee_id`)
    REFERENCES `employee` (`id`),
  UNIQUE KEY `CustomerID_UNIQUE` (`id`)
);

CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(45) DEFAULT NULL,
  `address1` varchar(100) NOT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL,
  `postal_code` varchar(100) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `buzzer_number` varchar(45) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_address_customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `customer` (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
);

CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `ingredients` varchar(500) DEFAULT NULL,
  `size_id` int(11) NOT NULL DEFAULT '2',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `name_fr` varchar(50) NOT NULL,
  `description_fr` varchar(500) DEFAULT NULL,
  `image` varchar(100),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`),
  CONSTRAINT `fk_item_size_id`
    FOREIGN KEY (`size_id`)
    REFERENCES `size` (`id`),
  UNIQUE KEY `ItemID_UNIQUE` (`id`)
);

CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_in` date NOT NULL,
  `date_out` date DEFAULT NULL,
  `total_amount` decimal(5,2) NOT NULL,
  `subtotal_amount` decimal(5,2) NOT NULL,
  `delivery_charge` decimal(5,2) NOT NULL,
  `taxes` decimal(5,2) NOT NULL,
  `discount` decimal(5,2) DEFAULT NULL,
  `payment_method` varchar(45) NOT NULL,
  `delivery_address_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  `stage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_order_stage_id`
    FOREIGN KEY (`stage_id`)
    REFERENCES `stage` (`id`),
  CONSTRAINT `fk_order_customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `customer` (`id`),
  CONSTRAINT `fk_order_Service_id`
    FOREIGN KEY (`service_id`)
    REFERENCES `service` (`id`),
  UNIQUE KEY `OrderID_UNIQUE` (`id`)
);

CREATE TABLE `order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_order_item_order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `order` (`id`),
  CONSTRAINT `fk_order_item_item_id`
    FOREIGN KEY (`item_id`)
    REFERENCES `item` (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
);

--
-- Temporary table structure for view `view_en`
--
CREATE ALGORITHM=UNDEFINED 
DEFINER=`root`@`localhost` SQL SECURITY DEFINER 
VIEW `view_en` AS 
select `item`.`id` AS `id`,
       `item`.`image` AS `image`,
       `item`.`name` AS `name`,
       `item`.`price` AS `price`,
       `item`.`description` AS `description`,
       `item`.`ingredients` AS `ingredients`,
       `size`.`name` AS `size`,
       `category`.`name` AS `category` 
from ((`item` join `size` on((`item`.`size_id` = `size`.`id`))) 
              join `category` on((`item`.`category_id` = `category`.`id`))) 
order by `item`.`id` ;

--
-- Final view structure for view `view_fr`
--

CREATE ALGORITHM=UNDEFINED 
DEFINER=`root`@`localhost` SQL SECURITY DEFINER 
VIEW `view_fr` AS 
select `item`.`id` AS `id`,
       `item`.`image` AS `image`,
       `item`.`name_fr` AS `name`,
       `item`.`price` AS `price`,
       `item`.`description_fr` AS `description`,
       `item`.`ingredients` AS `ingredients`,
       `size`.`name_fr` AS `size`,
       `category`.`name_fr` AS `category`
from ((`item` join `size` on((`item`.`size_id` = `size`.`id`))) 
			  join `category` on((`item`.`category_id` = `category`.`id`))) 
order by `category`.`id` ;

