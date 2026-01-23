CREATE TABLE IF NOT EXISTS `users` (
	`user_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`name` varchar(255) NOT NULL UNIQUE,
	`email` varchar(255) NOT NULL UNIQUE,
	`username` varchar(255) NOT NULL,
	`pass` varchar(255) NOT NULL,
	PRIMARY KEY (`user_id`)
);

CREATE TABLE IF NOT EXISTS `tool_transactions` (
	`transaction_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`tool_id` int NOT NULL,
	`user_id` int NOT NULL,
	`transaction_type` varchar(255) NOT NULL,
	`quantity` int NOT NULL,
	`date` datetime NOT NULL,
	PRIMARY KEY (`transaction_id`)
);

CREATE TABLE IF NOT EXISTS `tools` (
	`tool_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`name` varchar(255) NOT NULL,
	`type_id` int NOT NULL,
	`barcode` int NOT NULL UNIQUE,
	`price` int NOT NULL,
	`min_quantity` int NOT NULL,
	PRIMARY KEY (`tool_id`)
);

CREATE TABLE IF NOT EXISTS `type` (
	`type_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`type_name` varchar(255) NOT NULL,
	PRIMARY KEY (`type_id`)
);

CREATE TABLE IF NOT EXISTS `stock` (
	`tool_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`quantity` int NOT NULL,
	PRIMARY KEY (`tool_id`)
);


ALTER TABLE `tool_transactions` ADD CONSTRAINT `tool_transactions_fk1` FOREIGN KEY (`tool_id`) REFERENCES `tools`(`tool_id`);

ALTER TABLE `tool_transactions` ADD CONSTRAINT `tool_transactions_fk2` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`);
ALTER TABLE `tools` ADD CONSTRAINT `tools_fk2` FOREIGN KEY (`type_id`) REFERENCES `type`(`type_id`);

ALTER TABLE `stock` ADD CONSTRAINT `stock_fk0` FOREIGN KEY (`tool_id`) REFERENCES `tools`(`tool_id`);