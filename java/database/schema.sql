BEGIN TRANSACTION;

DROP TABLE IF EXISTS beer_type CASCADE;
DROP TABLE IF EXISTS type CASCADE;
DROP TABLE IF EXISTS brewer CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS reviews CASCADE;
DROP TABLE IF EXISTS beers CASCADE;
DROP TABLE IF EXISTS brewery_beers CASCADE;
DROP TABLE IF EXISTS owned_brewery CASCADE;
DROP TABLE IF EXISTS brewery CASCADE;
DROP SEQUENCE IF EXISTS seq_type_id;
DROP SEQUENCE IF EXISTS seq_user_id;
DROP SEQUENCE IF EXISTS seq_beer_id;
DROP SEQUENCE IF EXISTS seq_brewery_id;
DROP SEQUENCE IF EXISTS seq_beer_type_id;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE SEQUENCE seq_beer_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE SEQUENCE seq_brewery_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE SEQUENCE seq_type_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE SEQUENCE seq_beer_type_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE TABLE type (
	type_id int DEFAULT nextval('seq_type_id'::regclass) NOT NULL,
	name varchar(50) NOT NULL,
	CONSTRAINT PK_type_id PRIMARY KEY (type_id)
);

CREATE TABLE beer_type (
	beer_type_id int DEFAULT nextval('seq_beer_type_id'::regclass) NOT NULL,
	name varchar(50) NOT NULL,
	CONSTRAINT PK_beer_type_id PRIMARY KEY (beer_type_id)
);

CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE brewery (
	brewery_id int DEFAULT nextval('seq_brewery_id'::regclass) NOT NULL,
	name varchar(50) NOT NULL,
	description varchar(400) NOT NULL,
	type_id int NOT NULL,
	website_url varchar(100) NOT NULL,
	phone_number varchar(50) NOT NULL,
	street_address varchar(100) NOT NULL,
	city varchar(50) NOT NULL,
	state varchar(50) NOT NULL,
	zip varchar(50) NOT NULL,
	CONSTRAINT FK_type_id FOREIGN KEY (type_id) REFERENCES type(type_id),
	CONSTRAINT PK_brewery PRIMARY KEY (brewery_id)
);

CREATE TABLE owned_brewery (
	brewery_id int NOT NULL,
	user_id int NOT NULL,
	CONSTRAINT FK_brewery_id FOREIGN KEY (brewery_id) REFERENCES brewery(brewery_id),
	CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE beers (
	beer_id int DEFAULT nextval('seq_beer_id'::regclass) NOT NULL,
	name varchar(50) NOT NULL,
	beer_type_id int NOT NULL,
	description varchar(400) NOT NULL,
	CONSTRAINT FK_beer_type_id FOREIGN KEY (beer_type_id) REFERENCES beer_type(beer_type_id),
	CONSTRAINT PK_beer_id PRIMARY KEY (beer_id)
);

CREATE TABLE brewery_beers (
	beer_id int NOT NULL,
	brewery_id int NOT NULL,
	CONSTRAINT FK_beer_id FOREIGN KEY (beer_id) REFERENCES beers(beer_id),
	CONSTRAINT FK_brewery_id FOREIGN KEY (brewery_id) REFERENCES brewery(brewery_id)
);

CREATE TABLE reviews (
	beer_id int NOT NULL,
	description varchar(200) NOT NULL,
	stars int NOT NULL,
	title varchar(100) NOT NULL,
	user_id int NOT NULL,
	CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES users(user_id),
	CONSTRAINT FK_beer_id FOREIGN KEY (beer_id) REFERENCES beers(beer_id)
);

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

INSERT INTO type (type_id, name) VALUES (1, 'Micro Brewery');
INSERT INTO type (type_id, name) VALUES (2, 'Brew Pub');
INSERT INTO type (type_id, name) VALUES (3, 'Taproom Brewery');
INSERT INTO type (type_id, name) VALUES (4, 'Regional Brewery');
INSERT INTO type (type_id, name) VALUES (5, 'Contract brewing Company');
INSERT INTO type (type_id, name) VALUES (6, 'Alternating Propreitor');

INSERT INTO brewery (brewery_id, name, description, type_id, website_url, phone_number, street_address, city, state, zip) VALUES (1, 'Jim Doe Beer', 'Place for anyone', 1, 'testwebsite1.com', '6411234567', 'Test St', 'Test City', 'TS', '12345');
INSERT INTO brewery (brewery_id, name, description, type_id, website_url, phone_number, street_address, city, state, zip) VALUES (2, 'Mark Doe Beer', 'Place for boogers', 1, 'testwebsite2.com', '6411234567', 'Test St', 'Test City', 'TS', '12345');
INSERT INTO brewery (brewery_id, name, description, type_id, website_url, phone_number, street_address, city, state, zip) VALUES (3, 'Anthony Doe Beer', 'Place for dorks', 1, 'testwebsite3.com', '6411234567', 'Test St', 'Test City', 'TS', '12345');
INSERT INTO brewery (brewery_id, name, description, type_id, website_url, phone_number, street_address, city, state, zip) VALUES (4, 'John Doe Beer', 'Place for me', 1, 'testwebsite4.com', '6411234567', 'Test St', 'Test City', 'TS', '12345');
INSERT INTO brewery (brewery_id, name, description, type_id, website_url, phone_number, street_address, city, state, zip) VALUES (5, 'Rumeysa Doe Beer', 'Place for you', 1, 'testwebsite5.com', '6411234567', 'Test St', 'Test City', 'TS', '12345');
INSERT INTO brewery (brewery_id, name, description, type_id, website_url, phone_number, street_address, city, state, zip) VALUES (6, 'Shareeque Doe Beer', 'Place for all tall dark and handsome men', 1, 'testwebsite6.com', '6411234567', 'Test St', 'Test City', 'TS', '12345');

INSERT INTO owned_brewery (brewery_id, user_id) VALUES (1, 1);
INSERT INTO owned_brewery (brewery_id, user_id) VALUES (2, 2);

INSERT INTO beer_type (beer_type_id, name) VALUES (1, 'Pale Ale');
INSERT INTO beer_type (beer_type_id, name) VALUES (2, 'Lager');
INSERT INTO beer_type (beer_type_id, name) VALUES (3, 'Indian Pale Ale');
INSERT INTO beer_type (beer_type_id, name) VALUES (4, 'Stout');
INSERT INTO beer_type (beer_type_id, name) VALUES (5, 'Pilsner');
INSERT INTO beer_type (beer_type_id, name) VALUES (6, 'Porter');

INSERT INTO beers (beer_id, name, beer_type_id, description) VALUES (1, 'Coaches Beer', 1, 'A real booger of a beer');
INSERT INTO beers (beer_id, name, beer_type_id, description) VALUES (2, 'Kevins Beer', 2, 'He will give you a gif');
INSERT INTO beers (beer_id, name, beer_type_id, description) VALUES (3, 'Shareeques Beer', 3, 'Air Force One of a beer');
INSERT INTO beers (beer_id, name, beer_type_id, description) VALUES (4, 'Mark Beer', 4, 'Stop dorkin around');
INSERT INTO beers (beer_id, name, beer_type_id, description) VALUES (5, 'Anthony Beer', 5, 'Couch would approve this beer');
INSERT INTO beers (beer_id, name, beer_type_id, description) VALUES (6, 'Rumeysas Beer', 6, 'Couch would not approve this beer');

INSERT INTO brewery_beers (beer_id, brewery_id) VALUES (1, 6);
INSERT INTO brewery_beers (beer_id, brewery_id) VALUES (2, 5);
INSERT INTO brewery_beers (beer_id, brewery_id) VALUES (3, 4);
INSERT INTO brewery_beers (beer_id, brewery_id) VALUES (4, 3);
INSERT INTO brewery_beers (beer_id, brewery_id) VALUES (5, 2);
INSERT INTO brewery_beers (beer_id, brewery_id) VALUES (6, 1);
INSERT INTO brewery_beers (beer_id, brewery_id) VALUES (1, 4);
INSERT INTO brewery_beers (beer_id, brewery_id) VALUES (2, 3);
INSERT INTO brewery_beers (beer_id, brewery_id) VALUES (3, 5);
INSERT INTO brewery_beers (beer_id, brewery_id) VALUES (4, 1);
INSERT INTO brewery_beers (beer_id, brewery_id) VALUES (5, 2);
INSERT INTO brewery_beers (beer_id, brewery_id) VALUES (6, 6);

INSERT INTO reviews (beer_id, description, stars, title, user_id) VALUES (1, 'A beer you dont want to dork around with', 5, 'Best beer', '1');
INSERT INTO reviews (beer_id, description, stars, title, user_id) VALUES (2, 'A beer you do want to dork around with', 2, 'Worst beer', '1');
INSERT INTO reviews (beer_id, description, stars, title, user_id) VALUES (3, 'A beer you maybe want to dork around with', 3, 'Meh beer', '1');
INSERT INTO reviews (beer_id, description, stars, title, user_id) VALUES (4, 'A beer you absolutely want to dork around with', 1, 'Alright beer', '1');
INSERT INTO reviews (beer_id, description, stars, title, user_id) VALUES (5, 'A beer you absolutely do not want to dork around with', 5, 'Booger beer', '1');
INSERT INTO reviews (beer_id, description, stars, title, user_id) VALUES (6, 'A beer you are curious to dork around with', 4, 'Dork beer', '1');
INSERT INTO reviews (beer_id, description, stars, title, user_id) VALUES (2, 'A beer you want coach to dork around with', 3, 'Terrible beer', '1');
INSERT INTO reviews (beer_id, description, stars, title, user_id) VALUES (3, 'A beer you want Kevin to dork around with', 1, 'Wonderful beer', '1');
INSERT INTO reviews (beer_id, description, stars, title, user_id) VALUES (4, 'A beer you want a dork to dork around with', 0, 'Blast beer', '1');
INSERT INTO reviews (beer_id, description, stars, title, user_id) VALUES (5, 'A beer you never want to dork around with', 1, 'Bomb beer', '1');
INSERT INTO reviews (beer_id, description, stars, title, user_id) VALUES (6, 'A beer you never not want to dork around with', 4, 'Pirate beer', '1');
INSERT INTO reviews (beer_id, description, stars, title, user_id) VALUES (1, 'A beer you will want to dork around with', 5, 'Bootleg beer', '1');

COMMIT TRANSACTION;