CREATE DATABASE Relations
USE Relations

-- Problem 01

CREATE TABLE Passports
(
PassportID INT PRIMARY KEY,
PassportNumber CHAR(8) CHECK (LEN(PassportNUmber) = 8) NOT NULL,
)

INSERT INTO Passports
VALUES
(101, 'N34FG21B'),
(102, 'K65LO4R7'),
(103, 'ZE657QP2')

CREATE TABLE Persons
(
PersonID INT PRIMARY KEY IDENTITY,
FirstName NVARCHAR(50) NOT NULL,
Salary DECIMAL(7,2) NOT NULL,
PassportID INT FOREIGN KEY REFERENCES Passports(PassportID) NOT NULL,
)

INSERT INTO Persons
VALUES
('Roberto', 43300.00, 102),
('Tom', 56100.00, 103),
('Yana', 60200.00, 101)

-- Problem 02

CREATE TABLE Manufacturers
(
ManufacturerID INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(50) NOT NULL,
EstablishedOn DATETIME2 NOT NULL
)

INSERT INTO Manufacturers
VALUES
('BMW', '07-03-1916'),
('Tesla', '01-01-2003'),
('Lada', '01-05-1966')

CREATE TABLE Models
(
ModelID INT PRIMARY KEY IDENTITY(101,1),
[Name] NVARCHAR(50) NOT NULL,
ManufacturerID INT FOREIGN KEY REFERENCES Manufacturers(ManufacturerID)
)

INSERT INTO Models
VALUES
('X1',1),
('i6',1),
('Model S',2),
('Model X',2),
('Model 3',2),
('Nova',3)

-- Problem 03

CREATE TABLE Students
(
StudentID INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(50) NOT NULL
)

INSERT INTO Students
VALUES
('Mila'),
('Toni'),
('Ron')

CREATE TABLE Exams
(
ExamID INT PRIMARY KEY IDENTITY(101,1),
[Name] NVARCHAR(50) NOT NULL
)

INSERT INTO Exams
VALUES
('SpringMVC'),
('Neo4j'),
('Oracle 11g')

CREATE TABLE StudentsExams
(
StudentID INT FOREIGN KEY REFERENCES Students(StudentID) NOT NULL,
ExamID INT FOREIGN KEY REFERENCES Exams(ExamID) NOT NULL
CONSTRAINT PK_StudentsExamsPK PRIMARY KEY (StudentID,ExamID)
)

INSERT INTO StudentsExams
VALUES
(1,101),
(1,102),
(2,101),
(3,103),
(2,102),
(2,103)

-- Problem 04

CREATE TABLE Teachers
(
TeacherID INT PRIMARY KEY IDENTITY(101,1),
[Name] NVARCHAR(50) NOT NULL,
ManagerID INT FOREIGN KEY REFERENCES Teachers(TeacherID) NULL
)

INSERT INTO Teachers
VALUES
('John', NULL),
('Maya', 106),
('Silvia', 106),
('Ted', 105),
('Mark', 101),
('Greta', 101)

-- Problem 05

CREATE TABLE Cities
(
CityID INT PRIMARY KEY IDENTITY,
[Name] VARCHAR(50) NOT NULL
)

CREATE TABLE Customers
(
CustomerID INT PRIMARY KEY IDENTITY,
[Name] VARCHAR(50) NOT NULL,
Birthday DATE NOT NULL,
CityID INT FOREIGN KEY REFERENCES Cities(CityID)
)

CREATE TABLE ItemTypes
(
ItemTypeID INT PRIMARY KEY IDENTITY,
[Name] VARCHAR(50)
)

CREATE TABLE Items
(
ItemID INT PRIMARY KEY IDENTITY,
[Name] VARCHAR(50),
ItemTypeID INT FOREIGN KEY REFERENCES ItemTypes(ItemTypeID)
)

CREATE TABLE Orders
(
OrderID INT PRIMARY KEY IDENTITY,
CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID)
)

CREATE TABLE OrderItems
(
OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
ItemID INT FOREIGN KEY REFERENCES Items(ItemID)
CONSTRAINT PK_OrderItems PRIMARY KEY(OrderID, ItemID)
)

-- Problem 07

CREATE TABLE Majors
(
MajorID INT PRIMARY KEY IDENTITY,
[Name] VARCHAR(50)
)

CREATE TABLE Subjects
(
SubjectID INT PRIMARY KEY IDENTITY,
SubjectName VARCHAR(50)
)

CREATE TABLE Students
(
StudentID INT PRIMARY KEY IDENTITY,
StudentNumber INT,
StudentName VARCHAR(50),
MajorID INT FOREIGN KEY REFERENCES Majors(MajorID)
)

CREATE TABLE Payments
(
PaymentID INT PRIMARY KEY IDENTITY,
PaymentDate DATE,
PaymentAmount DECIMAL(18,2),
StudentID INT FOREIGN KEY REFERENCES Students(StudentID)
)

CREATE TABLE Agenda
(
StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
SubjectID INT FOREIGN KEY REFERENCES Subjects(SubjectID)
CONSTRAINT PK_StudentsSubjects PRIMARY KEY (StudentID,SubjectID)
)