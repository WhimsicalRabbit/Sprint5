CREATE DATABASE `cull_d_ampolla`;
USE `cull_d_ampolla`;

CREATE TABLE IF NOT EXISTS `cull_d_ampolla`.`clients` (
  `clients_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `street` VARCHAR(80) NOT NULL,
  `number` VARCHAR(4) NOT NULL,
  `floor` VARCHAR(2) NOT NULL,
  `door` VARCHAR(4) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `zipcode` INT NOT NULL,
  `country` VARCHAR(56) NOT NULL,
  `phone` VARCHAR(11) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `registration_date` DATE NOT NULL,
  `recommended_client` INT NULL,
  PRIMARY KEY (`clients_id`),
  INDEX `recommended_client_idx` (`recommended_client` ASC),
  CONSTRAINT `recommended_client`
    FOREIGN KEY (`recommended_client`)
    REFERENCES `cull_d_ampolla`.`clients` (`clients_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO `clients` VALUES (1, 'Marlon Bundo', 'Avenue NW Washington', '1600', '2', '1', 'Washington, DC', 20500, 'EEUU', '984287349', 'marlonbundo@gmail.com', '2023-08-15', NULL);
INSERT INTO `clients` VALUES (2, 'Velveteen Rabbit', 'Klein Street', '360', '4', '2', 'Robelside', 80646, 'EEUU', '876125498', 'velveteenrabbit@gmail.com', '2023-10-22', 1);

CREATE TABLE IF NOT EXISTS `cull_d_ampolla`.`suppliers` (
  `supplier_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `street` VARCHAR(80) NOT NULL,
  `number` VARCHAR(4) NOT NULL,
  `floor` VARCHAR(2) NOT NULL,
  `door` VARCHAR(4) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `zipcode` INT NOT NULL,
  `country` VARCHAR(56) NOT NULL,
  `phone` VARCHAR(11) NOT NULL,
  `fax` VARCHAR(9) NOT NULL,
  `NIF` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`supplier_id`))
ENGINE = InnoDB;

INSERT INTO `suppliers` VALUES (1, 'Jumping Jokers', 'Jast Ports', '895', '14', '150', 'Louiefurt', 31250, 'EEUU', '246831249', '152486379', '91931219N');
INSERT INTO `suppliers` VALUES (2, 'Hare Havens', 'Ronda Reina Villa', '8', '3', '20', 'Calahorra', 03532, 'Spain', '394857215', '897564231', '07296389F');

CREATE TABLE IF NOT EXISTS `cull_d_ampolla`.`brands` (
  `brands_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `supplier` INT NOT NULL,
  PRIMARY KEY (`brands_id`),
  INDEX `supplier_idx` (`supplier` ASC),
  CONSTRAINT `supplier`
    FOREIGN KEY (`supplier`)
    REFERENCES `cull_d_ampolla`.`suppliers` (`supplier_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO `brands` VALUES (1, 'BunnyWare', 1);
INSERT INTO `brands` VALUES (2, 'FluffyWhiskers', 2);
INSERT INTO `brands` VALUES (3, 'SoftBunz', 2);

CREATE TABLE IF NOT EXISTS `cull_d_ampolla`.`glasses` (
  `glasses_id` INT NOT NULL,
  `brand` INT NOT NULL,
  `prescription` VARCHAR(45) NOT NULL,
  `frame` VARCHAR(9) NOT NULL,
  `frame_colour` VARCHAR(45) NOT NULL,
  `glass_colour` VARCHAR(45) NOT NULL,
  `price` FLOAT NOT NULL,
  PRIMARY KEY (`glasses_id`),
  INDEX `brand_idx` (`brand` ASC),
  CONSTRAINT `brand`
    FOREIGN KEY (`brand`)
    REFERENCES `cull_d_ampolla`.`brands` (`brands_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO `glasses` VALUES (1, 2, 'OD: -2.00 SPH, -4.00 CYL, Axis 90', 'metallic', 'black', 'white', '45.99');
INSERT INTO `glasses` VALUES (2, 1, 'OD: -4.00 SPH, -2.00 CYL, Axis 90', 'floating', 'brown', 'transparent', '60.00');
INSERT INTO `glasses` VALUES (3, 3, 'OD: -1.00 SPH, -3.00 CYL, Axis 90', 'paste', 'magenta', 'red', '25.45');

CREATE TABLE IF NOT EXISTS`cull_d_ampolla`.`employees` (
  `employees_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`employees_id`))
ENGINE = InnoDB;

INSERT INTO `employees` VALUES (1, 'Max Pain');
INSERT INTO `employees` VALUES (2, 'Alec Azam');

CREATE TABLE IF NOT EXISTS `cull_d_ampolla`.`sales` (
  `sale_id` INT NOT NULL,
  `glasses` INT NOT NULL,
  `client` INT NOT NULL,
  `sold_by` INT NOT NULL,
  `sale_time` DATE NOT NULL,
  PRIMARY KEY (`sale_id`),
  INDEX `glasses_idx` (`glasses` ASC),
  INDEX `client_idx` (`client` ASC),
  INDEX `employee_idx` (`sold_by` ASC),
  CONSTRAINT `glasses`
    FOREIGN KEY (`glasses`)
    REFERENCES `cull_d_ampolla`.`glasses` (`glasses_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `client`
    FOREIGN KEY (`client`)
    REFERENCES `cull_d_ampolla`.`clients` (`clients_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `employee`
    FOREIGN KEY (`sold_by`)
    REFERENCES `cull_d_ampolla`.`employees` (`employees_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO `sales` VALUES (1, 2, 2, 1, '2023-11-01');
INSERT INTO `sales` VALUES (2, 3, 1, 2, '2023-11-05');
