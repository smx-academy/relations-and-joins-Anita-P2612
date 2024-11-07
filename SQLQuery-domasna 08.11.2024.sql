		--Domasna
		--Task 1: School Database
CREATE TABLE students(
	student_id INT PRIMARY KEY,
	first_name VARCHAR (20),
	last_name VARCHAR (50),
	birth_date VARCHAR (10),
	enrolement_year VARCHAR (10)
	subject_id INT
);

CREATE TABLE professors(
	professor_id INT PRIMARY KEY,
	first_name VARCHAR (20),
	last_name VARCHAR (50),
	department VARCHAR (50),
	hire_date VARCHAR (10)
);

CREATE TABLE subjects(
	subject_id INT PRIMARY KEY,
	subject_name VARCHAR (50),
	professor_id INT,

FOREIGN KEY(professor_id) REFERENCES professors(professor_id)
);
FOREIGN KEY(subject_id) REFERENCES students(subject_id)
);

	

INSERT INTO students(student_id, first_name, last_name, birth_date, enrolement_year)
VALUES 
(1, 'Ana', 'Petrovska', '01.01.1990', '2020'),
(2, 'Marko', 'Stojanov', '01.02.1991', '2021'),
(3, 'Elena', 'Kostovska', '01.03.1990', '2022'),
(4, 'Igor', 'Dimitrov', '01.04.1991', '2020'),
(5, 'Viktor', 'Stefanov', '01.05.1991', '2021');

INSERT INTO professors(professor_id, first_name, last_name, department, hire_date)
VALUES 
(1, 'Maja', 'Petrovska', 'Economics', '01.01.1965'),
(2, 'Zarko', 'Stojanov', 'Economics', '01.01.1966'),
(3, 'Milena', 'Kostovska', 'Legal', '01.01.1965'),
(4, 'Saso', 'Dimitrov', 'Accounting', '01.01.1970'),
(5, 'Viktor', 'Angelov', 'Marketing', '01.01.1970'),
(6, 'Saso', 'Stojanovski', 'Accounting', '01.01.1968'),
(7, 'Vasko', 'Trpevski', 'Legal', '01.01.1969');

INSERT INTO subjects(subject_id, subject_name, professor_id)
VALUES 
(1, 'Ustavno pravo', 3),
(2, 'Osnovi na smetkovodstvo', 4),
(3, 'Statistika', 6),
(4, 'Management', 1),
(5, 'Matematika', 2),
(6, 'Marketing', 5);

--Query 1: Retrieve a list of all students enrolled after a specific year (e.g., 2020)

SELECT * FROM subjects;
SELECT * FROM students;

SELECT * FROM students WHERE enrolement_year>2020;

	--Query 2: Find the subjects taught by a particular professor by using the professor's ID.

SELECT sub.subject_name
FROM subjects AS sub
INNER JOIN professors AS prof
ON sub.professor_id = prof.professor_id
WHERE prof.professor_id = 6;

	--Query 3: List all students' names and enrollment years, filtered by department (for example, list all students under a department where professors belong).

SELECT s.first_name, s.last_name, s.enrolement_year, prof.department, sub.subject_name
FROM students AS s
INNER JOIN subjects AS sub
ON s.subject_id = sub.subject_id
INNER JOIN professors AS prof
ON sub.professor_id=prof.professor_id
GROUP BY prof.department;







