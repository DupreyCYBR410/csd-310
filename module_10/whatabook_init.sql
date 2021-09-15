"""
Title: whatabook_init.sql
Author: Sarah Duprey
Date: September 2021
Description: Initialization for WhataBook Database
"""

DROP USER IF EXISTS 'whatabook_user'@'localhost';

CREATE USER 'whatabook_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MySQL8IsGreat!';

GRANT ALL ON whatabook.* TO 'whatabook_user'@'localhost';

ALTER TABLE wishlist DROP FOREIGN KEY fk_book;
ALTER TABLE wishlist DROP FOREIGN KEY fk_user;

DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS wishlist;
DROP TABLE IF EXISTS user;

CREATE TABLE store (
    store_id    INT             NOT NULL    AUTO_INCREMENT,
    locale      VARCHAR(500)    NOT NULL,
    PRIMARY KEY(store_id)
);

CREATE TABLE book (
    book_id     INT             NOT NULL    AUTO_INCREMENT,
    book_name   VARCHAR(200)    NOT NULL,
    author      VARCHAR(200)    NOT NULL,
    details     VARCHAR(500),
    PRIMARY KEY(book_id)
);

CREATE TABLE user (
    user_id         INT         NOT NULL    AUTO_INCREMENT,
    first_name      VARCHAR(75) NOT NULL,
    last_name       VARCHAR(75) NOT NULL,
    PRIMARY KEY(user_id) 
);

CREATE TABLE wishlist (
    wishlist_id     INT         NOT NULL    AUTO_INCREMENT,
    user_id         INT         NOT NULL,
    book_id         INT         NOT NULL,
    PRIMARY KEY (wishlist_id),
    CONSTRAINT fk_book
    FOREIGN KEY (book_id)
        REFERENCES book(book_id),
    CONSTRAINT fk_user
    FOREIGN KEY (user_id)
        REFERENCES user(user_Id)
);

INSERT INTO store(locale)
    VALUES('1 Cedar Point Dr, Sandusky, OH 44870');


INSERT INTO book(book_name, author, details)
    VALUES('Mistress of Rome', 'Kate Quinn', 'The first part in Empress of Rome series');

INSERT INTO book(book_name, author, details)
    VALUES('Stalking Jack the Ripper', 'Kerri Maniscalco', 'Crime thriller');

INSERT INTO book(book_name, author, details)
    VALUES('Pride and Prejudice', 'Jane Austen', 'Classical romance literature');

INSERT INTO book(book_name, author, details)
    VALUES('Outlander', 'Diana Gabaldon', 'Historical fantasy romance');

INSERT INTO book(book_name, author, details)
    VALUES('The Huntress', 'Kate Quinn', 'Based on real World War 2 events');

INSERT INTO book(book_name, author, details)
    VALUES('Capturing the Devil', 'Kerri Maniscalco', 'Last in crime thriller series');

INSERT INTO book(book_name, author, details)
    VALUES('Emma', 'Jane Austen', 'Classical literature');

INSERT INTO book(book_name, author, details)
    VALUES('The Fiery Cross', 'Diana Gabaldon', 'The fifth book in the series');

INSERT INTO book(book_name, author, details)
    VALUES('The Assasins Blade', 'Sarah J. Maas', 'A collection of novellas');
    
INSERT INTO book(book_name, author, details)
    VALUES('House of Earth and Blood', 'Sarah J. Maas', 'The first book in Cresent City series');

INSERT INTO book(book_name, author, details)
    VALUES('Just Listen', 'Sarah Dessen', 'Young adult contemporary');

INSERT INTO book(book_name, author, details)
    VALUES('Fantastic Beasts and Where to Find Them', 'J.K. Rowling', 'Fantasy about wizarding world');

INSERT INTO book(book_name, author, details)
    VALUES('This Lullaby', 'Sarah Dessen', 'Yound adult contemporary');

INSERT INTO book(book_name, author, details)
    VALUES('Harry Potter and the Order of the Phoenix', 'J.K. Rowling', 'The fifth book in series');

INSERT INTO book(book_name, author, details)
    VALUE('The White Queen', 'Philippa Gregory', 'Historical Fiction england');



INSERT INTO user(first_name, last_name) 
    VALUES('Audrey-Rose', 'Wadsworth');

INSERT INTO user(first_name, last_name)
    VALUES('Elizabeth', 'Bennet');

INSERT INTO user(first_name, last_name)
    VALUES('Celaena', 'Sardothien');

INSERT INTO user(first_name, last_name)
    VALUES('Rowan', 'Whitehorn');

INSERT INTO user(first_name, last_name)
    VALUES('Thomas', 'Cresswell');



INSERT INTO wishlist(user_id, book_id) 
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Audrey-Rose'), 
        (SELECT book_id FROM book WHERE book_name = 'The Huntress')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Elizabeth'),
        (SELECT book_id FROM book WHERE book_name = 'Outlander')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Celaena'),
        (SELECT book_id FROM book WHERE book_name = 'Capturing the Devil')
    );
    
INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Rowan'),
        (SELECT book_id FROM book WHERE book_name = 'Fantastic Beasts and Where to Find Them')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Thomas'),
        (SELECT book_id FROM book WHERE book_name = 'Just Listen')
    );
    
