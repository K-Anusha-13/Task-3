use task_3;

CREATE TABLE Students (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    grade INTEGER,
    age INTEGER,
    gender TEXT,
    city TEXT
);

CREATE TABLE Teachers (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    subject TEXT,
    hire_date DATE,
    salary REAL
);

CREATE TABLE Classes (
    id INTEGER PRIMARY KEY,
    class_name TEXT,
    teacher_id INTEGER,
    FOREIGN KEY (teacher_id) REFERENCES Teachers(id)
);

CREATE TABLE Enrollments (
    id INTEGER PRIMARY KEY,
    student_id INTEGER,
    class_id INTEGER,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(id),
    FOREIGN KEY (class_id) REFERENCES Classes(id)
);


INSERT INTO Students VALUES (1, 'Amit', 'Sharma', 10, 15, 'Male', 'Delhi');
INSERT INTO Students VALUES (2, 'Neha', 'Verma', 10, 14, 'Female', 'Mumbai');
INSERT INTO Students VALUES (3, 'Rahul', 'Patel', 9, 14, 'Male', 'Bangalore');
INSERT INTO Students VALUES (4, 'Anjali', 'Reddy', 11, 16, 'Female', 'Hyderabad');
INSERT INTO Students VALUES (5, 'Arjun', 'Mehta', 12, 17, 'Male', 'Delhi');
INSERT INTO Students VALUES (6, 'Aisha', 'Khan', 10, 15, 'Female', 'Mumbai');

INSERT INTO Teachers VALUES (1, 'Suman', 'Joshi', 'Math', '2016-06-15', 55000);
INSERT INTO Teachers VALUES (2, 'Rajeev', 'Kapoor', 'Science', '2018-01-20', 60000);
INSERT INTO Teachers VALUES (3, 'Priya', 'Nair', 'English', '2014-03-10', 52000);
INSERT INTO Teachers VALUES (4, 'Vikas', 'Gupta', 'History', '2021-08-01', 48000);
INSERT INTO Teachers VALUES (5, 'Sunita', 'Singh', 'Computer', '2019-09-12', 62000);

INSERT INTO Classes VALUES (1, '10A', 1);
INSERT INTO Classes VALUES (2, '10B', 2);
INSERT INTO Classes VALUES (3, '11A', 3);
INSERT INTO Classes VALUES (4, '12A', 5);

-- Enrollments
INSERT INTO Enrollments VALUES (1, 1, 1, '2023-06-10');
INSERT INTO Enrollments VALUES (2, 2, 2, '2023-06-11');
INSERT INTO Enrollments VALUES (3, 3, 2, '2023-06-12');
INSERT INTO Enrollments VALUES (4, 4, 3, '2023-06-13');
INSERT INTO Enrollments VALUES (5, 5, 4, '2023-06-14');
INSERT INTO Enrollments VALUES (6, 6, 1, '2023-06-15');

SELECT * FROM Students;

SELECT first_name, last_name, subject FROM Teachers;

SELECT * FROM Students WHERE gender = 'Female' AND grade = 10;

SELECT * FROM Students WHERE city = 'Delhi' OR city = 'Mumbai';

SELECT * FROM Students WHERE first_name LIKE 'A%';

SELECT * FROM Teachers WHERE hire_date BETWEEN '2015-01-01' AND '2020-12-31';

SELECT * FROM Teachers ORDER BY salary DESC LIMIT 5;

SELECT * FROM Students ORDER BY age ASC LIMIT 3;

SELECT C.class_name, T.first_name || ' ' || T.last_name AS teacher_name FROM Classes C JOIN Teachers T ON C.teacher_id = T.id;

SELECT S.first_name || ' ' || S.last_name AS student_name, C.class_name, E.enrollment_date
FROM Enrollments E
JOIN Students S ON E.student_id = S.id
JOIN Classes C ON E.class_id = C.id
ORDER BY E.enrollment_date DESC;