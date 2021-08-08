BEGIN TRANSACTION;

DROP TABLE IF EXISTS beer_type CASCADE;
DROP TABLE IF EXISTS type CASCADE;
DROP TABLE IF EXISTS brewer CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS brewery_reviews CASCADE;
DROP TABLE IF EXISTS beer_reviews CASCADE;
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
	ABV varchar(5),
	CONSTRAINT FK_beer_type_id FOREIGN KEY (beer_type_id) REFERENCES beer_type(beer_type_id),
	CONSTRAINT FK_brewery_id FOREIGN KEY (brewery_id) REFERENCES brewery(brewery_id),
	CONSTRAINT PK_beer_id PRIMARY KEY (beer_id)
);

CREATE TABLE brewery_reviews (
	brewery_id int NOT NULL,
	description varchar(200) NOT NULL,
	stars decimal NOT NULL,
	title varchar(100) NOT NULL,
	username varchar(100) NOT NULL,
	CONSTRAINT FK_brewery_id FOREIGN KEY (brewery_id) REFERENCES brewery(brewery_id)
);

CREATE TABLE beer_reviews (
	beer_id int NOT NULL,
	description varchar(200) NOT NULL,
	stars decimal NOT NULL,
	title varchar(100) NOT NULL,
	username varchar(100) NOT NULL,
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

INSERT INTO brewery (brewery_id, name, description, type_id, website_url, phone_number, street_address, city, state, zip) VALUES (1, 'John Doe Beer', 'Place for anyone and no one at the same time', 1, 'testwebsite1.com', '614-555-9991', 'Test St', 'Columbus', 'OH', '12345');
INSERT INTO brewery (brewery_id, name, description, type_id, website_url, phone_number, street_address, city, state, zip) VALUES (2, 'Six-One-Pour', 'The biggest, small brewery youll ever see', 1, 'testwebsite2.com', '614-555-9992', '1661 Hilliard Rome rd', 'Columbus', 'OH', '43228');
INSERT INTO brewery (brewery_id, name, description, type_id, website_url, phone_number, street_address, city, state, zip) VALUES (3, 'Encapsulate Brewing', 'Only go-getters allowed', 1, 'testwebsite3.com', '614-555-9993', '1275 Kinnear Rd', 'Columbus', 'OH', '43212');
INSERT INTO brewery (brewery_id, name, description, type_id, website_url, phone_number, street_address, city, state, zip) VALUES (4, 'The Lone Swallowtail', 'Standard of Ohio', 1, 'testwebsite4.com', '614-555-9994', '33 e Gay St', 'Columbus', 'OH', '43215');
INSERT INTO brewery (brewery_id, name, description, type_id, website_url, phone_number, street_address, city, state, zip) VALUES (5, 'Deck Escalator', 'Hang out and talk DIY projects around the house with the other dads', 1, 'testwebsite5.com', '614-555-9995', '525 e Tompkins st', 'Columbus', 'OH', '43202');
INSERT INTO brewery (brewery_id, name, description, type_id, website_url, phone_number, street_address, city, state, zip) VALUES (6, 'Ope Brewing', 'Oh oops, can I just get by ya there? "its an Ohio thing"', 1, 'testwebsite6.com', '614-555-9996', '577 S State st', 'Columbus', 'OH', '43081');

INSERT INTO owned_brewery (brewery_id, user_id) VALUES (1, 1);
INSERT INTO owned_brewery (brewery_id, user_id) VALUES (2, 2);

INSERT INTO beer_type (beer_type_id, name) VALUES (1, 'Pale Ale');
INSERT INTO beer_type (beer_type_id, name) VALUES (2, 'Lager');
INSERT INTO beer_type (beer_type_id, name) VALUES (3, 'Indian Pale Ale');
INSERT INTO beer_type (beer_type_id, name) VALUES (4, 'Stout');
INSERT INTO beer_type (beer_type_id, name) VALUES (5, 'Pilsner');
INSERT INTO beer_type (beer_type_id, name) VALUES (6, 'Porter');

INSERT INTO beers (brewery_id, name, beer_type_id, description, ABV) VALUES (1, 'Coaches Beer', 6, 'Classic, Aged to Perfection', '6.2%');
INSERT INTO beers (brewery_id, name, beer_type_id, description, ABV) VALUES (1, 'The Malt in our Stars', 5, 'Profound and Original Taste', '4%');
INSERT INTO beers (brewery_id, name, beer_type_id, description, ABV) VALUES (1, 'Who is Jim', 1, 'Smooth and Floral', '5.7%');
INSERT INTO beers (brewery_id, name, beer_type_id, description, ABV) VALUES (4, 'Kevins Beer', 2, 'Del Corazon de San Salvador', '7%');
INSERT INTO beers (brewery_id, name, beer_type_id, description, ABV) VALUES (4, 'Cask and Ye Shall Receive', 4, 'Serendipitous Coupling of Taste and Smoothness', '4.5%');
INSERT INTO beers (brewery_id, name, beer_type_id, description, ABV) VALUES (4, 'Back-Draught', 1, 'Quench the Dryest Thirst', '5.4%');
INSERT INTO beers (brewery_id, name, beer_type_id, description, ABV) VALUES (5, 'Shareeques Beer', 3, 'Air Force One of a beer', '4%');
INSERT INTO beers (brewery_id, name, beer_type_id, description, ABV) VALUES (5, 'Barley and Me', 4, 'Will Bring you to Tears', '5%');
INSERT INTO beers (brewery_id, name, beer_type_id, description, ABV) VALUES (5, 'Hops, in the Name of Love', 6, 'Before You Break My Heart', '9%');
INSERT INTO beers (brewery_id, name, beer_type_id, description, ABV) VALUES (2, 'The Real MVC', 3, 'Stop dorkin around', '4.5%');
INSERT INTO beers (brewery_id, name, beer_type_id, description, ABV) VALUES (2, 'Yeastbound and Down', 2, 'Will put a Mustache on Your Face', '7%');
INSERT INTO beers (brewery_id, name, beer_type_id, description, ABV) VALUES (2, 'Growler in the Night', 5, 'As Spooky as it is Delicious', '4.5%');
INSERT INTO beers (brewery_id, name, beer_type_id, description, ABV) VALUES (6, 'The Zero Index', 2, 'Coach would approve this beer', '5%');
INSERT INTO beers (brewery_id, name, beer_type_id, description, ABV) VALUES (6, 'Slap on the Grist', 3, 'Letting You Off Easy, This Time', '10%');
INSERT INTO beers (brewery_id, name, beer_type_id, description, ABV) VALUES (6, 'Cowtown Stout', 4, 'From the Banks of the Olentangy', '12%');
INSERT INTO beers (brewery_id, name, beer_type_id, description, ABV) VALUES (3, 'Method Signature', 6, 'Access Your Tastebuds', '6%');
INSERT INTO beers (brewery_id, name, beer_type_id, description, ABV) VALUES (3, 'Unchecked Exception', 5, 'Youll Get it at Run-time', '3%');
INSERT INTO beers (brewery_id, name, beer_type_id, description, ABV) VALUES (3, 'API IPA', 1, 'A Palindrome to Put you to REST', '4.5%');
INSERT INTO beers (brewery_id, name, beer_type_id, description, ABV) VALUES (6, 'Honey Shark', 1, 'The Sweetest Tooth in the Sea', '10%');

INSERT INTO brewery_reviews (brewery_id, description, stars, title, username) VALUES (1, 'I love that it felt like no one knew my name', 5, 'Excellent ambience', 'Brewnonymous');
INSERT INTO brewery_reviews (brewery_id, description, stars, title, username) VALUES (2, 'Parking is tough downtown, but it is worth it for this brewery', 4, 'Great staff, will be coming back!', 'Donna1959');
INSERT INTO brewery_reviews (brewery_id, description, stars, title, username) VALUES (3, 'Seemed limited, Like they were keeping something from me', 2, 'Meh beer', 'NoseyMan');
INSERT INTO brewery_reviews (brewery_id, description, stars, title, username) VALUES (4, 'It can be nice when people step aside and let you pass, but at some point it gets weird when everyone does it', 3, 'Alright beer', 'CaliforniaK1d');
INSERT INTO brewery_reviews (brewery_id, description, stars, title, username) VALUES (5, 'I went for a beer and left with friends who helped me make a pool table', 4, 'Wow, what a spot!', 'Gr8fu11');
INSERT INTO brewery_reviews (brewery_id, description, stars, title, username) VALUES (6, 'Under the radar, where it belongs', 1, 'Dork beer', 'Anonymous');
INSERT INTO brewery_reviews (brewery_id, description, stars, title, username) VALUES (2, 'The heart of midwest brewing', 5, 'Phenomenal environment!', 'CoachStevePassword123');
INSERT INTO brewery_reviews (brewery_id, description, stars, title, username) VALUES (3, 'They know what they do and they do it well', 5, 'Wonderful beer', 'HipsterShmipster');
INSERT INTO brewery_reviews (brewery_id, description, stars, title, username) VALUES (4, 'Good time with family, pleasant staff, perfect service', 5, 'Outstanding experience', 'Karen');
INSERT INTO brewery_reviews (brewery_id, description, stars, title, username) VALUES (5, 'I came to have a good time, I left with three different blueprints for a doghouse', 1, 'Lumber nerds', 'yousername');
INSERT INTO brewery_reviews (brewery_id, description, stars, title, username) VALUES (6, 'Milquetoast but charming', 4, 'Well-mannered and unsurprising', 'Nunya Bidness');
INSERT INTO brewery_reviews (brewery_id, description, stars, title, username) VALUES (1, 'It seemed like they got this beer from someone who made it in their basement', 1, 'Bootleg beer', 'Sharkbait');

INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (1, 'Unbelievably smooth', 5, 'Great taste!', 'BlownAwayUser');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (1, 'The kind of beer with which you could lose yourself', 4, 'A new challenge every time', 'Enbrewsiast');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (2, 'Too much going on', 2, 'Yucky', 'Vinny');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (2, 'This beer opened my palate, I hope to try more peculiar flavors from here on', 5, 'Nice beer', 'SomeGuyNamedJeff');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (3, 'Im sure some people will like the complexity, but I just dont get it', 1, 'Busy beer', 'OnesAndZeros');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (3, 'A beer for sipping, the floral notes are as subtle as they are plentiful', 3, 'Deeply complex beer', 'Snobbybeerlife');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (4, 'Crisp and clean finish for a hearty beer', 5, 'Wonderful', 'BennyThePoo');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (4, 'There is something I cant put my finger on but I love this beer', 4, 'Worst beer', 'Satistfried');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (5, 'Average at best', 2, 'Meh beer', 'TwentyTwentywon');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (5, 'The flavor is fine but the finish lingers far too long', 2, 'Sticky beer', 'EnBrewthiast');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (6, 'I called my daughter and told her to avoid this beer', 1, 'Too strong', 'Grandma1951');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (6, 'A bit extreme but I enjoy having one on a night out', 5, 'Not for everyone', 'EZ2PLZ');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (7, 'Im not sure what this beer is going for but I like it a lot', 4, 'Blast beer', 'Anonymous');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (7, 'I felt like this beer would put hair on my chest', 4, 'Acquired taste', 'JavaBrew');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (8, 'Really sweet up front with a harsh finish', 5, 'Strong and resonant', 'Tomador');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (8, 'Dont want to talk about it', 1, 'I suggest you sip and move on', 'Brewmaysa');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (9, 'Sharp as a knife, a hipsters dream', 5, 'You probably havent heard of it', 'QueenRana');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (9, 'Its best to nurse this beer, its delicious but stronger than you think', 2, 'So pungent', 'Shephurd1995');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (10, 'Balanced from front to back', 4, 'Everything under control', 'HopPop1955');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (10, 'I could have a dozen of these if I were younger', 5, 'Wonderful beer', 'AbrewhamLincoln');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (11, 'The finish is so smooth you can forget its a beer', 4, 'Blast beer', 'ActuallyCher');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (11, 'Too soft, It was like drinking seltzer and the flavors suffered', 1, 'Bomb beer', 'Mar-keemark');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (12, 'I drank this beer on Halloween and nothing spooky happened, but it was delicious', 4, 'Well-done brewers', 'Anthotron');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (12, 'Dont buy it as a growler, it will go flat', 1, 'lame', 'Sharkbait');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (13, 'Unbelievably smooth', 5, 'So tasty its immediately rewarding', 'Ninetynine');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (13, 'An excellent jumping off point', 5, 'Tasty, and so light its like youve had nothing to drink', 'Redbaloons');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (14, 'Sharp up front, then smooth. I could drink a few of these', 5, 'Unique in a great way', 'Are-y-Oh');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (14, 'Bites the tongue, I dont like it', 2, 'Too Bitter', 'SpeedW4gon');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (15, 'Heavy beer, great for sharing', 3, 'Pair it with a salad or something', 'Reddy4beddy');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (15, 'I want to feel light and this beer made me feel like I should go to bed', 1, 'Too heavy', 'HereIAm');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (16, 'I felt like every so often I would taste some static and I wasnt sure why', 2, 'Okay but confusing', 'KoachSteev');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (16, 'Would have been better if the return type wasnt the spins', 2, 'Dont drink ten of these', 'Laura');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (17, 'I wasnt really familiar, i had only had test driven brews. This was terrible', 0, 'Bootleg beer', 'ElRey');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (17, 'Really bitter, I knew it was an IPA but I really hated it', 0, 'bitter bitter bitter', 'YooserOne');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (18, 'This beer was so good it put me to REST', 5, 'Bootleg beer', 'Kurious');
INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (18, 'Ive been waiting since the start of UNIX time for a beer like this', 5, 'Must be their Magnum Opus', 'BeerGeek');

COMMIT TRANSACTION;