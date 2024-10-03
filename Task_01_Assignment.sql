Create Database SISDB
go

USE SISDB
GO

CREATE TABLE Students (
    student_id INT PRIMARY KEY IDENTITY(1,1), 
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,          
    date_of_birth DATE NOT NULL,          
    email VARCHAR(100) NOT NULL UNIQUE,     
    phone_number VARCHAR(15) NOT NULL UNIQUE            
);
GO

CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY IDENTITY(1,1), 
    first_name VARCHAR(50) NOT NULL,         
    last_name VARCHAR(50) NOT NULL,          
    email VARCHAR(100) NOT NULL UNIQUE     
);
GO

CREATE TABLE Courses (
    course_id INT PRIMARY KEY IDENTITY(1,1), 
    course_name VARCHAR(100) NOT NULL,      
    credits INT NOT NULL,       
    teacher_id INT,            
    FOREIGN KEY (teacher_id) REFERENCES Teachers (teacher_id)
);
GO


CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY IDENTITY(1,1), 
    student_id INT NOT NULL,                       
    course_id INT NOT NULL,                       
    enrollment_date DATE NOT NULL,                
    FOREIGN KEY (student_id) REFERENCES Students(student_id), 
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)   
);
GO

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY IDENTITY(1,1),  
    student_id INT NOT NULL,                  
    amount DECIMAL(10, 2) NOT NULL,          
    payment_date DATE NOT NULL,                
    FOREIGN KEY (student_id) REFERENCES Students(student_id) 
);
GO

INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number) 
VALUES 
('Amit', 'Sharma', '2001-08-12', 'amit.sharma@gmail.com', '9876543210'),
('Sneha', 'Patel', '2000-04-22', 'sneha.patel@gmail.com', '9876543211'),
('Rajesh', 'Gupta', '2002-01-10', 'rajesh.gupta@gmail.com', '9876543212'),
('Priya', 'Kumar', '2002-06-30', 'priya.kumar@gmail.com', '9876543213'),
('Vikram', 'Rao', '2000-11-25', 'vikram.rao@gmail.com', '9876543214'),
('Anjali', 'Mehta', '2001-09-14', 'anjali.mehta@gmail.com', '9876543215'),
('Rahul', 'Singh', '2000-07-18', 'rahul.singh@gmail.com', '9876543216'),
('Nisha', 'Nair', '2002-03-09', 'nisha.nair@gmail.com', '9876543217'),
('Suresh', 'Pillai', '2001-12-11', 'suresh.pillai@gmail.com', '9876543218'),
('Aarti', 'Deshmukh', '2000-02-28', 'aarti.deshmukh@gmail.com', '9876543219');
GO

INSERT INTO Teachers (first_name, last_name, email) 
VALUES 
('Ravi', 'Verma', 'ravi.verma@gmail.com'),
('Manisha', 'Joshi', 'manisha.joshi@gmail.com'),
('Sanjay', 'Shukla', 'sanjay.shukla@gmail.com'),
('Pooja', 'Khan', 'pooja.khan@gmail.com'),
('Anil', 'Kapoor', 'anil.kapoor@gmail.com'),
('Kiran', 'Sen', 'kiran.sen@gmail.com'),
('Abhishek', 'Das', 'abhishek.das@gmail.com'),
('Swati', 'Malhotra', 'swati.malhotra@gmail.com'),
('Rakesh', 'Aggarwal', 'rakesh.aggarwal@gmail.com'),
('Maya', 'Chopra', 'maya.chopra@gmail.com');
GO

INSERT INTO Courses (course_name, credits, teacher_id) 
VALUES 
('Mathematics', 3, 1),
('Computer Science', 4, 1),
('Physics', 3, 2),
('Chemistry', 3, 3),
('Biology', 3, 4),
('History', 2, 5),
('Political Science', 2, 5),
('Geography', 2, 6),
('History', 2, 6),
('Economics', 3, 7),
('Computer Science', 4, 8),
('Political Science', 2, 9),
('English Literature', 1, 9);
GO


INSERT INTO Enrollments (student_id, course_id, enrollment_date) 
VALUES 
(1, 1, '2024-09-01'),
(1, 10, '2024-09-02'),
(2, 2, '2024-09-02'),
(2, 11, '2024-09-03'),
(3, 3, '2024-09-04'),
(4, 4, '2024-09-05'),
(4, 12, '2024-09-05'),
(5, 5, '2024-09-06'),
(6, 6, '2024-09-07'),
(7, 7, '2024-09-08'),
(7, 9, '2024-09-08'),
(7, 13, '2024-09-08'),
(8, 8, '2024-09-09'),
(9, 9, '2024-09-10'),
(9, 1, '2024-09-10'),
(9, 2, '2024-09-10'),
(9, 3, '2024-09-10'),
(9, 4, '2024-09-11'),
(9, 5, '2024-09-11'),
(9, 6, '2024-09-11'),
(9, 7, '2024-09-12'),
(9, 8, '2024-09-12'),
(9, 10, '2024-09-13'),
(9, 11, '2024-09-11'),
(9, 12, '2024-09-11'),
(9, 13, '2024-09-12');
GO

INSERT INTO Payments (student_id, amount, payment_date) 
VALUES 
(1, 1000.00, '2024-09-01'),
(2, 1200.00, '2024-09-02'),
(3, 300.00, '2024-09-03'),
(4, 1100.00, '2024-09-04'),
(5, 400.00, '2024-09-05'),
(6, 300.00, '2024-09-06'),
(7, 1800.00, '2024-09-07'),
(8, 500.00, '2024-09-08'),
(9, 4500.00, '2024-09-09');
GO

SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Enrollments;
SELECT * FROM Teachers;
SELECT * FROM Payments;

