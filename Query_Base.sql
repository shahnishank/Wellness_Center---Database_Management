USE BUDT703_Project_0501_05

-- What are the details of students who have taken Covid-19 vaccines and tested negative in Covid test?
SELECT DISTINCT s.stuId AS 'Student ID', CONCAT(s.stuFirstName, ' ', s.stuLastName) AS 'Student Name', s.stuGender AS 'Gender', s.stuEmail AS 'E-mail ID', s.stuCourse AS 'Course', s.stuInsurance AS 'Insurance Type', s.stuLocation AS 'Location', s.stuDOB AS 'Date of Birth'
FROM [Wellness.Record] r, [Wellness.Perform] p, [Wellness.Student] s, [Wellness.Vaccination] v, [Wellness.Testing] t
WHERE (r.vacId = v.vacId) AND (r.stuId = s.stuId) AND (v.vacType = 'Covid-19 Vaccine')
	AND (p.tstId = t.tstId) AND (p.stuId = s.stuId) AND (t.tstType = 'Covid Test')
	AND (t.tstResult = 'Negative')

-- What are the details of all the students who have taken COVID-19 vaccine?
SELECT DISTINCT s.stuId AS 'Student ID', CONCAT(s.stuFirstName, ' ', s.stuLastName) AS 'Student Name', s.stuGender AS 'Gender', s.stuEmail AS 'E-mail ID', s.stuCourse AS 'Course', s.stuInsurance AS 'Insurance Type', s.stuLocation AS 'Location', s.stuDOB AS 'Date of Birth'
FROM [Wellness.Record] r, [Wellness.Student] s, [Wellness.Vaccination] v
WHERE (r.vacId = v.vacId) AND (r.stuId = s.stuId) AND (v.vacType = 'Covid-19 Vaccine')


-- What are the names and employee ID(s) of employees who have administered most number of vaccines

SELECT r1.empId AS 'Employee ID', CONCAT(e.empFirstName, ' ', e.empLastName) AS 'Employee Name', COUNT(r1.empId) AS 'Number of Vaccinations Administered'
FROM [Wellness.Record] r1, [Wellness.Employee] e
WHERE e.empId = r1.empId
GROUP BY r1.empId, e.empFirstName, e.empLastName
HAVING COUNT(r1.empId) =  (
	SELECT TOP 1 COUNT(r1.empId)
	FROM [Wellness.Record] r1
	GROUP BY r1.empId
	ORDER BY COUNT(r1.empId) DESC)

-- What are the number of different vaccines taken by students in decreasing order
SELECT v.vacType AS 'Vaccination Type', COUNT(v.vacId) AS 'Count of Vaccines Administered'
FROM [Wellness.Vaccination] v
GROUP BY v.vacType
ORDER BY COUNT(v.vacId) DESC;

-- Total amount billed on each of the tests and vaccinations.
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

-- Students that are cleared to enter the University [fully vaccinated or covid negative in last 30 days]

SELECT DISTINCT s.stuId AS "Student ID", CONCAT(s.stuFirstName, ' ', s.stuLastName) AS "Student Name",
	s.stuGender AS "Gender", s.stuLocation AS "Location", s.stuEmail AS "E-mail ID", s.stuDOB AS "Date Of Birth"
FROM [Wellness.Record] r, [Wellness.Perform] p, [Wellness.Student] s, 
[Wellness.Vaccination] v, [Wellness.Testing] t
WHERE ((r.vacId = v.vacId) AND (r.stuId = s.stuId) AND (v.vacType = 'Covid-19 Vaccine'))
OR ((p.tstId = t.tstId) AND (p.stuId = s.stuId) AND (t.tstType = 'Covid Test') 
AND (DATEDIFF(DAY, t.tstDate, GETDATE()) < 30))

