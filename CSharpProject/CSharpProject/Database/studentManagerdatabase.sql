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
  [classteacherID] varchar(6) NOT NULL,
  [academicyearID] varchar(6) NOT NULL,
  [semesterID] varchar(6) NOT NULL,
  PRIMARY KEY ([ID]),
  CONSTRAINT [academicyearID_academicyear_ID] FOREIGN KEY ([academicyearID]) REFERENCES [AcademicYear] ([ID]),
  CONSTRAINT [semesterID_SemesterID] FOREIGN KEY ([semesterID]) REFERENCES [Semester] ([ID]),
  CONSTRAINT [gradeID_Grade_ID] FOREIGN KEY ([gradeID]) REFERENCES [Grade] ([ID])
);

-- Create table [User]
CREATE TABLE [User] (
  [ID] varchar(6) NOT NULL,
  [positionID] varchar(4) NOT NULL,
  [accessID] varchar(4) NOT NULL,
  PRIMARY KEY ([ID]),
  CONSTRAINT [positionID_ID] FOREIGN KEY ([positionID]) REFERENCES [Position] ([ID]),
  CONSTRAINT [accessID_Access_ID] FOREIGN KEY ([accessID]) REFERENCES [Access] ([ID])
);




-- Create table ClassInformation
CREATE TABLE [ClassInformation] (
  [ID] varchar(6) NOT NULL,
  [classID] varchar(6) NOT NULL,
  [name] nvarchar(100) NOT NULL,
  [maxSeat] int NOT NULL,
  [NumOfStudent] int NOT NULL,
  PRIMARY KEY ([ID], [classID]),
  CONSTRAINT [classID_Class_ID] FOREIGN KEY ([classID]) REFERENCES [Class] ([ID])
);

ALTER TABLE [Class] ADD CONSTRAINT [classteacherID_User_ID] FOREIGN KEY ([classteacherID]) REFERENCES [User] ([ID]);

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
	conductName varchar(50) NOT NULL,
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

alter table Semester add coafience int NOT NULL
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
  [ID] varchar(6) NOT NULL,
  [userID] varchar(6) NOT NULL,
  [password] varchar(100) NOT NULL,
  PRIMARY KEY ([ID]),
  CONSTRAINT [acountID_ID] FOREIGN KEY ([userID]) REFERENCES [User] ([ID])
);














