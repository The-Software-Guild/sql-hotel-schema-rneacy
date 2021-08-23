DROP DATABASE hotel;
CREATE DATABASE hotel;

USE hotel;

CREATE TABLE amenity(
	id INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(20)
);

CREATE TABLE room(
	num INT PRIMARY KEY AUTO_INCREMENT,
	size ENUM('Double', 'Single', 'Suite'),
	ada_access BOOL,
	std_occ TINYINT,
	max_occ TINYINT,
	base_price INT,
	ext_person INT
);

CREATE table room_amenity(
	room_num INT,
	amenity_id INT,
	PRIMARY KEY(room_num, amenity_id),
	FOREIGN KEY(room_num) REFERENCES room(num),
	FOREIGN KEY(amenity_id) REFERENCES amenity(id)
);

CREATE TABLE guest(
	id INT PRIMARY KEY AUTO_INCREMENT,
	forename VARCHAR(50),
	surname VARCHAR(50),
	address VARCHAR(255),
	city VARCHAR(50),
	state CHAR(2),
	zip CHAR(5),
	phone VARCHAR(50)
);

CREATE TABLE reservation(
	id INT PRIMARY KEY AUTO_INCREMENT,
	room_num INT,
	guest_id INT,
	n_adults INT,
	n_child INT,
	START DATE,
	END DATE,
	FOREIGN KEY(room_num) REFERENCES room(num),
	FOREIGN KEY(guest_id) REFERENCES guest(id)
);