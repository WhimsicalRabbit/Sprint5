DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria CHARACTER SET utf8mb4;
USE pizzeria;

CREATE TABLE `pizzeria`.`clients` (
  `clients_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `adress` VARCHAR(80) NOT NULL,
  `zipcode` INT NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `region` VARCHAR(45) NOT NULL,
  `phone` INT NOT NULL,
  PRIMARY KEY (`clients_id`))
ENGINE = InnoDB;

INSERT INTO clients VALUES (1, "Thumper", "Cottonwood", "12 Meadow Lane Briarwood", 12345, "Hareville", "Burrowland", 987587764),
(2, "Whiskers", "McHoppenstein", "27 Burrow Boulevard", 56789, "Rabbitopia", "Meadowland", 846892648);

CREATE TABLE `pizzeria`.`drinks` (
  `drinks_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT(500) NOT NULL,
  `image` VARCHAR(45) NOT NULL,
  `price` DECIMAL NOT NULL,
  PRIMARY KEY (`drinks_id`))
ENGINE = InnoDB;

INSERT INTO `drinks` VALUES (1, "BunnyBerry Bliss", "Refreshing fruit-infused drink inspired by the playful and lively nature of rabbits.", "./images/drinks/BBB.jpg", "4.59"),
(2, "Hare's Harvest Hoppuccino", "Rich and flavorful coffee-based drink with a touch of seasonal spices, inspired by the elegance and swift nature of hares.", "./images/drinks/HHH.jpg", "5.00");

CREATE TABLE `pizzeria`.`hamburguers` (
  `hamburguers_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT(500) NOT NULL,
  `image` VARCHAR(45) NOT NULL,
  `price` DECIMAL NOT NULL,
  PRIMARY KEY (`hamburguers_id`))
ENGINE = InnoDB;

INSERT INTO `hamburguers` VALUES (1, "Azure Dragon Burger", "Blue-tinted bun made with natural ingredients like butterfly pea flower extract. The patty is a delicious blend of seafood with a base of grilled fish or shrimp, reflecting the blue dragon's ocean habitat. Crisp lettuce, sliced cucumber, and a zesty citrus-infused aioli to capture the essence of the creature's aquatic surroundings. A visually striking burguer with a flavorful nod to the blue dragon.", "./images/hamburguers/ABD", 9.50),
(2, "ArachnoViper Delight Burger", "Char-grilled lamb patty, speckled bun to mimic the viper's scales, jalapeño-infused sauce or pepper jack cheese to represent the viper's horned features, crispy fried onions or potato sticks resembling spider legs, fresh arugula, this burger offers a bold and adventurous combination of flavors, capturing the essence of the spider-tailed horned viper in a delicious meal.", "./images/hamburguers/ABD", 12.45);

CREATE TABLE IF NOT EXISTS `pizzeria`.`pizzas_category` (
  `pizzas_category_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`pizzas_category_id`))
ENGINE = InnoDB;

INSERT INTO `pizzas_category` VALUES (1, "with meat"), (2, "vegetarian"), (3, "Vegan");

CREATE TABLE `pizzeria`.`pizzas` (
  `pizzas_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT(500) NOT NULL,
  `image` VARCHAR(45) NOT NULL,
  `price` DECIMAL NOT NULL,
  `category` INT NOT NULL,
  PRIMARY KEY (`pizzas_id`),
  INDEX `pizzas_category_idx` (`category` ASC),
    FOREIGN KEY (`category`)
    REFERENCES `pizzeria`.`pizzas_category` (`pizzas_category_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO `pizzas` VALUES (1, "Oceanic Hare Haven Pizza", "Standard pizza dough for the base, creamy garlic and herb sauce to represent the soft and fluffy nature of the sea bunny, mozzarella cheese for the main body of the sea bunny., edible 'ears' using mushroom slices or pepperoni, thin strips of crispy seaweed to mimic the sea bunny's delicate whiskers, small pieces of shrimp or calamari to represent the sea bunny's tail, edible flowers and fresh herbs for a burst of color, reminiscent of the sea bunny's natural habitat.", "./images/pizzas/OHHP", 12.75, 1), 
(2, "Woodland Harmony Pizza", "traditional pizza dough for the base, olive oil and garlic base for a light and flavorful foundation, blend of mozzarella and feta cheese sautéed spinach, caramelized onions, and artichoke hearts for a savory and earthy mix representing the hare's vegetarian delights, sliced red and yellow bell peppers, cherry tomatoes, and roasted butternut squash for a colorful and sweet combination inspired by the fox's palette, assorted mushrooms for added umami and a nod to the forest floor.", "./image/pizzas/WHP", 10.85, 2);

CREATE TABLE `pizzeria`.`stores` (
  `stores_id` INT NOT NULL,
  `adress` VARCHAR(80) NOT NULL,
  `zipcode` INT NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `region` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`stores_id`))
ENGINE = InnoDB;

INSERT INTO `stores` VALUES (1, "42 Sylvan Lane", 67890, "Woodland Haven", "Wilderness Realm");

CREATE TABLE `pizzeria`.`employees` (
  `employees_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `nif` VARCHAR(9) NOT NULL,
  `phone` INT NOT NULL,
  `type` ENUM("cook", "dealer") NOT NULL,
  `store` INT NULL,
  PRIMARY KEY (`employees_id`),
  INDEX `store_idx` (`store` ASC),
  CONSTRAINT `store`
    FOREIGN KEY (`store`)
    REFERENCES `pizzeria`.`stores` (`stores_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO `employees` VALUES (1, "Coco", "Doodlewhisker", "47192794Z", 358748951, "cook", 1), 
(2, "Cinnabun", "Ticklebottom", "27297214D", 358748951, "dealer", NULL);

CREATE TABLE `pizzeria`.`orders` (
  `orders_id` INT NOT NULL,
  `date` DATE NOT NULL,
  `ordering_type` ENUM("delivery", "pickup") NOT NULL,
  `price` DECIMAL NOT NULL,
  `client` INT NOT NULL,
  `dealer` INT NULL,
  `delivery_time` DATE NOT NULL,
  `store` INT NOT NULL,
  PRIMARY KEY (`orders_id`),
  INDEX `client_idx` (`client` ASC),
  INDEX `dealer_idx` (`dealer` ASC),
  INDEX `store_idx` (`store` ASC),
  CONSTRAINT `client`
    FOREIGN KEY (`client`)
    REFERENCES `pizzeria`.`clients` (`clients_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `dealer`
    FOREIGN KEY (`dealer`)
    REFERENCES `pizzeria`.`employees` (`employees_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `stores`
    FOREIGN KEY (`store`)
    REFERENCES `pizzeria`.`stores` (`stores_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO `orders` VALUES (1, "2018/10/15", "pickup", 11, 1, NULL, "2018/10/15", 1);

CREATE TABLE `pizzeria`.`pizzas_quantity` (
  `pizzas_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `order_id` INT NOT NULL,
  INDEX `order_idx` (`order_id` ASC),
  INDEX `pizza_idx` (`pizzas_id` ASC),
  CONSTRAINT `order`
    FOREIGN KEY (`order_id`)
    REFERENCES `pizzeria`.`orders` (`orders_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `pizza`
    FOREIGN KEY (`pizzas_id`)
    REFERENCES `pizzeria`.`pizzas` (`pizzas_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO `pizzas_quantity` VALUES (1, 1, 1);

CREATE TABLE IF NOT EXISTS `pizzeria`.`drinks_quantity` (
  `drink_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `order_id` INT NOT NULL,
  INDEX `order_idx` (`order_id` ASC),
  CONSTRAINT `order_drink`
    FOREIGN KEY (`order_id`)
    REFERENCES `pizzeria`.`orders` (`orders_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `drink`
    FOREIGN KEY (`drink_id`)
    REFERENCES `pizzeria`.`drinks` (`drinks_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE `pizzeria`.`hamburguers_quantity` (
  `hamburguers_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `order_id` INT NOT NULL,
  INDEX `order_idx` (`order_id` ASC),
  INDEX `hamburguer_idx` (`hamburguers_id` ASC),
  CONSTRAINT `orders_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `pizzeria`.`orders` (`orders_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `hamburguer`
    FOREIGN KEY (`hamburguers_id`)
    REFERENCES `pizzeria`.`hamburguers` (`hamburguers_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
