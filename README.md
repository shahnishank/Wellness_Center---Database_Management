# Student Health and Wellness Center - Database Management System

## Background and Overview
- A database for the University Administration to store and verify if student health details align with protocols.
- Working to send kits to students before arrival, process the kits, and report the test results to the Terps Wellness Center.
- Provide diagnostics for students who report exposure or illness symptoms.
- Diagnostics in these cases may include other kinds of tests such as blood analysis, strep, and any number of other doctor-prescribed tests.
- Offered to provide distribution of flu vaccines and COVID-19 vaccines.
- Terps Wellness Center issues the tests and takes full responsibility for making payment.

#### Data Source: 
For UHC Employees: https://health.umd.edu/about-us/meet-our-staff.
For Student: Survey of fellow classmates.

This project involves developing a database to manage student health and wellness data at the University of Maryland (UMD). The database includes information about students, employees, vaccinations, COVID-19 testing, medical records, and payments.


## Mission Statement 

- Maintain a robust and accurate database, including all the information on students and UHC employees.
- Storing vaccinations and medical tests, and the corresponding payment details for the same.

## Mission Objectives
- Details of students who have taken Covid-19 vaccines and tested negative in COVID test.
- Details of all the students who have taken COVID-19 vaccine.
- Employee ID(s) of employees who have administered most number of vaccines.
- Types of vaccines administered and their quantity in decreasing order.
- Total amount billed owing to tests and vaccinations.
- Details of students who are cleared to enter the university.

## Entity-Relationship Diagram

<img width="468" alt="image" src="https://github.com/shahnishank/Wellness_Center---Database_Management/assets/108402877/bd43aa93-62cb-4cea-a637-b8cd6771aa74">



### List of Tables

**1. Student Table**

Creating 'Student' Table:

```sql
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
```

<img width="451" alt="image" src="https://github.com/shahnishank/Wellness_Center---Database_Management/assets/108402877/89ba3d92-5c30-4f33-a480-44472b7ebcbc">

**2. Employee Table**

Creating 'Employee' Table:

```sql
CREATE TABLE [Wellness.Employee] (
empId CHAR(10) NOT NULL,
empFirstName VARCHAR(20), 
empLastName VARCHAR(20),
empGender CHAR(1), 
empType VARCHAR(20),
empInsurance VARCHAR(20),
CONSTRAINT pk_Employee_empId PRIMARY KEY (empId))
```

<img width="372" alt="image" src="https://github.com/shahnishank/Wellness_Center---Database_Management/assets/108402877/a29ba840-1774-43a7-a691-4c2fa8471ce6">

**3. Vaccination Table**

Creating 'Vaccination' Table:

```sql
CREATE TABLE [Wellness.Vaccination] (
vacId CHAR(10) NOT NULL,
vacType VARCHAR(30),
vacDate DATE,
vacStatus VARCHAR(30),
vacCost NUMERIC, 
CONSTRAINT pk_Vaccination_vacId PRIMARY KEY (vacId) )
```

<img width="318" alt="image" src="https://github.com/shahnishank/Wellness_Center---Database_Management/assets/108402877/821588dc-1835-420a-9406-3ac9ce48f36e">

**4. Testing Table**

Creating 'Testing' Table:

```sql
CREATE TABLE [Wellness.Testing] (
tstId CHAR(10) NOT NULL,
tstDate DATE,
tstType VARCHAR(30), 
tstResult VARCHAR(20),
tstCost NUMERIC,
CONSTRAINT pk_Testing_tstId PRIMARY KEY (tstId))
```

<img width="262" alt="image" src="https://github.com/shahnishank/Wellness_Center---Database_Management/assets/108402877/d4337c1e-0148-4e8a-8d5e-f79650686e50">

**5. Record Table**

Creating 'Record' Table:

```sql
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
```

<img width="239" alt="image" src="https://github.com/shahnishank/Wellness_Center---Database_Management/assets/108402877/4da1e8b9-eeaa-4b8d-89fa-f662c468ee64">

**6. Perform Table**

Creating 'Perform' Table:

```sql
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
```

<img width="222" alt="image" src="https://github.com/shahnishank/Wellness_Center---Database_Management/assets/108402877/65c008b3-8e32-43c3-94c0-7cbe11be8b2a">

**7. Payment Table**

Creating 'Payment' Table:

```sql
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
<img width="357" alt="image" src="https://github.com/shahnishank/Wellness_Center---Database_Management/assets/108402877/4bf2a99f-8d71-4ccd-a666-c71d78c81099">
```

<img width="240" alt="image" src="https://github.com/shahnishank/Wellness_Center---Database_Management/assets/108402877/cc3648ce-a8e8-4a8f-8db0-3d5c2375f6ca">


## Referential Integrity Table

| Relation | Foreign Key | Base Relation | Primary Key | Business Rule | ON DELETE | Business Rule | ON UPDATE |
|-----------|--------------|----------------|--------------|----------------|------------|----------------|------------|
| Record    | stuId        | Student       | stuId        | R1            | NO ACTION | R2            | NO ACTION |
| Record    | empId        | Employee      | empId        | R3            | NO ACTION | R4            | NO ACTION |
| Record    | vacId        | Vaccination   | vacId        | R5            | CASCADE   | R6            | CASCADE   |
| Payment   | vacId        | Vaccination   | vacId        | R7            | NO ACTION | R8            | CASCADE   |
| Payment   | tstId        | Testing       | tstId        | R9            | NO ACTION | R10           | CASCADE   |
| Perform   | stuId        | Student       | stuId        | R11           | NO ACTION | R12           | NO ACTION |
| Perform   | empId        | Employee      | empId        | R13           | NO ACTION | R14           | NO ACTION |
| Perform   | tstId        | Testing       | tstId        | R15           | CASCADE   | R16           | CASCADE   |


## Testing

To ensure the database is correctly populated and functioning optimally, the following queries were executed:

```sql
SELECT *
FROM [Wellness.Student]
SELECT *
FROM [Wellness.Employee]
SELECT *
FROM [Wellness.Vaccination]
SELECT *
FROM [Wellness.Testing]
SELECT *
FROM [Wellness.Record]
SELECT *
FROM [Wellness.Perform]
SELECT *
FROM [Wellness.Payment]
```

### SQL Queries
The mission objectives were achieved based on the following business transactions, enabled by SQL Querying:

#### Transaction 1: Students with COVID-19 Vaccines and Negative Test Results

This query retrieves the details of students who have taken the COVID-19 vaccine and tested negative in a COVID-19 test.

```sql
SELECT DISTINCT s.stuId AS 'Student ID', CONCAT(s.stuFirstName, ' ', s.stuLastName) AS 'Student Name', s.stuGender AS 'Gender', s.stuEmail AS 'E-mail ID', s.stuCourse AS 'Course', s.stuInsurance AS 'Insurance Type', s.stuLocation AS 'Location', s.stuDOB AS 'Date of Birth'
FROM [Wellness.Record] r, [Wellness.Perform] p, [Wellness.Student] s, [Wellness.Vaccination] v, [Wellness.Testing] t
WHERE (r.vacId = v.vacId) AND (r.stuId = s.stuId) AND (v.vacType = 'Covid-19 Vaccine')
AND (p.tstId = t.tstId) AND (p.stuId = s.stuId) AND (t.tstType = 'Covid Test')
AND (t.tstResult = 'Negative')
```
- Result:

<img width="612" alt="image" src="https://github.com/shahnishank/Wellness_Center---Database_Management/assets/108402877/fb632ead-777d-4f19-897a-8104b1925b91">

#### Transaction 2: Employee(s) with Most Vaccines Administered

This query retrieves the names and employee IDs of the employee(s) who have administered the most vaccines.

```sql
SELECT r1.empId AS 'Employee ID', CONCAT(e.empFirstName, ' ', e.empLastName) AS 'Employee Name', COUNT(r1.empId) AS 'Number of Vaccinations Administered'
FROM [Wellness.Record] r1, [Wellness.Employee] e
WHERE e.empId = r1.empId
GROUP BY r1.empId, e.empFirstName, e.empLastName
HAVING COUNT(r1.empId) = (
    SELECT TOP 1 COUNT(r1.empId)
    FROM [Wellness.Record] r1
    GROUP BY r1.empId
    ORDER BY COUNT(r1.empId) DESC
)
```
- Result:

<img width="364" alt="image" src="https://github.com/shahnishank/Wellness_Center---Database_Management/assets/108402877/b439a1a4-ac8e-48e0-8a7c-ad0f9771ee04">

#### Transaction 3: Students Who Have Taken the COVID-19 Vaccine

This query retrieves the details of all students who have taken the COVID-19 vaccine.

```sql
SELECT DISTINCT s.stuId AS 'Student ID', CONCAT(s.stuFirstName, ' ', s.stuLastName) AS 'Student Name', s.stuGender AS 'Gender', s.stuEmail AS 'E-mail ID', s.stuCourse AS 'Course', s.stuInsurance AS 'Insurance Type', s.stuLocation AS 'Location', s.stuDOB AS 'Date of Birth'
FROM [Wellness.Record] r, [Wellness.Student] s, [Wellness.Vaccination] v
WHERE (r.vacId = v.vacId) AND (r.stuId = s.stuId) AND (v.vacType = 'Covid-19 Vaccine')
```
- Result:

<img width="612" alt="image" src="https://github.com/shahnishank/Wellness_Center---Database_Management/assets/108402877/019c9721-3529-4653-9137-4678ab878bd4">

#### Transaction 4: Number of Different Vaccines Taken by Students

This query retrieves the number of different vaccines taken by students, ordered in descending order.

```sql
SELECT v.vacType AS 'Vaccination Type', COUNT(v.vacId) AS 'Count of Vaccines Administered'
FROM [Wellness.Vaccination] v
GROUP BY v.vacType
ORDER BY COUNT(v.vacId) DESC;
```
- Result:
- 
<img width="270" alt="image" src="https://github.com/shahnishank/Wellness_Center---Database_Management/assets/108402877/782114f4-7634-4900-a52d-dc26693bc7cd">

#### Transaction 5: Total Amount Billed for Tests and Vaccinations

This query retrieves the total amount billed for each test and vaccination.

```sql
SELECT RESULTS.*
FROM(
    SELECT DISTINCT v.vacType AS "Service Name", SUM(v.vacCost) AS "Total Cost of Services"
    FROM [Wellness.Vaccination] v
    GROUP BY v.vacType
    UNION
    SELECT DISTINCT t.tstType AS "Service Name", SUM(t.tstCost) AS "Total Cost of Services"
    FROM [Wellness.Testing] t
    GROUP BY t.tstType
) RESULTS
ORDER BY RESULTS.[Total Cost of Services] DESC
```
- Result:

<img width="134" alt="image" src="https://github.com/shahnishank/Wellness_Center---Database_Management/assets/108402877/05b6a475-2467-4a5b-b568-6f82b68d17a7">

#### Transaction 6: Students Cleared to Enter the University

This query retrieves the details of students who are cleared to enter the university (fully vaccinated or had a negative COVID-19 test within the last 30 days).

```sql
SELECT DISTINCT s.stuId AS "Student ID", CONCAT(s.stuFirstName, ' ', s.stuLastName) AS "Student Name", s.stuGender AS "Gender", s.stuLocation AS "Location", s.stuEmail AS "E-mail ID", s.stuDOB AS "Date Of Birth"
FROM [Wellness.Record] r, [Wellness.Perform] p, [Wellness.Student] s, [Wellness.Vaccination] v, [Wellness.Testing] t
WHERE ((r.vacId = v.vacId) AND (r.stuId = s.stuId) AND (v.vacType = 'Covid-19 Vaccine'))
OR ((p.tstId = t.tstId) AND (p.stuId = s.stuId) AND (t.tstType = 'Covid Test') AND (DATEDIFF(DAY, t.tstDate, GETDATE()) < 30))
```
- Result:

<img width="298" alt="image" src="https://github.com/shahnishank/Wellness_Center---Database_Management/assets/108402877/e3fbd30a-2949-437a-af97-e7168663b00b">

## Conclusion

This README file provides an overview of the project, data acquisition process, testing procedures, and the mission objectives achieved through various business transactions.


