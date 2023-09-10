
-- Create table AcademicYear
CREATE TABLE [AcademicYear] (
  [ID] varchar(6) NOT NULL PRIMARY KEY,
  [name] varchar(100) NOT NULL
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
  [name] varchar(100) NOT NULL
);

-- Create table Grade
CREATE TABLE [Grade] (
  [ID] varchar(6) NOT NULL PRIMARY KEY,
  [name] varchar(100) NOT NULL
);

-- Create table Position
CREATE TABLE [Position] (
  [ID] varchar(4) NOT NULL PRIMARY KEY,
  [positionName] varchar(100) NOT NULL
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
  [classID] varchar(6) NOT NULL,
  PRIMARY KEY ([ID]),
  CONSTRAINT [positionID_ID] FOREIGN KEY ([positionID]) REFERENCES [Position] ([ID]),
  CONSTRAINT [accessID_Access_ID] FOREIGN KEY ([accessID]) REFERENCES [Access] ([ID])
);




-- Create table ClassInformation
CREATE TABLE [ClassInformation] (
  [ID] varchar(6) NOT NULL,
  [classID] varchar(6) NOT NULL,
  [name] varchar(100) NOT NULL,
  [maxSeat] int NOT NULL,
  [studentPopulation] int NOT NULL,
  PRIMARY KEY ([ID], [classID]),
  CONSTRAINT [classID_Class_ID] FOREIGN KEY ([classID]) REFERENCES [Class] ([ID])
);

ALTER TABLE [Class] ADD CONSTRAINT [classteacherID_User_ID] FOREIGN KEY ([classteacherID]) REFERENCES [User] ([ID]);

ALTER TABLE [User] ADD CONSTRAINT [classID_Class_ID] FOREIGN KEY ([classID]) REFERENCES [Class] ([ID]);

-- Create table UserInformation
CREATE TABLE [UserInformation] (
  [ID] varchar(6) NOT NULL,
  [userID] varchar(6) NOT NULL,
  [name] varchar(100) NOT NULL,
  [location] varchar(100) NOT NULL,
  [email] int NOT NULL,
  [numberphone] int NOT NULL,
  [image] int NOT NULL,
  PRIMARY KEY ([ID], [userID]),
  CONSTRAINT [userID_ID] FOREIGN KEY ([userID]) REFERENCES [User] ([ID])
);





















-- Create table ClassInformation
CREATE TABLE [ClassInformation] (
  [ID] varchar(6) NOT NULL,
  [classID] varchar(6) NOT NULL,
  [name] varchar(100) NOT NULL,
  [maxSeat] int NOT NULL,
  [studentPopulation] int NOT NULL,
  PRIMARY KEY ([ID], [classID]),
  CONSTRAINT [classID_Class_ID] FOREIGN KEY ([classID]) REFERENCES [Class] ([ID])
);

-- Create table Account
CREATE TABLE [Account] (
  [ID] varchar(6) NOT NULL,
  [userID] varchar(6) NOT NULL,
  [password] varchar(100) NOT NULL,
  PRIMARY KEY ([ID]),
  CONSTRAINT [acountID_ID] FOREIGN KEY ([userID]) REFERENCES [User] ([ID])
);













-- Create table UserInformation
CREATE TABLE [UserInformation] (
  [ID] varchar(6) NOT NULL,
  [userID] varchar(6) NOT NULL,
  [name] varchar(100) NOT NULL,
  [location] varchar(100) NOT NULL,
  [email] int NOT NULL,
  [numberphone] int NOT NULL,
  [image] int NOT NULL,
  PRIMARY KEY ([ID], [userID]),
  CONSTRAINT [userID_ID] FOREIGN KEY ([userID]) REFERENCES [User] ([ID])
);