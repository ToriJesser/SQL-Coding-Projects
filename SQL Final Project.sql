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
SELECT * FROM Books

CREATE TABLE Borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Name VARCHAR (50) NOT NULL,
	Address VARCHAR (50) NOT NULL,
	Phone VARCHAR (15) NOT NULL
);
SELECT * FROM Borrower

CREATE TABLE Book_Loans (
	BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut VARCHAR(20) NOT NULL,
	DateDue VARCHAR(20) NOT NULL
);
SELECT * FROM Book_Loans

CREATE TABLE Book_Authors (
	BookID INT NOT NULL CONSTRAINT fk_Book_ID FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR (50) NOT NULL
);
SELECT * FROM Book_Authors


CREATE TABLE Book_Copies (
	BookID INT NOT NULL CONSTRAINT fk_Book_ID_1 FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_Branch_ID FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL, 
);
SELECT * FROM Book_Copies


INSERT INTO Library_Branch
	(BranchName, Address)
	VALUES
	('Sharpstown', '123 Main st Sharpstown'),
	('Central', '3215 2nd st Central'),
	('Softstown', '253 Copper rd Softstown'),
	('LessSharpstown', '952 Red ct LessSharpstown')
;
SELECT * FROM Library_Branch

INSERT INTO Publisher
	(PublisherName, Phone, Address)
	VALUES
	('Penguin Random House', '981-253-1568', '1745 Broadway Manhattan'),
	('Hachette Livre', '562-451-8315', '15th arrondissement Paris'),
	('HarperCollins', '462-483-7568', '195 Broadway New York City')
	;
SELECT * FROM Publisher

INSERT INTO Books
	(Title, PublisherName)
	VALUES
	('The Lost Tribe', 'Penguin Random House'), /* Edward Marriott */
	('The Stand', 'Penguin Random House'),/* Stephen King */
	('Salem''s Lot', 'Hachette Livre'),/* Stephen King */
	('Harry Potter and the Sorcerer''s Stone', 'HarperCollins'),/* J. K. Rowling */
	('The Elements of Style', 'Hachette Livre'),/* William Jr. Strunk */
	('The Hobbit', 'Hachette Livre'),/* J. R. R. Tolkien */
	('1984', 'HarperCollins'),/* George Orwell */
	('Pride and Prejudice', 'Hachette Livre'),/* Jane Austen */
	('The Girl with the Dragon Tattoo', 'Penguin Random House'),/* Stieg Larsson */
	('The Time Traveler''s Wife', 'HarperCollins'),/* Audrey Niffenegger */
	('Ender''s Game', 'Penguin Random House'),/* Orson Scott Card */
	('A Wrinkle in Time', 'Hachette Livre'),/* Madeleine L'Engle */
	('American Gods', 'HarperCollins'),/* Neil Gaiman */
	('Lolita', 'Penguin Random House'),/* Vladimir Nabokov */
	('Siddhartha', 'HarperCollins'),/*Hermann Hesse*/
	('The Amber Spyglass', 'HarperCollins'),/* Philip Pullman */
	('Ulysses', 'Penguin Random House'),/* James Joyce */
	('Neuromancer', 'Penguin Random House'),/* William Gibson */
	('Inferno', 'HarperCollins'),/* Dante Alighieri */
	('The Silver Chair', 'HarperCollins')/* C. S. Lewis */
;





