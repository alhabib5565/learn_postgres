-- Active: 1727920009057@@127.0.0.1@5432@ph

CREATE DATABASE ph;

CREATE TABLE students (
    student_id SERIAL,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    course VARCHAR(100) NOT NULL,
    dob DATE NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    country VARCHAR(100) NOT NULL,
    blood_group VARCHAR(3) NOT NULL
);

INSERT INTO students (name, age, course, dob, email, country, blood_group)
VALUES
('John Doe', 20, 'Computer Science', '2003-05-15', 'john.doe@example.com', 'USA', 'A+'),
('Jane Smith', 22, 'Mechanical Engineering', '2001-09-23', 'jane.smith@example.com', 'Canada', 'B-'),
('Alice Johnson', 19, 'Business Administration', '2004-02-10', 'alice.johnson@example.com', 'UK', 'O+'),
('Bob Brown', 21, 'Electrical Engineering', '2002-07-18', 'bob.brown@example.com', 'Australia', 'AB-'),
('Charlie White', 23, 'Civil Engineering', '2000-11-05', 'charlie.white@example.com', 'India', 'O-'),
('Daisy Green', 20, 'Marketing', '2003-03-12', 'daisy.green@example.com', 'Germany', 'B+'),
('Evan Black', 18, 'Mathematics', '2005-06-29', 'evan.black@example.com', 'France', 'A-'),
('Fiona Blue', 21, 'Physics', '2002-01-20', 'fiona.blue@example.com', 'Italy', 'AB+'),
('George Gray', 22, 'Chemistry', '2001-10-30', 'george.gray@example.com', 'Japan', 'A+'),
('Hannah Silver', 19, 'Biology', '2004-08-14', 'hannah.silver@example.com', 'South Korea', 'O+');


CREATE TABLE person(
    person_id SERIAL NOT NULL,
    name VARCHAR(25) not NULL,
    age INT
);

SELECT * FROM person; 

INSERT INTO person (person_name, age)
    VALUES('imaran', 122);

ALTER TABLE person 
    ADD COLUMN email VARCHAR(30) NOT NULL DEFAULT 'habib@gmail.com';

ALTER TABLE person 
    DROP COLUMN email; 

ALTER Table person 
    RENAME COLUMN name to person_name;

ALTER TABLE person
    Alter COLUMN person_name type VARCHAR(50);

ALTER TABLE person
    Alter COLUMN person_name DROP NOT NULL;

ALTER TABLE person
    Alter COLUMN person_name set NOT NULL;

ALTER Table person
    ADD CHECK (age> 18)

ALTER Table person
    ADD constraint pk_person_person_id PRIMARY KEY (person_id);

ALTER Table person
    ADD constraint unique_person_person_id UNIQUE(person_id);