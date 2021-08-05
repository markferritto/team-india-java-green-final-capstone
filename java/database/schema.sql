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
	brewery_id int NOT NULL,
	name varchar(50) NOT NULL,
	beer_type_id int NOT NULL,
	description varchar(400) NOT NULL,
	CONSTRAINT FK_beer_type_id FOREIGN KEY (beer_type_id) REFERENCES beer_type(beer_type_id),
	CONSTRAINT FK_brewery_id FOREIGN KEY (brewery_id) REFERENCES brewery(brewery_id),
	CONSTRAINT PK_beer_id PRIMARY KEY (beer_id)
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

INSERT INTO beers (beer_id, brewery_id, name, beer_type_id, description) VALUES (1, 1, 'Coaches Beer', 6, 'Classic, Aged to Perfection');
INSERT INTO beers (beer_id, brewery_id, name, beer_type_id, description) VALUES (7, 1, 'The Malt in our Stars', 5, 'Profound and Original Taste');
INSERT INTO beers (beer_id, brewery_id, name, beer_type_id, description) VALUES (13, 1, 'Who is Jim', 1, 'Smooth and Floral');
INSERT INTO beers (beer_id, brewery_id, name, beer_type_id, description) VALUES (2, 4, 'Kevins Beer', 2, 'Del Corazon de San Salvador');
INSERT INTO beers (beer_id, brewery_id, name, beer_type_id, description) VALUES (8, 4, 'Cask and Ye Shall Receive', 4, 'Serendipitous Coupling of Taste and Smoothness');
INSERT INTO beers (beer_id, brewery_id, name, beer_type_id, description) VALUES (14, 4, 'Back-Draught', 1, 'Quench the Dryest Thirst');
INSERT INTO beers (beer_id, brewery_id, name, beer_type_id, description) VALUES (3, 5, 'Shareeques Beer', 3, 'Air Force One of a beer');
INSERT INTO beers (beer_id, brewery_id, name, beer_type_id, description) VALUES (9, 5, 'Barley and Me', 4, 'Will Bring you to Tears');
INSERT INTO beers (beer_id, brewery_id, name, beer_type_id, description) VALUES (15, 5, 'Hops, in the Name of Love', 6, 'Before You Break My Heart');
INSERT INTO beers (beer_id, brewery_id, name, beer_type_id, description) VALUES (4, 2, 'The Real MVC', 3, 'Stop dorkin around');
INSERT INTO beers (beer_id, brewery_id, name, beer_type_id, description) VALUES (10, 2, 'Yeastbound and Down', 2, 'Will put a Mustache on Your Face');
INSERT INTO beers (beer_id, brewery_id, name, beer_type_id, description) VALUES (16, 2, 'Growler in the Night', 5, 'As Spooky as it is Delicious');
INSERT INTO beers (beer_id, brewery_id, name, beer_type_id, description) VALUES (5, 6, 'The Zero Index', 2, 'Coach would approve this beer');
INSERT INTO beers (beer_id, brewery_id, name, beer_type_id, description) VALUES (11, 6, 'Slap on the Grist', 3, 'Letting You Off Easy, This Time');
INSERT INTO beers (beer_id, brewery_id, name, beer_type_id, description) VALUES (17, 6, 'Cowtown Stout', 4, 'From the Banks of the Olentangy');
INSERT INTO beers (beer_id, brewery_id, name, beer_type_id, description) VALUES (6, 3, 'Method Signature', 6, 'Access Your Tastebuds');
INSERT INTO beers (beer_id, brewery_id, name, beer_type_id, description) VALUES (12, 3, 'Unchecked Exception', 5, 'Youll Get it at Run-time');
INSERT INTO beers (beer_id, brewery_id, name, beer_type_id, description) VALUES (18, 3, 'API IPA', 1, 'A Palindrome to Put you to REST');


INSERT INTO reviews (beer_id, description, stars, title, user_id) VALUES (1, 'A beer you dont want to dork around with', 5, 'Best beer', '1');
INSERT INTO reviews (beer_id, description, stars, title, user_id) VALUES (2, 'A beer you do want to dork around with', 2, 'Worst beer', '1');
INSERT INTO reviews (beer_id, description, stars, title, user_id) VALUES (3, 'A beer you maybe want to dork around with', 3, 'Meh beer', '1');
INSERT INTO reviews (beer_id, description, stars, title, user_id) VALUES (4, 'A beer you absolutely want to dork around with', 1, 'Alright beer', '1');
INSERT INTO reviews (beer_id, description, stars, title, user_id) VALUES (5, 'A beer you absolutely do not want to dork around with', 5, 'Average beer', '1');
INSERT INTO reviews (beer_id, description, stars, title, user_id) VALUES (6, 'A beer you are curious to dork around with', 4, 'Dork beer', '1');
INSERT INTO reviews (beer_id, description, stars, title, user_id) VALUES (2, 'A beer you want coach to dork around with', 3, 'Terrible beer', '1');
INSERT INTO reviews (beer_id, description, stars, title, user_id) VALUES (3, 'A beer you want Kevin to dork around with', 1, 'Wonderful beer', '1');
INSERT INTO reviews (beer_id, description, stars, title, user_id) VALUES (4, 'A beer you want a dork to dork around with', 0, 'Blast beer', '1');
INSERT INTO reviews (beer_id, description, stars, title, user_id) VALUES (5, 'A beer you never want to dork around with', 1, 'Bomb beer', '1');
INSERT INTO reviews (beer_id, description, stars, title, user_id) VALUES (6, 'A beer you never not want to dork around with', 4, 'Pirate beer', '1');
INSERT INTO reviews (beer_id, description, stars, title, user_id) VALUES (1, 'A beer you will want to dork around with', 5, 'Bootleg beer', '1');

--SELECT * , beer_type.name
--FROM beers
--JOIN beer_type ON beers.beer_type_id = beer_type.beer_type_id
--JOIN brewery on brewery.brewery_id = beers.brewery_id
--WHERE brewery.brewery_id = ?

SELECT beer_id, brewery.brewery_id, beer_type.name, beers.name, beers.description
FROM beers
JOIN beer_type ON beers.beer_type_id = beer_type.beer_type_id
JOIN brewery on brewery.brewery_id = beers.brewery_id
WHERE brewery.brewery_id = ?;

COMMIT TRANSACTION;