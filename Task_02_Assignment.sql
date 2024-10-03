USE SISDB
GO

/* 1. Write an SQL query to insert a new student into the "Students" table with the following details:
a. First Name: John
© Hexaware Technologies Limited. All rights www.hexaware.com
b. Last Name: Doe
c. Date of Birth: 1995-08-15
d. Email: john.doe@example.com
e. Phone Number: 1234567890
*/

INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number)
VALUES ('John', 'Doe', '1995-08-15', 'john.doe@gmail.com', '1234567890');
GO

SELECT * FROM Students;

/* 2. Write an SQL query to enroll a student in a course. 
Choose an existing student and course and insert a record into the "Enrollments" table with the enrollment date.
*/
INSERT INTO Enrollments (student_id, course_id, enrollment_date)
VALUES (1, 2, '2024-09-25'); 
GO

SELECT * FROM Enrollments;

/* 3. Update the email address of a specific teacher in the "Teacher" table. 
Choose any teacher and modify their email address.
*/
UPDATE Teachers
SET email = 'ravi.verma123@gmail.com'
WHERE teacher_id = 1;
GO

SELECT * FROM Teachers;

/* 4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. 
Select an enrollment record based on the student and course.
*/
DELETE FROM Enrollments
WHERE student_id = 7 AND course_id = 13;
GO

DELETE FROM Enrollments
WHERE student_id = 9 AND course_id = 13;
GO

SELECT * FROM Enrollments;

/* 5. Update the "Courses" table to assign a specific teacher to a course. 
Choose any course and teacher from the respective tables.
*/
UPDATE Courses
SET teacher_id = 1 
WHERE course_id = 7; 
GO

SELECT * FROM Courses;

/* 6. Delete a specific student from the "Students" table and remove all their enrollment records from the "Enrollments" table. 
Be sure to maintain referential integrity.
*/
DELETE FROM Payments
WHERE student_id = 1;

DELETE FROM Enrollments
WHERE student_id = 1;

DELETE FROM Students
WHERE student_id = 1;

SELECT * FROM Payments;
SELECT * FROM Enrollments;
SELECT * FROM Students;

/* 7. Update the payment amount for a specific payment record in the "Payments" table. 
Choose any payment record and modify the payment amount.
*/
UPDATE Payments
SET amount = 1300.00
WHERE payment_id = 2; 
GO

SELECT * FROM Payments;

