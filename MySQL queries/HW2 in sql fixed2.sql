CREATE DATABASE university;
USE university;

CREATE TABLE Address (
ID int NOT NULL primary key AUTO_INCREMENT, Country varchar(20) default 'Kazakhstan', County varchar(20), City varchar(20), Street varchar(20), Number int
);

CREATE TABLE Person (
ID INT NOT NULL primary key AUTO_INCREMENT, FirstName varchar(20), LastName varchar(20), PhoneNumber INT, BirthDate date, AddressID INT not null ,
FOREIGN KEY(AddressID) REFERENCES Address (ID)
);

CREATE TABLE Student ( ID INT NOT NULL primary key AUTO_INCREMENT, PersonID INT UNIQUE, Description varchar(255),
FOREIGN KEY (PersonID) REFERENCES Person (ID));

CREATE TABLE Teacher ( ID INT NOT NULL primary key AUTO_INCREMENT,  Position VARCHAR(30), PersonID INT UNIQUE,
FOREIGN KEY (PersonID) REFERENCES Person (ID));

CREATE TABLE Course ( ID INT NOT NULL primary key AUTO_INCREMENT, Name VARCHAR(10), Credits int, Description varchar(255), TeacherID int,
FOREIGN KEY (TeacherID) REFERENCES Teacher (ID));

insert into Address (County, City, Street, Number)
VALUES
('West Kazakhstan', 'Ust-Kamenogorsk', 'Furmanov ', 67),
('East Kazakhstan ', 'Atyrau', 'Abay', 71),
('North Kazakhstan', 'Almaty', 'Tole bi', 69),
('Mangystau', 'Pavlodar', 'Gogol', 28),
('Jambyl', 'Nur-Sultan', 'Abylai Khan', 48);

INSERT INTO Person(FirstName, LastName, PhoneNumber, BirthDate, AddressID) 
VALUES
('Aziz', 'Khaliev', 1, '2002-09-05', 1),
('Amir', 'Yaldush', 8, '1999-11-12', 2),
('Alibek', 'Agzimov', 5, '1998-08-12', 3),
('Aida', 'Shabdul', 9, '2010-05-12', 4),
('Karina', 'Khalieva', 5, '2000-06-02', 3);	

INSERT INTO Student(PersonID, Description) 
VALUES
(1, 'intelligent,creative,clever'), 
(2, 'sociable,good leader, SAT 1460'),
(3, 'smart,good at biology');

INSERT INTO Teacher(Position, PersonID)
VALUES
('Master of Science', 5),
('Professor', 4);

INSERT INTO Course (Name, Credits, Description, TeacherID)
VALUES
('Economics', 2, ' full point', 4),
('Calculus', 4, 'medium point', 3);

select * from Address;
select * from Person;
select * from Student;
select * from Teacher;
select * from Course;