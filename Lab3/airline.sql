CREATE TABLE IF NOT EXISTS `airline` (
	`airline_id` int AUTO_INCREMENT NOT NULL,
	`airline_name` varchar(50) NOT NULL,
	`country` varchar(40) NOT NULL,
	`headquarters_city` varchar(40),
	PRIMARY KEY (`airline_id`)
);
CREATE TABLE IF NOT EXISTS `airplane` (
	`airplane_id` int AUTO_INCREMENT NOT NULL,
	`model` varchar(40) NOT NULL,
	`capacity` int NOT NULL,
	`manufacture_year` int NOT NULL,
	`airline_id` int NOT NULL,
	PRIMARY KEY (`airplane_id`)
);
CREATE TABLE IF NOT EXISTS `employee` (
	`employee_id` int AUTO_INCREMENT NOT NULL,
	`user_name` varchar(30) NOT NULL,
	`first_name` varchar(30) NOT NULL,
	`last_name` varchar(30) NOT NULL,
	`position` varchar(25) NOT NULL,
	`employment_date` date NOT NULL,
	`airline_id` int,
	`manager_id` int,
	`rate` float NOT NULL,
	`bonus` float,
	PRIMARY KEY (`employee_id`)
);
CREATE TABLE IF NOT EXISTS `flight` (
	`flight_id` int AUTO_INCREMENT NOT NULL,
	`flight_number` varchar(15) NOT NULL,
	`departure_city` varchar(40) NOT NULL,
	`arrival_city` varchar(40) NOT NULL,
	`departure_time` datetime NOT NULL,
	`arrival_time` datetime NOT NULL,
	`airplane_id` int NOT NULL,
	PRIMARY KEY (`flight_id`)
);
CREATE TABLE IF NOT EXISTS `flight_crew` (
	`crew_id` int AUTO_INCREMENT NOT NULL,
	`flight_id` int NOT NULL,
	`employee_id` int NOT NULL,
	`crew_role` varchar(30) NOT NULL,
	PRIMARY KEY (`crew_id`)
);
CREATE TABLE IF NOT EXISTS `customer` (
	`customer_id` int AUTO_INCREMENT NOT NULL,
	`first_name` varchar(30) NOT NULL,
	`last_name` varchar(30) NOT NULL,
	`gender` varchar(1) NOT NULL,
	`birth_date` date NOT NULL,
	`phone_number` varchar(15) NOT NULL,
	`email` varchar(50) NOT NULL,
	`passport_number` varchar(20) NOT NULL,
	PRIMARY KEY (`customer_id`)
);
CREATE TABLE IF NOT EXISTS `ticket` (
	`ticket_id` int AUTO_INCREMENT NOT NULL,
	`flight_id` int NOT NULL,
	`customer_id` int NOT NULL,
	`employee_id` int,
	`seat_number` varchar(5),
	`price` float NOT NULL,
	`seat_class` varchar(20) NOT NULL,
	`transaction_type` varchar(20) NOT NULL,
	`transaction_moment` datetime NOT NULL,
	PRIMARY KEY (`ticket_id`)
);
ALTER TABLE `airplane` ADD CONSTRAINT `airplane_fk4` FOREIGN KEY (`airline_id`) REFERENCES `airline`(`airline_id`);
ALTER TABLE `employee` ADD CONSTRAINT `employee_fk6` FOREIGN KEY (`airline_id`) REFERENCES `airline`(`airline_id`);
ALTER TABLE `employee` ADD CONSTRAINT `employee_fk7` FOREIGN KEY (`manager_id`) REFERENCES `employee`(`employee_id`);
ALTER TABLE `flight` ADD CONSTRAINT `flight_fk6` FOREIGN KEY (`airplane_id`) REFERENCES `airplane`(`airplane_id`);
ALTER TABLE `flight_crew` ADD CONSTRAINT `flight_crew_fk1` FOREIGN KEY (`flight_id`) REFERENCES `flight`(`flight_id`);
ALTER TABLE `flight_crew` ADD CONSTRAINT `flight_crew_fk2` FOREIGN KEY (`employee_id`) REFERENCES `employee`(`employee_id`);
ALTER TABLE `ticket` ADD CONSTRAINT `ticket_fk1` FOREIGN KEY (`flight_id`) REFERENCES `flight`(`flight_id`);
ALTER TABLE `ticket` ADD CONSTRAINT `ticket_fk2` FOREIGN KEY (`customer_id`) REFERENCES `customer`(`customer_id`);
ALTER TABLE `ticket` ADD CONSTRAINT `ticket_fk3` FOREIGN KEY (`employee_id`) REFERENCES `employee`(`employee_id`);