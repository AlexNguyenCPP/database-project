CREATE TABLE `PROFESSOR` (
  `Ssn` int NOT NULL,
  `Name` varchar(40) DEFAULT NULL,
  `Street` varchar(40) DEFAULT NULL,
  `City` varchar(40) DEFAULT NULL,
  `State` varchar(40) DEFAULT NULL,
  `Zip` char(5) DEFAULT NULL,
  `Phone` char(7) DEFAULT NULL,
  `AreaCode` char(3) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `Salary` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`Ssn`)
); 

CREATE TABLE `PROFESSOR_DEGREES` (
  `Pssn` int NOT NULL,
  `Degree` varchar(20) NOT NULL,
  PRIMARY KEY (`Pssn`,`Degree`),
  FOREIGN KEY (`Pssn`) REFERENCES `PROFESSOR` (`Ssn`)
);

CREATE TABLE `DEPARTMENT` (
  `Number` int NOT NULL,
  `Name` varchar(40) DEFAULT NULL,
  `PhoneNo` char(10) DEFAULT NULL,
  `Location` varchar(40) DEFAULT NULL,
  `Cssn` int DEFAULT NULL,
  PRIMARY KEY (`Number`),
  FOREIGN KEY (`Cssn`) REFERENCES `PROFESSOR` (`Ssn`)
);

CREATE TABLE `COURSE` (
  `CourseNo` int NOT NULL,
  `CourseTitle` varchar(40) DEFAULT NULL,
  `Textbook` varchar(40) DEFAULT NULL,
  `Units` int DEFAULT NULL,
  `Dno` int DEFAULT NULL,
  PRIMARY KEY (`CourseNo`),
  FOREIGN KEY (`Dno`) REFERENCES `DEPARTMENT` (`Number`)
);

CREATE TABLE `PREREQUISITES` (
  `Cno` int NOT NULL,
  `Prereq` varchar(20) NOT NULL,
  PRIMARY KEY (`Cno`,`Prereq`),
  FOREIGN KEY (`Cno`) REFERENCES `COURSE` (`CourseNo`)
);

CREATE TABLE `SECTION` (
  `SectionNo` int NOT NULL,
  `Cno` int NOT NULL,
  `NoSeats` int DEFAULT NULL,
  `Pssn` int DEFAULT NULL,
  `BeginTime` varchar(10) DEFAULT NULL,
  `EndTime` varchar(10) DEFAULT NULL,
  `Classroom` varchar(10) DEFAULT NULL,
  `Days` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`SectionNo`,`Cno`),
  FOREIGN KEY (`Cno`) REFERENCES `COURSE` (`CourseNo`),
  FOREIGN KEY (`Pssn`) REFERENCES `PROFESSOR` (`Ssn`)
);

CREATE TABLE `STUDENT` (
  `Cwid` int NOT NULL,
  `PhoneNo` char(10) DEFAULT NULL,
  `Address` varchar(40) DEFAULT NULL,
  `Fname` varchar(20) DEFAULT NULL,
  `Lname` varchar(20) DEFAULT NULL,
  `Major` int DEFAULT NULL,
  PRIMARY KEY (`Cwid`),
  FOREIGN KEY (`Major`) REFERENCES `DEPARTMENT` (`Number`)
); 

CREATE TABLE `STUDENT_MINOR` (
  `Sid` int NOT NULL,
  `Minor` int NOT NULL,
  PRIMARY KEY (`Sid`,`Minor`),
  FOREIGN KEY (`Sid`) REFERENCES `STUDENT` (`Cwid`),
  FOREIGN KEY (`Minor`) REFERENCES `DEPARTMENT` (`Number`)
); 

CREATE TABLE `ENROLLMENT` (
  `Sid` int NOT NULL,
  `CourseSection` int NOT NULL,
  `CourseNumber` int NOT NULL,
  `Grade` varchar(2) NOT NULL,
  PRIMARY KEY (`Sid`,`CourseSection`,`CourseNumber`,`Grade`),
  FOREIGN KEY (`Sid`) REFERENCES `STUDENT` (`Cwid`),
  FOREIGN KEY (`CourseSection`) REFERENCES `SECTION` (`SectionNo`),
  FOREIGN KEY (`CourseNumber`) REFERENCES `SECTION` (`Cno`)
); 