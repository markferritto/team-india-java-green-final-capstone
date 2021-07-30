BEGIN TRANSACTION;

DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS beers;
DROP TABLE IF EXISTS brewery_beers;
DROP TABLE IF EXISTS owned_brewery;
DROP TABLE IF EXISTS brewer CASCADE;
DROP TABLE IF EXISTS brewery CASCADE;
DROP SEQUENCE IF EXISTS seq_user_id;
DROP SEQUENCE IF EXISTS seq_beer_id;
DROP SEQUENCE IF EXISTS seq_brewer_id;
DROP SEQUENCE IF EXISTS seq_brewery_id;

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
  
CREATE SEQUENCE seq_brewer_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE SEQUENCE seq_brewery_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE brewer (
	brewer_id int DEFAULT nextval('seq_brewer_id'::regclass) NOT NULL,
	name varchar(50) NOT NULL,
	description varchar(400) NOT NULL,
	CONSTRAINT PK_brewer PRIMARY KEY (brewer_id)
);

CREATE TABLE brewery (
	brewery_id int DEFAULT nextval('seq_brewery_id'::regclass) NOT NULL,
	name varchar(50) NOT NULL,
	description varchar(400) NOT NULL,
	address varchar(50) NOT NULL,
	brewer_id int NOT NULL,
	CONSTRAINT PK_brewery PRIMARY KEY (brewery_id),
	CONSTRAINT FK_brewer_id FOREIGN KEY (brewer_id) REFERENCES brewer(brewer_id)
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
	description varchar(400) NOT NULL,
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
	CONSTRAINT FK_beer_id FOREIGN KEY (beer_id) REFERENCES beers(beer_id)
);

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

INSERT INTO brewer (brewer_id, name, description) VALUES (1, 'Jim Doe', 'Loves Beer');
INSERT INTO brewery (brewery_id, name, description, address, brewer_id) VALUES (1, 'Jim Doe Beer', 'Place for all tall dark and handsome men', 'Shareeques House', 1);
INSERT INTO owned_brewery (brewery_id, user_id) VALUES (1, 1);
INSERT INTO beers (beer_id, name, description) VALUES (1, 'Coaches Beer', 'A real booger of a beer');
INSERT INTO brewery_beers (beer_id, brewery_id) VALUES (1, 1);
INSERT INTO reviews (beer_id, description) VALUES (1, 'A beer you dont want to dork around with');


COMMIT TRANSACTION;