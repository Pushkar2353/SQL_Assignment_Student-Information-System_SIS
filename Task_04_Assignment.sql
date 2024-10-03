USE SISDB
GO

/* 1. Write an SQL query to calculate the average number of students enrolled in each course. 
Use aggregate functions and subqueries to achieve this.
*/
SELECT AVG(student_count) AS average_students_per_course
FROM (
    SELECT COUNT(e.student_id) AS student_count
    FROM Enrollments e
    GROUP BY e.course_id
) AS enrollment_counts;


/* 2. Identify the student(s) who made the highest payment. 
Use a subquery to find the maximum payment amount and then retrieve the student(s) associated with that amount.
*/
SELECT s.first_name, s.last_name, p.amount
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
WHERE p.amount = (SELECT MAX(amount) FROM Payments);


/* 3. Retrieve a list of courses with the highest number of enrollments. 
Use subqueries to find the course(s) with the maximum enrollment count.
*/
SELECT c.course_name, enrollment_count
FROM Courses c
JOIN (
    SELECT course_id, COUNT(student_id) AS enrollment_count
    FROM Enrollments
    GROUP BY course_id
) AS course_enrollments ON c.course_id = course_enrollments.course_id
WHERE enrollment_count = (
    SELECT MAX(enrollment_count)
    FROM (
        SELECT COUNT(student_id) AS enrollment_count
        FROM Enrollments
        GROUP BY course_id
    ) AS enrollment_counts
);


/* 4. Calculate the total payments made to courses taught by each teacher. 
Use subqueries to sum payments for each teacher's courses.
*/
SELECT t.first_name, t.last_name, (
    SELECT SUM(p.amount)
    FROM Payments p
    JOIN Enrollments e ON p.student_id = e.student_id
    JOIN Courses c ON e.course_id = c.course_id
    WHERE c.teacher_id = t.teacher_id
) AS total_payments
FROM Teachers t;


/* 5. Identify students who are enrolled in all available courses. 
Use subqueries to compare a student's enrollments with the total number of courses.
*/
INSERT INTO Enrollments (student_id, course_id, enrollment_date)
VALUES (9, 13, '2024-09-15');
SELECT * FROM Enrollments;

SELECT s.first_name, s.last_name
FROM Students s
WHERE NOT EXISTS (
    SELECT c.course_id
    FROM Courses c
    WHERE NOT EXISTS (
        SELECT e.enrollment_id
        FROM Enrollments e
        WHERE e.course_id = c.course_id AND e.student_id = s.student_id
    )
);


/* 6. Retrieve the names of teachers who have not been assigned to any courses. 
Use subqueries to find teachers with no course assignments.
*/
SELECT t.first_name, t.last_name
FROM Teachers t
WHERE NOT EXISTS (
    SELECT 1
    FROM Courses c
    WHERE c.teacher_id = t.teacher_id
);


/* 7. Calculate the average age of all students. 
Use subqueries to calculate the age of each student based on their date of birth.
*/
SELECT AVG(age) AS average_age
FROM (
    SELECT 
        DATEDIFF(YEAR, date_of_birth, GETDATE()) AS age
    FROM Students
) AS AgeCalculation;


/* 8. Identify courses with no enrollments. 
Use subqueries to find courses without enrollment records.
*/
DELETE FROM Enrollments
WHERE student_id = 9 AND course_id = 5;

DELETE FROM Enrollments
WHERE student_id = 5 AND course_id = 5;

SELECT * FROM Enrollments;

SELECT course_name
FROM Courses
WHERE course_id NOT IN (
    SELECT DISTINCT course_id FROM Enrollments
);

/* 9. Calculate the total payments made by each student for each course they are enrolled in. 
Use subqueries and aggregate functions to sum payments.
*/
SELECT s.first_name, s.last_name, c.course_name, (
    SELECT SUM(p.amount)
    FROM Payments p
    JOIN Enrollments e ON p.student_id = e.student_id
    WHERE e.student_id = s.student_id AND e.course_id = c.course_id
) AS total_payments
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;


/* 10. Identify students who have made more than one payment. 
Use subqueries and aggregate functions to count payments per student and filter for those with counts greater than one.
*/
INSERT INTO Payments (student_id, amount, payment_date)
VALUES (2, 600.00, '2024-09-20');

SELECT * FROM Payments;

SELECT s.first_name, s.last_name, COUNT(p.payment_id) AS payment_count
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.first_name, s.last_name
HAVING COUNT(p.payment_id) > 1;


/* 11. Write an SQL query to calculate the total payments made by each student. 
Join the "Students" table with the "Payments" table and use GROUP BY to calculate the sum of payments for each student.
*/
SELECT s.first_name, s.last_name, SUM(p.amount) AS total_payments
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.first_name, s.last_name;


/* 12. Retrieve a list of course names along with the count of students enrolled in each course. 
Use JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to count enrollments.
*/
SELECT c.course_name, COUNT(e.student_id) AS student_count
FROM Courses c
JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;


/* 13. Calculate the average payment amount made by students. 
Use JOIN operations between the "Students" table and the "Payments" table and GROUP BY to calculate the average.
*/
SELECT AVG(p.amount) AS average_payment
FROM Students s
JOIN Payments p ON s.student_id = p.student_id;
