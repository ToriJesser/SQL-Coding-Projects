USE master
GO
CREATE DATABASE Library
GO

USE Library
Go

CREATE TABLE Library_Branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	BranchName VARCHAR(50) NOT NULL,
	Address VARCHAR (50) NOT NULL
);

CREATE TABLE Publisher (
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	Address VARCHAR (50) NOT NULL,
	Phone VARCHAR (50) NOT NULL
);

CREATE TABLE Books (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Title VARCHAR (50) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES Publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Name VARCHAR (50) NOT NULL,
	Address VARCHAR (50) NOT NULL,
	Phone VARCHAR (15) NOT NULL
);

CREATE TABLE Book_Loans (
	BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut VARCHAR(20) NOT NULL,
	DateDue VARCHAR(20) NOT NULL
);

CREATE TABLE Book_Authors (
	BookID INT NOT NULL CONSTRAINT fk_Book_ID FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR (50) NOT NULL
);


CREATE TABLE Book_Copies (
	BookID INT NOT NULL CONSTRAINT fk_Book_ID_1 FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_Branch_ID FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL, 
);


INSERT INTO Library_Branch
	(BranchName, Address)
	VALUES
	('Sharpstown', '123 Main st Sharpstown'),
	('Central', '3215 2nd st Central'),
	('Softstown', '253 Copper rd Softstown'),
	('LessSharpstown', '952 Red ct LessSharpstown')
;

INSERT INTO Publisher
	(PublisherName, Phone, Address)
	VALUES
	('Penguin Random House', '981-253-1568', '1745 Broadway Manhattan'),
	('Hachette Livre', '562-451-8315', '15th arrondissement Paris'),
	('HarperCollins', '462-483-7568', '195 Broadway New York City')
	;

INSERT INTO Books
	(Title, PublisherName)
	VALUES
	('The Lost Tribe', 'Penguin Random House'),
	('The Stand', 'Penguin Random House'),
	('Salem''s Lot', 'Hachette Livre'),
	('Harry Potter and the Sorcerer''s Stone', 'HarperCollins'),
	('The Elements of Style', 'Hachette Livre'),
	('The Hobbit', 'Hachette Livre'),
	('1984', 'HarperCollins'),
	('Pride and Prejudice', 'Hachette Livre'),
	('The Girl with the Dragon Tattoo', 'Penguin Random House'),
	('The Time Traveler''s Wife', 'HarperCollins'),
	('Ender''s Game', 'Penguin Random House'),
	('A Wrinkle in Time', 'Hachette Livre'),
	('American Gods', 'HarperCollins'),
	('Lolita', 'Penguin Random House'),
	('Siddhartha', 'HarperCollins'),
	('The Amber Spyglass', 'HarperCollins'),
	('Ulysses', 'Penguin Random House'),
	('Neuromancer', 'Penguin Random House'),
	('Inferno', 'HarperCollins'),
	('The Silver Chair', 'HarperCollins')
;

INSERT INTO Borrower
	(Name, Address, Phone)
	VALUES
	('Mary Sue','548 Hubbard rd','452-456-4232'),
	('Jane Doe','15673 Starry ave','621-832-4622'),
	('Jon Doe','11348 Teton ct','135-765-4285'),
	('Homer Simpson','742 Evergreen Terrace','523-685-9657'),
	('Brian Griffin','31 Spooner Street','523-758-4128'),
	('Queen Elizabeth','Buckingham Palace, London, SW1A 1AA','125-853-6247'),
	('Hugh Man','56418 Alien st','865-231-4621'),
	('Hugh Mungus','111 Small rd','568-4321-7324'),
	('Janet Jackson','156 LArge rd','523-132-6842')
;

INSERT INTO Book_Loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES 
	(1,1,1,'1/1/2020','6/15/2020'),
	(11,3,2,'12/28/2019','3/13/2020'),
	(4,2,3,'8/2/2019','3/13/2020'),
	(5,3,1,'5/15/2019','3/13/2020'),
	(3,1,1,'2/16/2019','4/20/2020'),
	(6,1,3,'12/8/2019','4/20/2020'),
	(12,1,2,'9/15/2019','2/19/2020'),
	(11,3,4,'1/5/2020','6/15/2/2020'),
	(9,2,5,'12/2/2019','8/12/2020'),
	(2,1,5,'1/2/2020','6/15/2/2020'),
	(7,2,1,'2/13/2019','3/13/2020'),
	(20,1,6,'3/16/2019','8/12/2020'),
	(5,1,2,'3/26/2019','8/12/2020'),
	(16,3,2,'1/3/2020','6/15/2/2020'),
	(15,1,4,'4/25/2019','8/12/2020'),
	(17,1,7,'1/6/2020','7/23/2020'),
	(3,2,3,'1/2/2020','7/23//2020'),
	(3,2,7,'7/22/2019','4/20/2020'),
	(1,1,8,'6/13/2019','3/13/2020'),
	(9,2,8,'1/1/2020','7/23//2020'),
	(5,1,8,'7/25/2019','8/12/2020'),
	(4,2,4,'7/25/2019','8/12/2020'),
	(6,1,3,'1/4/2020','7/23//2020'),
	(2,1,6,'7/25/2019','5/23/2020'),
	(13,2,7,'3/23/2019','3/13/2020'),
	(18,2,7,'12/12/2019','4/20/2020'),
	(12,1,6,'3/23/2019','4/20/2020'),
	(8,1,1,'12/12/2019','3/13/2020'),
	(18,2,4,'8/25/2019','5/23/2020'),
	(7,2,2,'4/4/2019','5/23/2020'),
	(10,2,7,'1/5/2020','5/12/2020'),
	(16,2,8,'1/5/2020','5/12/2020'),
	(3,1,2,'1/3/2020','5/12/2020'),
	(15,3,7,'4/4/2019','5/23/2020'),
	(2,2,6,'4/4/2019','4/20/2020'),
	(15,1,3,'4/4/2019','5/23/2020'),
	(17,3,8,'4/4/2019','4/20/2020'),
	(20,1,8,'9/26/2019','7/15/2020'),
	(8,1,5,'9/26/2019','7/15/2020'),
	(7,2,6,'9/26/2019','4/20/2020'),
	(16,2,8,'10/21/2019','7/15/2020'),
	(14,2,5,'10/21/2019','7/15/2020'),
	(10,2,8,'10/21/2019','4/20/2020'),
	(15,3,3,'8/17/2019','5/12/2020'),
	(17,1,7,'1/2/2020','9/3/2020'),
	(14,2,6,'8/17/2019','9/3/2020'),
	(2,2,3,'1/6/2020','9/3/2020'),
	(20,3,3,'1/6/2020','9/3/2020'),
	(17,3,8,'4/4/2019','4/20/2020'),
	(16,3,8,'10/21/2019','7/15/2020'),
	(16,3,8,'10/21/2019','7/15/2020'),
	(13,3,4,'8/25/2019','5/23/2020'),
	(13,3,4,'8/25/2019','5/23/2020'),
	(9,3,5,'12/2/2019','8/12/2020'),
	(9,3,5,'12/2/2019','8/12/2020'),
	(1,4,1,'1/1/2020','6/15/2020'),
	(2,4,3,'1/1/2020','6/15/2020'),
	(2,4,7,'1/1/2020','6/15/2020'),
	(14,4,8,'1/1/2020','6/15/2020'),
	(18,4,6,'1/1/2020','6/15/2020'),
	(15,4,6,'1/1/2020','6/15/2020'),
	(6,4,2,'1/1/2020','6/15/2020'),
	(15,4,5,'1/1/2020','6/15/2020'),
	(8,4,6,'1/1/2020','6/15/2020'),
	(5,4,1,'1/1/2020','6/15/2020'),
	(7,4,5,'1/1/2020','6/15/2020'),
	(20,4,'8','1/1/2020','6/15/2020')
;

INSERT INTO Book_Authors
	(BookID, AuthorName)
	VALUES
	(1,'Edward Marriott'),
	(2,'Stephen King'),
	(3,'Stephen King'),
	(4,'J. K. Rowling'),
	(5,'William Jr. Strunk'),
	(6,'J. R. R. Tolkien'),
	(7,'George Orwell'),
	(8,'Jane Austen'),
	(9,'Stieg Larsson'),
	(10,'Audrey Niffenegger'),
	(11,'Orson Scott Card'),
	(12,'Madeleine L''Engle'),
	(13,'Neil Gaiman'),
	(14,'Vladimir Nabokov'),
	(15,'Hermann Hesse'),
	(16,'Philip Pullman'),
	(17,'James Joyce'),
	(18,'William Gibson'),
	(19,'Dante Alighieri'),
	(20,'C. S. Lewis')
;

INSERT INTO Book_Copies
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	(20,1,2),
	(1,1,2),
	(16,1,2),
	(14,1,2),
	(13,1,2),
	(11,1,2),
	(8,1,2),
	(5,1,2),
	(7,1,2),
	(12,1,2),
	(2,2,2),
	(3,2,2),
	(5,2,2),
	(8,2,2),
	(6,2,2),
	(18,2,2),
	(19,2,2),
	(17,2,2),
	(11,2,2),
	(14,2,2),
	(15,3,2),
	(13,3,2),
	(3,3,2),
	(2,3,2),
	(8,3,2),
	(9,3,2),
	(10,3,2),
	(15,3,2),
	(14,3,2),
	(11,3,2),
	(1,4,2),
	(6,4,2),
	(5,4,2),
	(3,4,2),
	(18,4,2),
	(20,4,2),
	(17,4,2),
	(13,4,2),
	(12,4,2),
	(19,4,2)
;

SELECT Title, BranchName, Number_Of_Copies FROM Book_Copies INNER JOIN Books ON Books.BookID = Book_Copies.BookID
INNER JOIN Library_Branch ON Library_Branch.BranchID = Book_Copies.BranchID
WHERE Title = 'The Lost Tribe'
AND BranchName =  'Sharpstown'

SELECT Title, BranchName, Number_Of_Copies FROM Book_Copies INNER JOIN Books ON Books.BookID = Book_Copies.BookID
INNER JOIN Library_Branch ON Library_Branch.BranchID = Book_Copies.BranchID
WHERE Title = 'The Lost Tribe'

SELECT Name, BookID, Book_Loans.CardNo FROM Book_Loans FULL OUTER JOIN Borrower ON Borrower.CardNo = Book_Loans.CardNo
WHERE Book_Loans.CardNo IS NULL

SELECT BranchName, DateDue, Title, Name, Borrower.Address  FROM Library_Branch INNER JOIN Book_Loans ON Book_Loans.BranchID = Library_Branch.BranchID
INNER JOIN Borrower ON Book_Loans.CardNo = Borrower.CardNo
INNER JOIN Books ON Book_Loans.BookID = Books.BookID
WHERE DateDue = '6/15/2020'
AND BranchName = 'Sharpstown'

SELECT BranchName, COUNT(*) AS 'Total Number of Books' FROM Library_Branch INNER JOIN Book_Loans ON Book_Loans.BranchID = Library_Branch.BranchID GROUP BY BranchName

SELECT * FROM Book_Loans ORDER BY BranchID

SELECT Name, COUNT(BookID) AS 'Total Checked-Out', Address FROM Borrower INNER JOIN Book_Loans ON Book_Loans.CardNo = Borrower.CardNo GROUP BY Name, Address HAVING COUNT(BookID) > 5

SELECT AuthorName, Title, Number_Of_Copies, BranchName FROM Books INNER JOIN Book_Authors ON Books.BookID = Book_Authors.BookID
INNER JOIN Book_Copies ON Book_Copies.BookID = Books.BookID
INNER JOIN Library_Branch ON Library_Branch.BranchID = Book_Copies.BranchID
WHERE BranchName = 'Central'
AND AuthorName = 'Stephen King'


