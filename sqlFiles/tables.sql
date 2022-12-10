
CREATE TABLE address(
	address_id SERIAL PRIMARY KEY,
	country varchar(20) NOT NULL,
	region varchar(20) NOT NULL,
	city varchar(20) NOT NULL,
	address varchar(30) NOT NULL,
	postal_code varchar(10),
	CONSTRAINT address_unique_in_city UNIQUE(city, address)
);
/* validation for country, provence, city, address, postal?*/

--STORE ADDRESSES
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('Canada', 'Ontario', 'Ottawa', '2881 Merivale Rd.', 'K2H 5B6');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('Canada', 'Ontario', 'Kingston', '2235 Pricess St.', 'K7L 1C2');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('Canada', 'Ontario', 'Toronto', '833 Tycos Dr.', 'M5T 1T4');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('Canada', 'Quebec', 'Montreal', '2929 rue Levy', 'H3C 5K4');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('USA', 'Massachusetts', 'Boston', '1869 Pineview Dr.', '02110');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('USA', 'New York', 'New York', '1515 Mount Tabor', '10011');

--OTTAWA ADDRESSES
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('Canada', 'Ontario', 'Ottawa', '758 Merivale Rd.', 'K2G 3K2');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('Canada', 'Ontario', 'Ottawa', '3771 MacLaren St.', 'K1P 5M7');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('Canada', 'Ontario', 'Ottawa', '549 Bank St.', 'K1H 7Z1');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('Canada', 'Ontario', 'Ottawa', '4113 Carling Ave.', 'K1Z 7B5');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('Canada', 'Ontario', 'Ottawa', '2357 Merivale Rd.', 'K2G 3K2');

--KINGSTON ADDRESSES
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('Canada', 'Ontario', 'Kingston', '1093 Ross St.', 'K7L 4V4');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('Canada', 'Ontario', 'Kingston', '4466 Princess St.', 'K7L 1C2');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('Canada', 'Ontario', 'Kingston', '94 Wright Cres.', 'K7L 5M3');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('Canada', 'Ontario', 'Kingston', '310 Bath Rd.', 'K7M 9H1');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('Canada', 'Ontario', 'Kingston', '1000 King St', 'K7M 8H3');

--TORONTO ADDRESSES
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('Canada', 'Ontario', 'Toronto', '474 Dupont St.', 'M5R 1W5');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('Canada', 'Ontario', 'Toronto', '880 Ellesmere Rd.', 'M1P 2L8');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('Canada', 'Ontario', 'Toronto', '2316 Yonge St.', 'M4P 1T4');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('Canada', 'Ontario', 'Toronto', '121 University Ave.', 'M5J 1T1');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('Canada', 'Ontario', 'Toronto', '1952 Weir Cres.', 'M1E 3T8');

--MONTREAL ADDRESSES 
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('Canada', 'Quebec', 'Montreal', '2147 Papineau Ave.', 'H2K 4J5');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('Canada', 'Quebec', 'Montreal', '2950 Ste. Cathrine Ouest', 'H2A 2Z3');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('Canada', 'Quebec', 'Montreal', '2669 Duke St.', 'H3C 5K4');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('Canada', 'Quebec', 'Montreal', '856 chemin Hudson', 'H4J 1M9');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('Canada', 'Quebec', 'Montreal', '182 Scarth St.', 'S4P 3Y2');

--NEW YORK ADDRESSES
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('USA', 'New York', 'New York', '3420 Angus Rd.', '10019');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('USA', 'New York', 'New York', '1732 Elm Dr.', '10011');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('USA', 'New York', 'New York', '359 Redbud Dr.', '10011');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('USA', 'New York', 'New York', '2049 Small St.', '10007');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('USA', 'New York', 'New York', '2256 Progress Way.', '10001');

--BOSTON ADDRESSES
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('USA', 'Massachusetts', 'Boston', '2725 Aspen Ct.', '02110');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('USA', 'Massachusetts', 'Boston', '2396 Eagle St.', '14025');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('USA', 'Massachusetts', 'Boston', '528 Cedar Lane', '02114');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('USA', 'Massachusetts', 'Boston', '3307 Lynn St.', '02115');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('USA', 'Massachusetts', 'Boston', '5033 Gerald L. Bates Drive', '02199');

--PUBLISHER ADDRESSES
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('USA', 'New York', 'New York', '1745 Broadway', '10019');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('USA', 'New York', 'New York', '195 Broadway', '10007');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('USA', 'New York', 'New York', '1290 6th Ave.', '10104');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('Canada', 'Ontario', 'Toronto', '166 King St E', 'M5A 4S4');
INSERT INTO address (country, region, city, address, postal_code)
VALUES ('USA', 'New York', 'New York', '120 Broadway', '10271');

CREATE TABLE bookstore(
	bookstore_id SERIAL PRIMARY KEY,
	address_id int NOT NULL,
	location varchar(40) UNIQUE NOT NULL,
	owner_fName varChar(20) NOT NULL,
	owner_lName varChar(20) NOT NULL,
	contact_email varchar(50) NOT NULL,
	url varchar(100) NOT NULL,
	-- PRIMARY KEY (bookstore_id),
	FOREIGN KEY (address_id) REFERENCES address(address_id),
	CONSTRAINT is_valid_email CHECK (contact_email LIKE '%_@_%.__%'),
	CONSTRAINT is_valid_url CHECK (url LIKE '%_._%.__%')
);

INSERT INTO bookstore (address_id, location, owner_fName, owner_lname, contact_email, url)
VALUES(1, 'Ottawa', 'Cleo', 'Wilkerson', 'cWilkerson0@gmail.com', 'www.LookInnaBook/Ottawa.com');
INSERT INTO bookstore (address_id, location, owner_fName, owner_lname, contact_email, url)
VALUES(2, 'Kingston', 'Lianna', 'Wyatt', 'lWyatt@gmail.com', 'www.LookInnaBook/Kingston.com');
INSERT INTO bookstore (address_id, location, owner_fName, owner_lname, contact_email, url)
VALUES(3, 'Toronto', 'Stevie', 'Boyer', 'sBoyer@gmail.com', 'www.LookInnaBook/Toronto.com');
INSERT INTO bookstore (address_id, location, owner_fName, owner_lname, contact_email, url)
VALUES(4, 'Montreal', 'Isaiah', 'Lewis', 'iLewis@gmail.com', 'www.LookInnaBook/Montreal.com');
INSERT INTO bookstore (address_id, location, owner_fName, owner_lname, contact_email, url)
VALUES(5, 'New York', 'Ammar', 'Pearson', 'aPearson@gmail.com', 'www.LookInnaBook/NewYork.com');
INSERT INTO bookstore (address_id, location, owner_fName, owner_lname, contact_email, url)
VALUES(6, 'Boston', 'Michaela', 'Garrison', 'mGarrison@gmail.com', 'www.LookInnaBook/Boston.com');


CREATE TABLE billing(
	billing_id SERIAL PRIMARY KEY, 
	card_num bigint NOT NULL,
	name_on_card varchar(40) NOT NULL,
	expiry_month int NOT NULL,
	expiry_year int NOT NULL,
	CVC int NOT NULL,
	CONSTRAINT is_valid_credit_card CHECK (999999999999999 < card_num and card_num < 10000000000000000),
	CONSTRAINT is_valid_exp_month CHECK (0 < expiry_month and expiry_month < 13),
	CONSTRAINT is_not_expired CHECK (expiry_year + 2000 > extract( year from NOW()) or (expiry_year + 2000 = extract(year from NOW()) and expiry_month > extract( month from NOW()))),
	CONSTRAINT is_valid_cvc CHECK (99 < CVC and CVC < 1000)
);

INSERT INTO billing (card_num, name_on_card, expiry_month, expiry_year, CVC)
VALUES (1471618288356737, 'Willam Hahn', 1, 27, 877);
INSERT INTO billing (card_num, name_on_card, expiry_month, expiry_year, CVC)
VALUES (4527582392358523, 'Luiza Dixon', 2, 26, 421);
INSERT INTO billing (card_num, name_on_card, expiry_month, expiry_year, CVC)
VALUES (4314237957983412, 'Juliet Barker', 2, 24, 892);
INSERT INTO billing (card_num, name_on_card, expiry_month, expiry_year, CVC)
VALUES (4572948237198743, 'Roland Barker', 8, 24, 877);
INSERT INTO billing (card_num, name_on_card, expiry_month, expiry_year, CVC)
VALUES (5342765235326755, 'Lamar Stein', 5, 26, 573);
INSERT INTO billing (card_num, name_on_card, expiry_month, expiry_year, CVC)
VALUES (6324792653678432, 'Ian Casey', 9, 27, 531);
INSERT INTO billing (card_num, name_on_card, expiry_month, expiry_year, CVC)
VALUES (1235445378452347, 'Cliff Hatfield', 11, 28, 623);
INSERT INTO billing (card_num, name_on_card, expiry_month, expiry_year, CVC)
VALUES (5234574564272346, 'Nichole Knox', 8, 23, 742);
INSERT INTO billing (card_num, name_on_card, expiry_month, expiry_year, CVC)
VALUES (2234673247652367, 'Thad Camacho', 3, 23, 129);
INSERT INTO billing (card_num, name_on_card, expiry_month, expiry_year, CVC)
VALUES (1234432579235753, 'Jeanine Rollins', 6, 28, 663);
INSERT INTO billing (card_num, name_on_card, expiry_month, expiry_year, CVC)
VALUES (5234578436654554, 'Christian Brodrick', 3, 24, 545);
INSERT INTO billing (card_num, name_on_card, expiry_month, expiry_year, CVC)
VALUES (5254387834578234, 'Joyce Briggs', 7, 25, 893);
INSERT INTO billing (card_num, name_on_card, expiry_month, expiry_year, CVC)
VALUES (6324542534322332, 'Alissa Austin', 11, 27, 953);
INSERT INTO billing (card_num, name_on_card, expiry_month, expiry_year, CVC)
VALUES (1235435311534543, 'Dan Conway', 4, 23, 138);
INSERT INTO billing (card_num, name_on_card, expiry_month, expiry_year, CVC)
VALUES (5134522534253355, 'Keith Mccoy', 5, 27, 633);
INSERT INTO billing (card_num, name_on_card, expiry_month, expiry_year, CVC)
VALUES (5314524315135234, 'Emilia Harden', 6, 23, 542);
INSERT INTO billing (card_num, name_on_card, expiry_month, expiry_year, CVC)
VALUES (1235432415435255, 'Darleen Williams', 9, 25, 688);
INSERT INTO billing (card_num, name_on_card, expiry_month, expiry_year, CVC)
VALUES (5324535341254589, 'Pam Meyers', 12, 23, 999);
INSERT INTO billing (card_num, name_on_card, expiry_month, expiry_year, CVC)
VALUES (6143352156435985, 'Danny Pearson', 11, 28, 126);
-- /*maybe add card type*/



CREATE TABLE publisher(
	publisher_id SERIAL PRIMARY KEY,
	company_name varChar (20) UNIQUE NOT NULL,
	account_num bigint NOT NULL, 
	routing_num bigint NOT NULL,
	account_size numeric(10,2) DEFAULT 0,
	email varchar(50) NOT NULL,
	address_id int NOT NULL,
	FOREIGN KEY (address_id) REFERENCES address(address_id),
	CONSTRAINT is_valid_email CHECK (email LIKE '%_@_%.__%'),
	CONSTRAINT is_valid_routing CHECK(9999999 < routing_num and routing_num < 1000000000),
	CONSTRAINT is_valid_account_num CHECK(9999999 < account_num and account_num < 1000000000000)
);
INSERT INTO publisher (company_name, account_num, routing_num, account_size, email, address_id)
VALUES ('Penguin Random House', 187198416457, 65431243, 0, 'pgh@gmail.com', 37);
INSERT INTO publisher (company_name, account_num, routing_num, account_size, email, address_id)
VALUES ('Harper Collins',  342236241987, 14315654, 0, 'hc@gmail.com', 38);
INSERT INTO publisher (company_name, account_num, routing_num, account_size, email, address_id)
VALUES ('Hachette Book Group', 34225164, 14354265, 0, 'hbg@gmail.com', 39);
INSERT INTO publisher (company_name, account_num, routing_num, account_size, email, address_id)
VALUES ('Simon and Schuster', 876245435712, 14763491, 0, 'sas@gmail.com', 40);
INSERT INTO publisher (company_name, account_num, routing_num, account_size, email, address_id)
VALUES ('Macmillan', 546412129573, 64517498, 0, 'm@gmail.com', 41);


CREATE TABLE user_account(
	user_id SERIAL PRIMARY KEY,
	fName varchar(20) NOT NULL,
	lName varchar(20) NOT NULL,
	email varchar(50) UNIQUE NOT NULL,
	username varchar(30) UNIQUE NOT NULL,
	password varchar(30) NOT NULL,
	CONSTRAINT is_valid_email CHECK (email LIKE '%_@_%.__%'),
	CONSTRAINT is_valid_password CHECK (length(password) >= 8)/* and  and password LIKE '%[0-9]%' and password LIKE '%[A-Z]%' and password LIKE '%[!@#$%^&*()~`:;?/>.<,{[}]|\%')*/
);
-- /*password must be larger than or equalt to 6 char, with at least one num, one special character and one capital letter
-- username, email must be unique*/

INSERT INTO user_account (fName, lName, email, username, password)
VALUES ('William', 'Hahn', 'wHahn@gmail.com', 'wHahn', 'wHahn123$');
INSERT INTO user_account (fName, lName, email, username, password)
VALUES ('Luisa', 'Dixon', 'lDixon@gmail.com', 'lDixon', 'lDixon123$');

INSERT INTO user_account (fName, lName, email, username, password)
VALUES ('Juliet ', 'Barker', 'jBarker@gmail.com', 'jBarker', 'jBarker123$');
INSERT INTO user_account (fName, lName, email, username, password)
VALUES ('Roland', 'Barker', 'rBarker@gmail.com', 'rBarker', 'rBarker123$');
INSERT INTO user_account (fName, lName, email, username, password)
VALUES ('Charity', 'Barker', 'cBarker@gmail.com', 'cBarker', 'cBarker123$');
INSERT INTO user_account (fName, lName, email, username, password)
VALUES ('Kelly', 'Barker', 'kBarker@gmail.com', 'kBarker', 'kBarker123$');

INSERT INTO user_account (fName, lName, email, username, password)
VALUES ('Lamar', 'Stein', 'lStein@gmail.com', 'lStein', 'lStein123$');
INSERT INTO user_account (fName, lName, email, username, password)
VALUES ('Darren', 'Stein', 'dStein@gmail.com', 'dStein', 'dStein123$');
INSERT INTO user_account (fName, lName, email, username, password)
VALUES ('Jared', 'Stein', 'jStein@gmail.com', 'jStein', 'jStein123$');

INSERT INTO user_account (fName, lName, email, username, password)
VALUES ('Ian', 'Casey', 'iCasey@gmail.com', 'iCasey', 'iCasey123$');
INSERT INTO user_account (fName, lName, email, username, password)
VALUES ('Canadace', 'Holloway', 'cHolloway@gmail.com', 'cHolloway', 'cHolloway123$');

INSERT INTO user_account (fName, lName, email, username, password)
VALUES ('Cliff', 'Hatfield', 'cHatfield@gmail.com', 'cHatfield', 'cHatfield123$');
INSERT INTO user_account (fName, lName, email, username, password)
VALUES ('Natalia', 'Hatfield', 'nHatfield@gmail.com', 'nHatfield', 'nHatfield123$');
INSERT INTO user_account (fName, lName, email, username, password)
VALUES ('Anne', 'Hatfield', 'aHatfield@gmail.com', 'aHafield', 'aHatfield123$');

INSERT INTO user_account (fName, lName, email, username, password)
VALUES ('Nichole', 'Knox', 'nKnox@gmail.com', 'nKnox', 'nKnox123$');
INSERT INTO user_account (fName, lName, email, username, password)
VALUES ('Thad', 'Camacho', 'tCamacho@gmail.com', 'tCamacho', 'tCamacho123$');
INSERT INTO user_account (fName, lName, email, username, password)
VALUES ('Jeanine', 'Rollins', 'jRollins@gmail.com', 'jRollins', 'jRollins123$');
INSERT INTO user_account (fName, lName, email, username, password)
VALUES ('Christian', 'Brodrick', 'cBrodrick@gmail.com', 'cBrodrick', 'cBrodrick123$');
INSERT INTO user_account (fName, lName, email, username, password)
VALUES ('Joyce', 'Briggs', 'jBriggs@gmail.com', 'jBriggs', 'jBriggs123$');
INSERT INTO user_account (fName, lName, email, username, password)
VALUES ('Alissa', 'Austin', 'aAustin@gmail.com', 'aAustin', 'aAustin123$');
INSERT INTO user_account (fName, lName, email, username, password)
VALUES ('Dan', 'Conway', 'dConway@gmail.com', 'dConway', 'dConway123$');
INSERT INTO user_account (fName, lName, email, username, password)
VALUES ('Keith', 'Mccoy', 'kMccoy@gmail.com', 'kMccoy', 'kMccoy123$');
INSERT INTO user_account (fName, lName, email, username, password)
VALUES ('Emilia', 'Harden', 'eHarden@gmail.com', 'eHarden', 'eHarden123$');
INSERT INTO user_account (fName, lName, email, username, password)
VALUES ('Darleen', 'Williams', 'dWilliams@gmail.com', 'dWilliams', 'dWilliams123$');
INSERT INTO user_account (fName, lName, email, username, password)
VALUES ('Pam', 'Meyers', 'pMeyers@gmail.com', 'pMeyers', 'pMeyers123$');
INSERT INTO user_account (fName, lName, email, username, password)
VALUES ('Danny', 'Pearson', 'dPearson@gmail.com', 'dPearson', 'dPearson123$');

CREATE TABLE book(
	ISBN bigint, 
	title varchar(50) NOT NULL,
	price numeric(5,2) NOT NULL,
	pub_date date,
	genre varchar(20),
	author varchar(20) NOT NULL,
	description varchar(500),
	publisher int NOT NULL,
	PRIMARY KEY (ISBN),
	FOREIGN KEY (publisher) REFERENCES publisher(publisher_id),
	CONSTRAINT is_valid_isbn CHECK ((999999999 < ISBN and ISBN < 10000000000) or (999999999999 < ISBN and ISBN < 10000000000000))
);
-- /*validate genre (categorical) maybe*/
INSERT INTO book (ISBN, title, price, pub_date, genre, author, description, publisher)
VALUES(9780385660075, 'The Kite Runner', 21, '2003-05-29', 'Historical Fiction', 'Khaled Hosseini', 'The Kite Runner, written by Khaled Hosseini, tells the extraordinary story of an unlikely friendship between a wealthy Afghan boy, named Amir, and Hassan, the son of his fathers servant — who he later finds out, after Hassans death, has always been his half-brother.', 1);
INSERT INTO book (ISBN, title, price, pub_date, genre, author, description, publisher)
VALUES(9780143054405, 'A Thousand Splendid Suns', 20, '2007-05-22', 'Historical Fiction', 'Khaled Hosseini', 'A Thousand Splendid Suns is a breathtaking story set against the volatile events of Afghanistans last thirty years—from the Soviet invasion to the reign of the Taliban to post-Taliban rebuilding—that puts the violence, fear, hope, and faith of this country in intimate, human terms.', 1);
INSERT INTO book (ISBN, title, price, pub_date, genre, author, description, publisher)
VALUES(9780143188520, 'And the Mountains Echoed', 23, '2013-05-21', 'Historical Fiction', 'Khaled Hosseini', 'Khaled Hosseinis And the Mountains Echoed begins with a fable that a father tells his two children: A farmer who works hard to eke out a living for his family is forced to give up one of his five children to an evil giant. He and his wife decide to choose randomly, and the unlucky one happens to be their favorite son.', 1);
INSERT INTO book (ISBN, title, price, pub_date, genre, author, description, publisher)
VALUES(9781398806436, 'Meditations', 7, NULL, 'Philosophy', 'Marcus Aurelius', 'Meditations is a collection of 12 books written by Roman emperor Marcus Aurelius, wholl introduce you to Stoic philosophy, the concept of logic, self-discipline and give you faith that the course the world runs is a good one.', 1);
INSERT INTO book (ISBN, title, price, pub_date, genre, author, description, publisher)
VALUES(9781399810723, 'Orlando', 7, '1928-10-11', 'Feminist Literature', 'Virginia Woolf', 'The book describes the adventures of a poet who changes sex from man to woman and lives for centuries, meeting the key figures of English literary history. Considered a feminist classic, the book has been written about extensively by scholars of womens writing and gender and transgender studies.', 2);
INSERT INTO book (ISBN, title, price, pub_date, genre, author, description, publisher)
VALUES(9781788282406, 'The Prophet', 7, '1923-01-01', 'Philosophy', 'Kahlil Gibran', 'The book is made up of 26 prose poems, delivered as sermons by a wise man called Al Mustapha. He is about to set sail for his homeland after 12 years in exile on a fictional island when the people of the island ask him to share his wisdom on the big questions of life: love, family, work and death.', 3);
INSERT INTO book (ISBN, title, price, pub_date, genre, author, description, publisher)
VALUES(9781788282437, 'Metamorphosis', 7, '1915-01-01', 'Fiction', 'Franz Kafka', 'Metamorphosis tells the story of salesman Gregor Samsa, who wakes one morning to find himself inexplicably transformed into a huge insect (German: ungeheueres Ungeziefer, lit. "monstrous vermin") and subsequently struggles to adjust to this new condition.', 2);
INSERT INTO book (ISBN, title, price, pub_date, genre, author, description, publisher)
VALUES(9781788280587, 'A Tale of Two Cities', 7, '1859-11-01', 'Fiction', 'Charles Dickens', 'The novel tells the story of the French Doctor Manette, his 18-year-long imprisonment in the Bastille in Paris, and his release to live in London with his daughter Lucie whom he had never met. The story is set against the conditions that led up to the French Revolution and the Reign of Terror.', 5);
INSERT INTO book (ISBN, title, price, pub_date, genre, author, description, publisher)
VALUES(9780060837020, 'The Bell Jar', 17, '1963-01-14', 'Fiction', 'Sylvia Plath', 'The Bell Jar details the life of Esther Greenwood, a college student who dreams of becoming a poet. She is selected for a month-long summer internship as a guest editor of Ladies Day magazine, but her time in New York City is unfulfilling as she struggles with issues of identity and societal norms.', 4);
INSERT INTO book (ISBN, title, price, pub_date, genre, author, description, publisher)
VALUES(9780375718946, 'A Wild Sheep Chase', 23, '1982-10-13', 'Fiction', 'Haruki Murakami', 'A Wild Sheep Chase is set in Japan in 1978 and tells the story of a 29-year-old mans search for a very special and powerful "sheep". The plot begins with the divorced Protagonist, who despite having a new girlfriend is maintaining a mediocre, somewhat boring life.', 3);
INSERT INTO book (ISBN, title, price, pub_date, genre, author, description, publisher)
VALUES(9780385690713, 'Killing Commendatore', 25, '2017-02-24', 'Fiction', 'Haruki Murakami', 'In Killing Commendatore, a thirty-something portrait painter in Tokyo is abandoned by his wife and finds himself holed up in the mountain home of a famous artist, Tomohiko Amada. When he discovers a previously unseen painting in the attic, he unintentionally opens a circle of mysterious circumstances.', 3);
INSERT INTO book (ISBN, title, price, pub_date, genre, author, description, publisher)
VALUES(9781400079278, 'Kafka on the Shore', 23.95, '2002-09-12', 'Fiction', 'Haruki Murakami', 'Kafka on the Shore interweaves between two parallel plots to tell the story of Kafka Tamura — a 15-year-old boy who runs away from home to escape an Oedipal curse and Nakata — an elderly Japanese man who has an uncanny ability to speak to cats due to a childhood accident.', 3);
INSERT INTO book (ISBN, title, price, pub_date, genre, author, description, publisher)
VALUES(9780375704024, 'Norweigan Wood', 16, '1987-01-01', 'Fiction', 'Haruki Murakami', 'Norwegian Wood (ノルウェイの森, Noruwei no Mori) is a 1987 novel by Japanese author Haruki Murakami. The novel is a nostalgic story of loss and burgeoning sexuality. It is told from the first-person perspective of Toru Watanabe, who looks back on his days as a college student living in Tokyo.', 3);
INSERT INTO book (ISBN, title, price, pub_date, genre, author, description, publisher)
VALUES(9780575079755, 'The Lies of Locke Lamora', 15.99, '2006-06-27', 'Fantasy', 'Scott Lynch', 'An orphans life is harsh—and often short—in the mysterious island city of Camorr. But young Locke Lamora dodges death and slavery, becoming a thief under the tutelage of a gifted con artist.', 1);
INSERT INTO book (ISBN, title, price, pub_date, genre, author, description, publisher)
VALUES(9780060934347, 'Don Quixote', 24.99, '1605-01-01', 'Literature', 'Miguel De Cervantes', ' Don Quixote is a classic novel from 1605 which portraits the life and insightful journey of Don Quixote de la Mancha, a Spanish man who seems to be losing his mind on his quest to become a knight and restore chivalry alongside with a farmer named Sancho Panza.', 2);
INSERT INTO book (ISBN, title, price, pub_date, genre, author, description, publisher)
VALUES(9781847493729, 'The Picture of Dorian Gray', 5.99, '1890-07-01', 'Literature', 'Oscar Wilde', 'The story revolves around a portrait of Dorian Gray painted by Basil Hallward, a friend of Dorians and an artist infatuated with Dorians beauty. Through Basil, Dorian meets Lord Henry Wotton and is soon enthralled by the aristocrats hedonistic worldview: that beauty and sensual fulfillment are the only things worth pursuing in life. Newly understanding that his beauty will fade, Dorian expresses the desire to sell his soul, to ensure that the picture, rather than he, will age and fade.', 4);
INSERT INTO book (ISBN, title, price, pub_date, genre, author, description, publisher)
VALUES(9780063213210, 'The Song of Achilles', 21.99, '2001-09-20', 'Fiction', 'Madeline Miller', 'The story is told from the perspective of Patroclus who, exiled by his father to live in the court of Peleus, soon falls in love with his hosts son, the superhuman Achilles: from childhood, his demi-god status means he is swifter, more beautiful and more skilled than all his peers', 2);
INSERT INTO book (ISBN, title, price, pub_date, genre, author, description, publisher)
VALUES(9780441172719, 'Dune', 14.99, '1965-08-01', 'Science Fiction', 'Frank Herbert', 'Paul Atreides, a brilliant and gifted young man born into a great destiny beyond his understanding, must travel to the most dangerous planet in the universe to ensure the future of his family and his people. As malevolent forces explode into conflict over the planets exclusive supply of the most precious resource in existence, only those who can conquer their own fear will survive.', 2);
INSERT INTO book (ISBN, title, price, pub_date, genre, author, description, publisher)
VALUES(9780593201732, 'Dune Messiah', 24, '1969-01-01', 'Science Fiction', 'Frank Herbert', 'Twelve years after the events described in Dune (1965), Paul "MuadDib" Atreides rules as Emperor. By accepting the role of messiah to the Fremen, Paul has unleashed a jihad which conquered most of the known universe. Paul is the most powerful emperor ever known, but is powerless to stop the lethal excesses of the religious juggernaut he has created.', 2);
INSERT INTO book (ISBN, title, price, pub_date, genre, author, description, publisher)
VALUES(9780593201749, 'Children of Dune', 24, '1976-04-01', 'Science Fiction', 'Frank Herbert', 'Children of Dune is the novel that concluded the life of Paul Atreides and began a new era that was for the benefit of humanity. After Paul walks into the desert, the characters Leto II and Ghanima, his children, become the center of politics; this leads to a series of events that shapes the Dune universe.', 2);

CREATE TABLE sells (
	bookstore_id int,
	ISBN bigint NOT NULL,
	stock int NOT NULL default (0),
	PRIMARY KEY (bookstore_id, ISBN),
	FOREIGN KEY (bookstore_id) REFERENCES bookstore(bookstore_id),
	FOREIGN KEY (ISBN) REFERENCES book(ISBN)
);

-- OTTAWA 
INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (1, 9780385660075, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (1, 9780143054405, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (1,  9780143188520, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (1, 9781398806436, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (1, 9781399810723, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (1, 9781788282406, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (1, 9781788282437, 0); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (1,  9781788280587, 0); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (1, 9780060837020, 0); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (1, 9780375718946, 0);
-- KINGSTON
INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (2, 9780385660075, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (2, 9780143054405, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (2,  9780143188520, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (2, 9781398806436, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (2, 9781399810723, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (2, 9780385690713, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (2, 9781400079278, 0); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (2,  9780375704024, 0); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (2, 9780575079755, 0); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (2, 9780060934347, 0);
-- TORONTO 
INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (3, 9780385660075, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (3, 9780143054405, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (3,  9780143188520, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (3, 9781398806436, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (3, 9781399810723, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (3, 9781847493729, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (3, 9780063213210, 0); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (3,  9780441172719, 0); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (3, 9780593201732, 0); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (3, 9780593201749, 0);
-- MONTREAL
INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (4, 9780375718946, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (4, 9780385690713, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (4,  9781400079278, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (4, 9780375704024, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (4, 9780575079755, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (4, 9780060934347, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (4, 9781847493729, 0); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (4, 9780063213210, 0); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (4, 9780441172719, 0); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (4, 9780593201749, 0);
-- NEW YORK
INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (5, 9780143188520, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (5, 9780385660075, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (5,  9781400079278, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (5, 9780375704024, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (5, 9780575079755, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (5, 9780060934347, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (5, 9781847493729, 0); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (5, 9780063213210, 0); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (5, 9780441172719, 0); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (5, 9780593201749, 0);
-- BOSTON
INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (6, 9781398806436, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (6, 9780143054405, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (6,  9781400079278, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (6, 9780375704024, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (6, 9780575079755, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (6, 9780060934347, 15); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (6, 9781847493729, 0); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (6, 9780063213210, 0); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (6, 9780441172719, 0); INSERT INTO sells (bookstore_id, ISBN, stock) VALUES (6, 9780593201749, 0);

CREATE TABLE owns (
	ISBN bigint,
	user_id int,
	review varchar(2000),
	PRIMARY KEY (ISBN, user_id),
	FOREIGN KEY (ISBN) REFERENCES book(ISBN),
	FOREIGN KEY (user_id) REFERENCES user_account(user_id)
);

INSERT INTO owns (ISBN, user_id, review) VALUES (9780385660075, 10, 'Thought it was great');
INSERT INTO owns (ISBN, user_id, review) VALUES (9780385660075, 11, 'Very cool');
INSERT INTO owns (ISBN, user_id, review) VALUES (9781398806436, 11, 'Good book');
--Important that ownership triggers on purchase


CREATE TABLE registered_at (
	cart_id SERIAL PRIMARY KEY,
	bookstore_id int NOT NULL,
	user_id int NOT NULL,
	billing_id int NOT NULL,
	address_id int NOT NULL,
	FOREIGN KEY (bookstore_id) REFERENCES bookstore(bookstore_id),
	FOREIGN KEY (user_id) REFERENCES user_account(user_id),
	FOREIGN KEY (billing_id) REFERENCES billing(billing_id),
	FOREIGN KEY (address_id) REFERENCES address(address_id),
	CONSTRAINT user_billing_unique UNIQUE (bookstore_id, user_id)
);--doesnt violate 3NF because user_id, bookstore_id is a candidate key 

INSERT INTO registered_at (bookstore_id, user_id, billing_id, address_id)
VALUES (1, 1, 1, 11);
INSERT INTO registered_at (bookstore_id, user_id, billing_id, address_id)
VALUES (1, 2, 2, 11);
INSERT INTO registered_at (bookstore_id, user_id, billing_id, address_id)
VALUES (1, 3, 3, 10);
INSERT INTO registered_at (bookstore_id, user_id, billing_id, address_id)
VALUES (1, 4, 4, 10);
INSERT INTO registered_at (bookstore_id, user_id, billing_id, address_id)
VALUES (1, 5, 3, 10);
INSERT INTO registered_at (bookstore_id, user_id, billing_id, address_id)
VALUES (1, 6, 4, 10);
INSERT INTO registered_at (bookstore_id, user_id, billing_id, address_id)
VALUES (2, 6, 3, 10);
INSERT INTO registered_at (bookstore_id, user_id, billing_id, address_id)
VALUES (2, 7, 5, 15);
INSERT INTO registered_at (bookstore_id, user_id, billing_id, address_id)
VALUES (2, 8, 5, 15);
INSERT INTO registered_at (bookstore_id, user_id, billing_id, address_id)
VALUES (2, 9, 5, 15);
INSERT INTO registered_at (bookstore_id, user_id, billing_id, address_id)
VALUES (2, 10, 6, 14);
INSERT INTO registered_at (bookstore_id, user_id, billing_id, address_id)
VALUES (2, 11, 6, 14);
INSERT INTO registered_at (bookstore_id, user_id, billing_id, address_id)
VALUES (3, 12, 7, 19);
INSERT INTO registered_at (bookstore_id, user_id, billing_id, address_id)
VALUES (3, 13, 7, 19);
INSERT INTO registered_at (bookstore_id, user_id, billing_id, address_id)
VALUES (3, 14, 7, 19);
INSERT INTO registered_at (bookstore_id, user_id, billing_id, address_id)
VALUES (3, 15, 8, 20);
INSERT INTO registered_at (bookstore_id, user_id, billing_id, address_id)
VALUES (3, 16, 9, 21);
INSERT INTO registered_at (bookstore_id, user_id, billing_id, address_id)
VALUES (4, 17, 10, 22);
INSERT INTO registered_at (bookstore_id, user_id, billing_id, address_id)
VALUES (4, 18, 11, 23);
INSERT INTO registered_at (bookstore_id, user_id, billing_id, address_id)
VALUES (4, 19, 12, 24);
INSERT INTO registered_at (bookstore_id, user_id, billing_id, address_id)
VALUES (4, 20, 13, 25);
INSERT INTO registered_at (bookstore_id, user_id, billing_id, address_id)
VALUES (4, 21, 14, 26);
INSERT INTO registered_at (bookstore_id, user_id, billing_id, address_id)
VALUES (5, 22, 15, 27);
INSERT INTO registered_at (bookstore_id, user_id, billing_id, address_id)
VALUES (5, 23, 16, 28);
INSERT INTO registered_at (bookstore_id, user_id, billing_id, address_id)
VALUES (5, 24, 17, 29);
INSERT INTO registered_at (bookstore_id, user_id, billing_id, address_id)
VALUES (6, 25, 18, 32);
INSERT INTO registered_at (bookstore_id, user_id, billing_id, address_id)
VALUES (6, 26, 19, 33);

CREATE TABLE book_in_cart (
	ISBN bigint,
	cart_id int,
	quantity int,
	PRIMARY KEY (ISBN, cart_id),
	FOREIGN KEY (ISBN) REFERENCES book(ISBN),
	FOREIGN KEY (cart_id) REFERENCES registered_at(cart_id)
);

INSERT INTO book_in_cart (ISBN, cart_id, quantity) VALUES (9780593201732, 6, 2);
INSERT INTO book_in_cart (ISBN, cart_id, quantity) VALUES (9780593201732, 7, 2);

CREATE TABLE order_info(
	order_id SERIAL PRIMARY KEY,
	curr_location varchar(25) NOT NULL default ('Unknown'),
	eta date NOT NULL default (DATEADD('day', 7, now())),
	cost numeric (7,2) NOT NULL,
	order_date date NOT NULL default now(),
	user_id int NOT NULL,
	bookstore_id int NOT NULL,
	billing_id int NOT NULL,
	address_id int NOT NULL,
	FOREIGN KEY (user_id) REFERENCES user_account(user_id),
	FOREIGN KEY (bookstore_id) REFERENCES bookstore(bookstore_id),
	FOREIGN KEY (billing_id) REFERENCES billing(billing_id),
	FOREIGN KEY (address_id) REFERENCES address(address_id),
	CONSTRAINT is_valid_date CHECK (order_date == now()),
	CONSTRAINT is_valid_eta CHECK (eta >= now() and eta <= DATEADD(month, 2, now()))
);--constraint: Must be a registration table value with user in bookstore

-- INSERT INTO order_info (curr_location, eta, cost, month, year, user_id, bookstore_id, billing_id, address_id)
-- VALUES("Ottawa", )
-- CREATE TABLE book_in_order (
-- 	ISBN int,
-- 	order_id int,
-- 	quantity int,
-- 	PRIMARY KEY (ISBN, order_id),
-- 	FOREIGN KEY (ISBN) REFERENCES book(ISBN),
-- 	FOREIGN KEY (order_id) REFERENCES order_info(order_id)
-- );

-- 1: 9780385660075
-- 2: 9780143054405
-- 3: 9780143188520
-- 4: 9781398806436
-- 5: 9781399810723
-- 6: 9781788282406
-- 7: 9781788282437
-- 8: 9781788280587
-- 9: 9780060837020
-- 10: 9780375718946
-- 11: 9780385690713
-- 12: 9781400079278
-- 13: 9780375704024
-- 14: 9780575079755
-- 15: 9780060934347
-- 16: 9781847493729
-- 17: 9780063213210
-- 18: 9780441172719
-- 19: 9780593201732
-- 20: 9780593201749