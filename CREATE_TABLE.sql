USE BUDT703_Project_0501_05

DROP TABLE IF EXISTS [Wellness.Record];
DROP TABLE IF EXISTS [Wellness.Perform];
DROP TABLE IF EXISTS [Wellness.Payment];
DROP TABLE IF EXISTS [Wellness.Testing];
DROP TABLE IF EXISTS [Wellness.Vaccination];
DROP TABLE IF EXISTS [Wellness.Student];
DROP TABLE IF EXISTS [Wellness.Employee];


CREATE TABLE [Wellness.Employee] (
empId CHAR(10) NOT NULL,
empFirstName VARCHAR(20), 
empLastName VARCHAR(20),
empGender CHAR(1), 
empType VARCHAR(20),
empInsurance VARCHAR(20),
CONSTRAINT pk_Employee_empId PRIMARY KEY (empId))

CREATE TABLE [Wellness.Student] (
stuId CHAR(10) NOT NULL,
stuFirstName VARCHAR(20), 
stuLastName VARCHAR(20), 
stuLocation VARCHAR(30), 
stuEmail VARCHAR(50),
stuGender CHAR(1), 
stuCourse VARCHAR(30),
stuInsurance VARCHAR(20),
stuDOB DATE,
CONSTRAINT pk_Student_stuId PRIMARY KEY (stuId))


CREATE TABLE [Wellness.Vaccination] (
vacId CHAR(10) NOT NULL,
vacType VARCHAR(30),
vacDate DATE,
vacStatus VARCHAR(30),
vacCost NUMERIC, 
CONSTRAINT pk_Vaccination_vacId PRIMARY KEY (vacId) )


CREATE TABLE [Wellness.Testing] (
tstId CHAR(10) NOT NULL,
tstDate DATE,
tstType VARCHAR(30), 
tstResult VARCHAR(20),
tstCost NUMERIC,
CONSTRAINT pk_Testing_tstId PRIMARY KEY (tstId))

CREATE TABLE [Wellness.Payment] (
pmtId CHAR(10)NOT NULL ,
pmtDate DATE,
vacId CHAR(10),
tstId CHAR(10),
CONSTRAINT pk_Payment_pmtId PRIMARY KEY (pmtId),
CONSTRAINT fk_Payment_vacId FOREIGN KEY (vacId)
	REFERENCES [Wellness.Vaccination] (vacId)
	ON DELETE NO ACTION ON UPDATE CASCADE,
CONSTRAINT fk_Payment_tstId FOREIGN KEY (tstId)
	REFERENCES [Wellness.Testing] (tstId)
	ON DELETE NO ACTION ON UPDATE CASCADE )


CREATE TABLE [Wellness.Perform] (
tstId CHAR(10) NOT NULL,
stuId CHAR(10),
empId CHAR(10),
CONSTRAINT pk_Perform_tstId PRIMARY KEY (tstId),
CONSTRAINT fk_Perform_tstId FOREIGN KEY (tstId)
	REFERENCES [Wellness.Testing] (tstId)
	ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_Perform_stuId FOREIGN KEY (stuId)
	REFERENCES [Wellness.Student] (stuId)
	ON DELETE NO ACTION ON UPDATE NO ACTION,
CONSTRAINT fk_Perform_empId FOREIGN KEY (empId)
	REFERENCES [Wellness.Employee] (empId)
	ON DELETE NO ACTION ON UPDATE NO ACTION )

CREATE TABLE [Wellness.Record] (
vacId CHAR(10) NOT NULL,
stuId CHAR(10) NOT NULL,
empId CHAR(10),
CONSTRAINT pk_Record_vacId PRIMARY KEY (vacId),
CONSTRAINT fk_Record_vacId FOREIGN KEY (vacId)
	REFERENCES [Wellness.Vaccination] (vacId)
	ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_Record_stuId FOREIGN KEY (stuId)
	REFERENCES [Wellness.Student] (stuId)
	ON DELETE NO ACTION ON UPDATE NO ACTION,
CONSTRAINT fk_Record_empId FOREIGN KEY (empId)
	REFERENCES [Wellness.Employee] (empId)
	ON DELETE NO ACTION ON UPDATE NO ACTION )






