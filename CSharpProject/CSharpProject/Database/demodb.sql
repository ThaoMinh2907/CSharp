--use demo;
--DROP database StudentManager;
CREATE DATABASE StudentManager;

USE StudentManager;
-- 1

-- Tạo bảng điểm
CREATE TABLE Point(
	studentID VARCHAR(8) NOT NULL,
	classID VARCHAR(8) NOT NULL,
	gradeID VARCHAR(6) NOT NULL,
	typeofpointID VARCHAR(8) NOT NULL,
	subjectID VARCHAR(8), -- Giá trị này NULL nếu loại điểm là điểm hạnh kiểm
	academicyearID VARCHAR(8) NOT NULL,
	semesterID VARCHAR(6) NOT NULL,
	point INT,
	PRIMARY KEY (studentID, classID, typeofpointID, 
		subjectID, academicyearID, semesterID, gradeID)
)
-- Tạo bảng học kì
CREATE TABLE Semester (
	ID VARCHAR(6) NOT NULL,
	semesterName NVARCHAR(100),
	coefficient INT, -- Hệ số của học kì	
	PRIMARY KEY (ID)
)
-- Thêm các khoá chính và khoá ngoại
ALTER TABLE Point 
	ADD CONSTRAINT Point_semesterID_Semester_ID 
	FOREIGN KEY (semesterID) REFERENCES Semester(ID)
-- Tạo bảng năm học
CREATE TABLE AcademicYear (
	ID VARCHAR(8) NOT NULL,
	academicyearName NVARCHAR(100),
	PRIMARY KEY (ID)
)
-- Thêm các khoá chính và khoá ngoại
ALTER TABLE Point 
	ADD CONSTRAINT Point_academicyearID_AcademicYear_ID 
	FOREIGN KEY (academicyearID) REFERENCES AcademicYear(ID)
-- Tạo bảng phân loại điểm
CREATE TABLE TypeOfPoint(
	ID VARCHAR(8) NOT NULL,
	pointName NVARCHAR (100),
	coefficient INT, -- Hệ số của loại điểm
	PRIMARY KEY (ID)
)
-- Thêm các khoá chính và khoá ngoại
ALTER TABLE Point 
	ADD CONSTRAINT Point_typeofpointID_TypeOfPonit_ID 
	FOREIGN KEY (typeofpointID) REFERENCES TypeOfPoint(ID)
-- Tạo bảng môn học
CREATE TABLE Subject(
	ID VARCHAR(8) NOT NULL,
	typeofsubjectID VARCHAR(8),
	subjectName VARCHAR(100),
	PRIMARY KEY (ID)
)
-- Thêm các khoá chính và khoá ngoại
ALTER TABLE Point 
	ADD CONSTRAINT Point_subjectID_Subject_ID 
	FOREIGN KEY (subjectID) REFERENCES Subject(ID)
-- Tạo bảng loại môn học
CREATE TABLE TypeOfSubject(
	ID VARCHAR(8) NOT NULL,
	subjectName VARCHAR(100),
	totalTest INT, -- Tổng bài test thường xuyên của môn học
	PRIMARY KEY (ID)
)
-- Thêm các khoá chính và khoá ngoại
ALTER TABLE [Subject] 
	ADD CONSTRAINT Subject_typeofsubjectID_TypeOfSubject_ID
	FOREIGN KEY (typeofsubjectID) REFERENCES TypeOfSubject(ID)

-- Tạo bảng chức vụ
CREATE TABLE Position(
	ID VARCHAR(8) NOT NULL,
	positionName NVARCHAR(100),
	PRIMARY KEY (ID)
)
--	Tạo bảng phân công
CREATE TABLE Assignment(
	teacherID VARCHAR(8) NOT NULL,
	gradeID VARCHAR(6) NOT NULL,
	classID VARCHAR (8),
	semesterID VARCHAR(6),
	positionID VARCHAR (8),
	academicyearID VARCHAR (8),
	subjectID VARCHAR (8)
	PRIMARY KEY (teacherID, classID, semesterID, 
	positionID, academicyearID, subjectID, gradeID)
)
-- Thêm các khoá chính và khoá ngoại
ALTER TABLE Assignment 
	ADD CONSTRAINT Assignment_semesterID_Semester_ID
	FOREIGN KEY (semesterID) REFERENCES Semester(ID)
ALTER TABLE Assignment 
	ADD CONSTRAINT Assignment_academicyearID_AcademicYear_ID
	FOREIGN KEY (academicyearID) REFERENCES AcademicYear(ID)
ALTER TABLE Assignment 
	ADD CONSTRAINT Assignment_subjectID_Subject_ID
	FOREIGN KEY (subjectID) REFERENCES Subject(ID)
ALTER TABLE Assignment 
	ADD CONSTRAINT Assignment_positionID_Position_ID
	FOREIGN KEY (positionID) REFERENCES Position(ID)

-- Tạo bảng học sinh
CREATE TABLE Student(
	ID VARCHAR(8) NOT NULL,
	classID VARCHAR (8) NOT NULL,
	gradeID VARCHAR (6) NOT NULL,
	studentName NVARCHAR(100),
	studentBirthday DATETIME,	
	studentPhone VARCHAR (11),
	studentEmail VARCHAR (100),
	studentparentName NVARCHAR (100),
	studentparentBirthday DATETIME,
	birthplace NVARCHAR(100),
	currentResidence NVARCHAR(100),
	image VARCHAR(100),
	PRIMARY KEY (ID, classID, gradeID)
)

-- Tạo bảng giáo viên
CREATE TABLE Teacher(
	ID VARCHAR(8) NOT NULL,
	teacherName NVARCHAR(100),
	birthday DATETIME,
	birthplace NVARCHAR(8),
	email VARCHAR(100),
	phonenumber VARCHAR(11),
	currentResidence NVARCHAR(100),
	image VARCHAR(100),
	PRIMARY KEY (ID)	
)

-- Thêm các khoá chính và khoá ngoại
ALTER TABLE [Assignment]  
	ADD CONSTRAINT Assignment_teacherID_Teacher_ID
	FOREIGN KEY (teacherID) REFERENCES Teacher(ID)

-- Tạo bảng tài khoản 
CREATE TABLE Account(
	username VARCHAR(100) NOT NULL,
	password VARCHAR(100),
	teacherID VARCHAR(8),
	PRIMARY KEY (username)
)
-- Thêm các khoá chính và khoá ngoại
ALTER TABLE [Account]  
	ADD CONSTRAINT Account_teacherID_Teacher_ID
	FOREIGN KEY (teacherID) REFERENCES Teacher(ID)
-- Tạo bảng lớp học
CREATE TABLE Class(
	ID VARCHAR(8) NOT NULL,
	gradeID VARCHAR(6) NOT NULL,
	className NVARCHAR(100),
	maxStudent INT,
	quantityStudent INT,
	quantityMale INT,
	quantityFemale INT,
	PRIMARY KEY (ID, gradeID)
)
-- Thêm các khoá chính và khoá ngoại
ALTER TABLE Student  
	ADD CONSTRAINT Student_classID_Class_ID
	FOREIGN KEY (classID, gradeID) REFERENCES class(ID, gradeID)
--ALTER TABLE Student 
--	ADD CONSTRAINT PK_Student_classID_Class_ID
--	PRIMARY KEY (classID)
	-- Thêm các khoá chính và khoá ngoại
ALTER TABLE Point 
	ADD CONSTRAINT Point_studentID_classID_gradeID_Student_ID_classID_gradeID
	FOREIGN KEY (studentID, classID, gradeID) REFERENCES Student(ID, classID, gradeID)
	
ALTER TABLE [Assignment]  
	ADD CONSTRAINT Assignment_classID_gradeID_Class_ID_gradeID
	FOREIGN KEY (classID, gradeID) REFERENCES Class(ID, gradeID)
-- Tạo bảng khối lớp
CREATE TABLE Grade(
	ID VARCHAR(6) NOT NULL,
	gradeName NVARCHAR(100),
	maxclassofGrade INT,
	quatityclassofGrade INT
	PRIMARY KEY (ID)	
)
ALTER TABLE Point 
	ADD CONSTRAINT Point_gradeID_Grade_ID
	FOREIGN KEY (gradeID) REFERENCES Grade(ID)
ALTER TABLE Student  
	ADD CONSTRAINT Student_gradeID_Grade_ID
	FOREIGN KEY (gradeID) REFERENCES Grade(ID)
ALTER TABLE Class 
	ADD CONSTRAINT Class_gradeID_Grade_ID
	FOREIGN KEY (gradeID) REFERENCES Grade(ID)
ALTER TABLE Assignment 
	ADD CONSTRAINT Assignment_gradeID_Grade_ID
	FOREIGN KEY (gradeID) REFERENCES Grade(ID)
-- Tạo bảng hạnh kiểm
CREATE TABLE Conduct(
	ID VARCHAR(8) NOT NULL,
	conductName NVARCHAR(100),
	upperLimit INT,
	lowerLimit INT,
	PRIMARY KEY (ID)
)

-- Tạo bảng học lực 
CREATE TABLE Capacity(
	ID VARCHAR(8) NOT NULL,
	capacitytName NVARCHAR(100),
	upperLimit INT,
	lowerLimit INT,
	paraPoint INT,
	PRIMARY KEY (ID)
)
-- Tạo bảng tổng kết cuối mỗi học kỳ
CREATE TABLE Summary(
	studentID VARCHAR(8) NOT NULL,
	classID VARCHAR(8) NOT NULL,
	studentconductID VARCHAR(8) NOT NULL,
	studentcapacityID VARCHAR(8) NOT NULL,
	academicyearID VARCHAR(8) NOT NULL,
	semesterID VARCHAR(6) NOT NULL,
	gradeID VARCHAR(6) NOT NULL,
	subjectID VARCHAR(8) NOT NULL,
	point INT,
	PRIMARY KEY (studentID, classID, studentconductID, studentcapacityID, 
		academicyearID, semesterID, gradeID, subjectID) 
)
-- ALTER TABLE Summary 
-- 	ADD CONSTRAINT Summary_capacityID_Capacity_ID
-- 	FOREIGN KEY (capacityID) REFERENCES Capacity(ID)
-- ALTER TABLE Summary 
-- 	ADD CONSTRAINT Summary_conductID_Capacity_ID
-- 	FOREIGN KEY (conductID) REFERENCES Conduct(ID)
	
	-- Thêm các khoá chính và khoá ngoại
ALTER TABLE Summary  
	ADD CONSTRAINT Summary_studentID_classID_gradeID_Student_ID_classID_gradeID
	FOREIGN KEY (studentID, classID, gradeID) REFERENCES Student(ID, classID, gradeID)
ALTER TABLE Summary 
	ADD CONSTRAINT Summary_subjectID_Subject_ID
	FOREIGN KEY (subjectID) REFERENCES Subject(ID)
ALTER TABLE Summary 
	ADD CONSTRAINT Summary_semesterID_Semester_ID
	FOREIGN KEY (semesterID) REFERENCES Semester(ID)
ALTER TABLE Summary 
	ADD CONSTRAINT Summary_academicyearID_AcademicYear_ID
	FOREIGN KEY (academicyearID) REFERENCES AcademicYear(ID)
ALTER TABLE Summary 
	ADD CONSTRAINT Summary_gradeID_Grade_ID
	FOREIGN KEY (gradeID) REFERENCES Grade(ID)
ALTER TABLE Summary 
	ADD CONSTRAINT Summary_classID_gradeID_Class_ID_gradeID
	FOREIGN KEY (classID, gradeID) REFERENCES Class(ID, gradeID)
	
	
	
CREATE TABLE StudentConduct(
	studentconductID VARCHAR(8) NOT NULL,
	studentID VARCHAR(8) NOT NULL,
	classID VARCHAR(8) NOT NULL,
	academicyearID VARCHAR(8) NOT NULL,
	semesterID VARCHAR(6) NOT NULL,
	gradeID VARCHAR(6) NOT NULL,
	conductName NVARCHAR(100),
	point INT,
	PRIMARY KEY (studentconductID, studentID, classID, 
		academicyearID, semesterID, gradeID) 
)

ALTER TABLE StudentConduct
	ADD CONSTRAINT StudentConduct_studentID_classID_gradeID_Student_ID_classID_gradeID
	FOREIGN KEY (studentID, classID, gradeID)
	REFERENCES Student(ID, classID, gradeID) 
ALTER TABLE StudentConduct
	ADD CONSTRAINT StudentConduct_gradeID_Grade_ID
	FOREIGN KEY (gradeID) REFERENCES Grade(ID)
ALTER TABLE StudentConduct
	ADD CONSTRAINT StudentConduct_classID_gradeID_Class_ID_Grade
	FOREIGN KEY (classID, gradeID) REFERENCES Class(ID, gradeID)

ALTER TABLE StudentConduct
	ADD CONSTRAINT StudentConduct_academicyearID_AcademicYear_ID
	FOREIGN KEY (academicyearID) REFERENCES AcademicYear(ID)


ALTER TABLE StudentConduct
	ADD CONSTRAINT StudentConduct_semesterID_Semester_ID
	FOREIGN KEY (semesterID) REFERENCES Semester(ID)

ALTER TABLE Summary
	ADD CONSTRAINT Summary_studentconductID_classID_studentID_academicyearID_semesterID_StudentConduct_ID
	FOREIGN KEY (studentconductID, studentID, classID, academicyearID, semesterID, gradeID)
	REFERENCES StudentConduct(studentconductID, studentID, classID, academicyearID, semesterID, gradeID)


CREATE TABLE StudentCapacity(
	studentcapacityID VARCHAR(8) NOT NULL,
	studentID VARCHAR(8) NOT NULL,
	classID VARCHAR(8) NOT NULL,
	academicyearID VARCHAR(8) NOT NULL,
	semesterID VARCHAR(6) NOT NULL,
	gradeID VARCHAR(6) NOT NULL,
	capacityName NVARCHAR(100),
	PRIMARY KEY (studentcapacityID, studentID, classID, 
		academicyearID, semesterID, gradeID) 
)	
	
ALTER TABLE StudentCapacity
	ADD CONSTRAINT StudentCapacity_studentID_classID_gradeID_Student_ID_classID_gradeID
	FOREIGN KEY (studentID, classID, gradeID)
	REFERENCES Student(ID, classID, gradeID) 



ALTER TABLE StudentCapacity
	ADD CONSTRAINT studentcapacity_gradeID_Grade_ID
	FOREIGN KEY (gradeID) REFERENCES Grade(ID)
ALTER TABLE StudentCapacity
	ADD CONSTRAINT studentcapacity_classID_gradeID_Class_ID_Grade
	FOREIGN KEY (classID, gradeID) REFERENCES Class(ID, gradeID)

ALTER TABLE StudentCapacity
	ADD CONSTRAINT studentcapacity_academicyearID_AcademicYear_ID
	FOREIGN KEY (academicyearID) REFERENCES AcademicYear(ID)


ALTER TABLE StudentCapacity
	ADD CONSTRAINT studentcapacity_semesterID_Semester_ID
	FOREIGN KEY (semesterID) REFERENCES Semester(ID)

ALTER TABLE Summary
	ADD CONSTRAINT Summary_studentcapacityID_classID_studentID_academicyearID_semesterID_studentcapacity_ID
	FOREIGN KEY (studentcapacityID, studentID, classID, academicyearID, semesterID, gradeID)
	REFERENCES StudentCapacity(studentcapacityID, studentID, classID, academicyearID, semesterID, gradeID)

INSERT INTO Grade
VALUES('KHOI10', N'Khối lớp 10', 5, 3),
      ('KHOI11', N'Khối lớp 11', 5, 3),
      ('KHOI12', N'Khối lớp 12', 5, 3)




INSERT INTO AcademicYear
VALUES ('20222023', N'Năm học 2022 - 2023'),
       ('20232024', N'Năm học 2023 - 2024'),
       ('20242025', N'Năm học 2024 - 2025')




INSERT INTO TypeofPoint
VALUES ('DIEMDGTX', N'Điểm đánh giá thường xuyên', 1),
       ('DIEMDGGK', N'Điểm giữa kỳ', 2),
       ('DIEMDGCK', N'Điểm cuối kỳ', 3),
       ('DIEMDGTB', N'Điểm trung bình môn', 1)


INSERT INTO Semester
VALUES ('HOCKY1', N'Học kỳ 1', 1),
       ('HOCKY2', N'Học kỳ 2', 2)
       
INSERT INTO [Position]
VALUES('GVBMON', N'Giáo Viên Bộ Môn') ,
      ('VANTHU', N'Văn Thư') ,
      ('HTRUONG', N'Hiệu Trưởng') ,
      ('HIEUPHO', N'Hiệu Phó') ,
      ('THUKY', N'Thư Ký') ,
      ('HOCSINH', N'Học Sinh') 





	  