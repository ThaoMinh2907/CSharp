CREATE DATABASE dataStudentManager;
use dataStudentManager;
CREATE TABLE [AcademicYear] (
  [ID] varchar(6) NOT NULL PRIMARY KEY,
  [name] nvarchar(100) NOT NULL
);

-- Create table Access
CREATE TABLE [Access] (
  [ID] varchar(4) NOT NULL PRIMARY KEY,
  [createData] int NOT NULL,
  [readData] int NOT NULL,
  [updateData] int NOT NULL,
  [deleteData] int NOT NULL
);

-- Create table Semester
CREATE TABLE [Semester] (
  [ID] varchar(6) NOT NULL PRIMARY KEY,
  [name] nvarchar(100) NOT NULL
);

-- Create table Grade
CREATE TABLE [Grade] (
  [ID] varchar(6) NOT NULL PRIMARY KEY,
  [name] nvarchar(100) NOT NULL
);

-- Create table Position
CREATE TABLE [Position] (
  [ID] varchar(4) NOT NULL PRIMARY KEY,
  [positionName] nvarchar(100) NOT NULL
);


-- Create table Class
CREATE TABLE [Class] (
  [ID] varchar(6) NOT NULL,
  [gradeID] varchar(6) NOT NULL,
  [academicyearID] varchar(6) NOT NULL,
  [semesterID] varchar(6) NOT NULL,
  PRIMARY KEY ([ID]),
  CONSTRAINT [academicyearID_academicyear_ID] FOREIGN KEY ([academicyearID]) REFERENCES [AcademicYear] ([ID]),
  CONSTRAINT [semesterID_SemesterID] FOREIGN KEY ([semesterID]) REFERENCES [Semester] ([ID]),
  CONSTRAINT [gradeID_Grade_ID] FOREIGN KEY ([gradeID]) REFERENCES [Grade] ([ID])
);


CREATE TABLE [Assignment] (
	ID VARCHAR(6) PRIMARY KEY NOT NULL,
	positionID VARCHAR(4) NOT NULL,
	classID VARCHAR(6) NOT NULL,
  assignmentName NVARCHAR(100),
	CONSTRAINT [Assignment_positionID_Position_ID] FOREIGN KEY ([positionID]) REFERENCES [Position] ([ID]),
	 CONSTRAINT [Assignment_classID_Class_ID] FOREIGN KEY ([classID]) REFERENCES [Class] ([ID])
)

-- Create table [User]
CREATE TABLE [User] (
  [ID] varchar(6) NOT NULL,
  [accessID] varchar(4) NOT NULL,
  [assignmentID] VARCHAR (6),
  PRIMARY KEY ([ID]),
  CONSTRAINT [accessID_Access_ID] FOREIGN KEY ([accessID]) REFERENCES [Access] ([ID]),
  CONSTRAINT [User_assignmentID_Assignment_ID] FOREIGN KEY ([assignmentID]) REFERENCES [Assignment] ([ID])
);



-- Create table ClassInformation
CREATE TABLE [ClassInformation] (
  [classID] varchar(6) NOT NULL,
  [name] nvarchar(100) NOT NULL,
  [maxSeat] int NOT NULL,
  [NumOfStudent] int NOT NULL,
  PRIMARY KEY ([ID], [classID]),
  CONSTRAINT [classID_Class_ID] FOREIGN KEY ([classID]) REFERENCES [Class] ([ID])
);







-- Create table UserInformation
CREATE TABLE [UserInformation] (
  [ID] varchar(6) NOT NULL,
  [userID] varchar(6) NOT NULL,
  [name] nvarchar(100) NOT NULL,
  [birthday] datetime NOT NULL,
  [location] varchar(100) NOT NULL,
  [email] int NOT NULL,
  [numberphone] int NOT NULL,
  [image] int NOT NULL,
  PRIMARY KEY ([ID]),
  CONSTRAINT [userID_ID] FOREIGN KEY ([userID]) REFERENCES [User] ([ID])
);

---Create table TypeofPoint
CREATE TABLE TypeofPoint(
	pointID varchar(6) NOT NULL,
	pointName nvarchar(50) NOT NULL,
	coafience int NOT NULL,
	PRIMARY KEY(pointID),
	);

--create table Subject
CREATE TABLE Subject(
	subjectID varchar(6) NOT NULL,
	subjectName nvarchar(50) NOT NULL,
	lesson int NOT NULL,
	coafience int NOT NULL,
	primary key(subjectID),
	);

---Create table Point
CREATE TABLE Point(
	userID varchar(6) NOT NULL,
	subjectID varchar(6) NOT NULL,
	semesterID varchar(6) NOT NULL,
	academicYearID varchar(6) NOT NULL,
	typeOfPointID varchar(6) NOT NULL,
	point float NOT NULL,
	primary key(userID,subjectID,semesterID,academicYearID,typeOfPointID))
	;
Alter TABLE  Point
add Constraint  point_userID Foreign key (userID) references [User](ID);
Alter TABLE  point  add Constraint point_subject Foreign key (subjectID)  references [Subject] (subjectID);

Alter table POINT add Constraint  Point_semesterID Foreign key (semesterID) references Semester (ID);

Alter table point add constraint point_academicYearID foreign key (academicYearID) references AcademicYear(ID);
Alter table point add constraint point_typePointID foreign key (typeOfPointID) references TypeofPoint(pointID);

--CREATE TABLE CONDUCT
CREATE TABLE Conduct( /*hạnh kiểm*/
	conductID varchar(6) NOT NULL,
	conductName nvarchar(50) NOT NULL,
	primary key (conductID));
---CREATE TABLE Capacity
CREATE TABLE Capacity(/*học lực*/
	capacityID varchar(6) NOT NULL,
	capacityName nvarchar(50) NOT NULL,
	lowerLimit float NOT NULL,/*điểm cận dưới*/
	upperLimit float NOT NULL,/*điểm cận trên*/
	paraPoint  float NOT NULL, /*điểm khống chế*/
	Primary key(capacityID));
---CREATE TABLE Result
CREATE TABLE Result(
	resultID varchar(6) NOT NULL,
	resultName nvarchar(50) NOT NULL,
	Primary key(resultID));
---CREATE TABLE Result_User_AcedamicYear
CREATE TABLE Result_User_AcedamicYear(
	userID varchar(6) NOT NULL,
	classID varchar(6) NOT NULL,
	academicYearID varchar(6) NOT NULL,
	conductID varchar(6) NOT NULL,
	capacityID varchar(6) NOT NULL,
	resultID varchar (6) NOT NULL,
	pointSemester1 float NOT NULL,
	pointSemester2 float NOT NULL,
	pointSemester float NOT NULL,
	primary key (userID,classID,academicYearID,conductID,capacityID,resultID),
	Constraint result_user foreign key (userID) references [User](ID),
	Constraint result_class foreign key (classID) references class (ID),
	Constraint result_acedamicYearID foreign key(academicYearID) references AcademicYear(ID),
	Constraint result_conductID foreign key (conductID) references Conduct(conductID),
	Constraint result_capacityID foreign key (capacityID) references Capacity(capacityID),
	Constraint result_resultID foreign key (resultID) references Result(resultID));

-- alter table Semester add coafience int NOT NULL
---CREATE TABLE Result_user_Subject
CREATE TABLE Result_user_subject(
	userID varchar(6) NOT NULL,
	classID varchar(6) NOT NULL,
	academicYearID varchar(6) NOT NULL,
	subjectID varchar(6) NOT NULL,
	semesterID varchar(6) NOT NULL,
	mouthPoint float , /*diemmieng*/
	minute15Point float ,/*diem15phut*/
	minute45Point float,/*diem45phut*/
	gradePoint float ,/*diemthi*/
	primary key (userID,classID,academicYearID,subjectID,semesterID),
	Constraint resul_pointSubject_user foreign key (userID) references [User] (ID),
	Constraint result_pointSubject_class foreign key(classID) references [Class](ID),
	Constraint result_pointSubject_academicYear foreign key(academicYearID) references AcademicYear (ID),
	Constraint result_pointSubject_Subject foreign key(subjectID) references [Subject](subjectID),
	Constraint result_pointSubject_semester foreign key(semesterID) references Semester (ID),
	);
	
-- select * from point;

-- Create table Account
CREATE TABLE [Account] (
  [username] varchar(100) NOT NULL,
  [userID] varchar(6) NOT NULL,
  [password] varchar(100) NOT NULL,
  PRIMARY KEY ([username]),
  CONSTRAINT [acountID_ID] FOREIGN KEY ([userID]) REFERENCES [User] ([ID])
);










-------------------- INSERT DATA --------------------



GO
INSERT INTO [Position]
VALUES('GVBM', 'Giáo Viên Bộ Môn') ,
      ('VTHU', 'Văn Thư') ,
      ('HTRU', 'Hiệu Trưởng') ,
      ('HPHO', 'Hiệu Phó') ,
      ('THKY', 'Thư Ký') ,
      ('HOCS', 'Học Sinh') ;

GO


INSERT INTO ACCESS (ID,
                    createData,
                    readData,
                    updateData,
                    deleteData)
VALUES ('1110', 1, 1, 1, 0),
       ('1011', 1, 0, 1, 1),
       ('0100', 0, 1, 0, 0),
       ('1101', 1, 1, 0, 1),
       ('1111', 1, 1, 1, 1);

GO


INSERT INTO Grade
VALUES('KHOI10', N'Khối lớp 10'),
      ('KHOI11', N'Khối lớp 11'),
      ('KHOI12', N'Khối lớp 12');

GO


INSERT INTO AcademicYear
VALUES ('022023', N'Năm học 2022 - 2023'),
       ('023024', N'Năm học 2023 - 2024'),
       ('024025', N'Năm học 2024 - 2025');

GO


INSERT INTO TypeofPoint
VALUES ('DIEMTX', N'Điểm đánh giá thường xuyên', 1),
       ('DIEMGK', N'Điểm giữa kỳ', 2),
       ('DIEMCK', N'Điểm cuối kỳ', 3),
       ('DIEMTB', N'Điểm trung bình môn', 1);

GO
INSERT INTO Semester
VALUES ('HOCKY1', N'Học kỳ 1'),
       ('HOCKY2', N'Học kỳ 2'),
       ('HOCKY3', N'Học kỳ 3');

GO
INSERT INTO CLASS
VALUES ('10A123', 'KHOI10', '023024', 'HOCKY1'),
       ('10A223', 'KHOI10', '023024', 'HOCKY1'),
       ('10A323', 'KHOI10', '023024', 'HOCKY1'),
       ('11A123', 'KHOI11', '023024', 'HOCKY1'),
       ('11A223', 'KHOI11', '023024', 'HOCKY1'),
       ('11A323', 'KHOI11', '023024', 'HOCKY1'),
       ('12A123', 'KHOI12', '023024', 'HOCKY1'),
       ('12A223', 'KHOI12', '023024', 'HOCKY1'),
       ('12A323', 'KHOI12', '023024', 'HOCKY1');

GO
INSERT INTO [Assignment]
VALUES ('GVVL23', 'GVBM', '10A123', N'Giáo viên bộ môn vật lý'),
       ('GVHH23', 'GVBM', '10A123', N'Giáo viên bộ môn hoá học'),
       ('GVTH23', 'GVBM', '10A123', N'Giáo viên bộ môn toán học');

GO 
INSERT INTO ClassInformation VALUES ('10A123', N'Lớp 10A1', 40, 35),
('10A223', N'Lớp 10A2', 40, 38),
('10A323', N'Lớp 10A3', 40, 40),
('11A123', N'Lớp 11A1', 40, 35),
('11A223', N'Lớp 11A2', 40, 36),
('11A323', N'Lớp 11A3', 40, 33),
('12A123', N'Lớp 12A1', 40, 40),
('12A223', N'Lớp 12A2', 40, 31),
('12A323', N'Lớp 12A3', 40, 32);