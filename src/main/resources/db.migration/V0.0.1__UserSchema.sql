CREATE TABLE `bookstore`.`users` (
                                     `id` INT NOT NULL AUTO_INCREMENT,
                                     `email` VARCHAR(100) NOT NULL,
                                     `password` VARCHAR(100) NOT NULL,
                                     `first_name` VARCHAR(45) NULL,
                                     `last_name` VARCHAR(45) NULL,
                                     `city` VARCHAR(45) NULL,
                                     `zip_code` VARCHAR(45) NULL,
                                     `state` VARCHAR(45) NULL,
                                     PRIMARY KEY (`id`),
                                     UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);

ALTER TABLE `bookstore`.`users`
    ADD COLUMN `address` VARCHAR(100) NULL AFTER `state`;

ALTER TABLE `bookstore`.`users`
    ADD UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE;
;



CREATE TABLE `bookstore`.`user_roles` (
                                          `id` INT NOT NULL AUTO_INCREMENT,
                                          `user_id` INT NOT NULL,
                                          `user_role` VARCHAR(45) NOT NULL,
                                          PRIMARY KEY (`id`),
                                          UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
                                          UNIQUE INDEX `ur_unique` (`user_id` ASC, `user_role` ASC) VISIBLE);

ALTER TABLE `bookstore`.`user_roles`
    ADD CONSTRAINT `FK_user_id`
        FOREIGN KEY (`user_id`)
            REFERENCES `bookstore`.`users` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION;

CREATE TABLE `bookstore`.`books` (
                                      `id` INT NOT NULL AUTO_INCREMENT,
                                      `book_name` VARCHAR(100) NOT NULL,
                                      `author` VARCHAR(100) NOT NULL,
                                      `url_image` VARCHAR(100) NULL,
                                      `price` DECIMAL(11) NULL,
                                      `quantity_in_stock` INT NULL,
                                      PRIMARY KEY (`id`),
                                      UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);

ALTER TABLE `bookstore`.`books`
    CHANGE COLUMN `price` `price` DOUBLE NULL DEFAULT NULL ;

ALTER TABLE `bookstore`.`books`
    CHANGE COLUMN `url_image` `url_image` VARCHAR(1000) NULL DEFAULT NULL ;



CREATE TABLE `bookstore`.`orders` (
                                      `id` INT NOT NULL AUTO_INCREMENT,
                                      `user_id` INT NOT NULL,
                                      `status` VARCHAR(45) NOT NULL,
                                      `order_date` DATE NOT NULL,
                                      `shipped_date` DATE NULL,
                                      PRIMARY KEY (`id`),
                                      UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
                                      INDEX `FK_user_id_idx` (`user_id` ASC) VISIBLE,
                                      CONSTRAINT `FK_user`
                                          FOREIGN KEY (`user_id`)
                                              REFERENCES `bookstore`.`users` (`id`)
                                              ON DELETE NO ACTION
                                              ON UPDATE NO ACTION);

ALTER TABLE `bookstore`.`orders`
    CHANGE COLUMN `order_date` `order_date` DATE NULL ;


CREATE TABLE `bookstore`.`order_details` (
                                             `id` INT NOT NULL AUTO_INCREMENT,
                                             `order_id` INT NOT NULL,
                                             `book_id` INT NOT NULL,
                                             `quantity` INT NULL,
                                             PRIMARY KEY (`id`),
                                             UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
                                             INDEX `FK_order_id_idx` (`order_id` ASC) VISIBLE,
                                             INDEX `FK_book_id_idx` (`book_id` ASC) VISIBLE,
                                             CONSTRAINT `FK_order_id`
                                                 FOREIGN KEY (`order_id`)
                                                     REFERENCES `bookstore`.`orders` (`id`)
                                                     ON DELETE NO ACTION
                                                     ON UPDATE NO ACTION,
                                             CONSTRAINT `FK_book_id`
                                                 FOREIGN KEY (`book_id`)
                                                     REFERENCES `bookstore`.`books` (`id`)
                                                     ON DELETE NO ACTION
                                                     ON UPDATE NO ACTION);

ALTER TABLE `bookstore`.`order_details`
    RENAME TO  `bookstore`.`orders_books` ;


