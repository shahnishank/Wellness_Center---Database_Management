USE BUDT703_Project_0501_05

INSERT INTO [Wellness.Employee] VALUES
	('E202010010', 'Anu', 'Abraham', 'F', 'Nurse', 'University'),
	('E202010020', 'Charon', 'Wallace', 'F', 'Nurse' ,'Personal'),
	('E202010015', 'Carrie', 'Jacobs' , 'F', 'Clinician', 'University'),
	('E202010033', 'George', 'Thomas', 'M', 'Assistant Nurse', 'University'),
	('E202010040', 'Joy', 'Howard', 'F', 'Clinician', 'Personal'),
	('E202010045', 'Andrea', 'Potter', 'F', 'Nurse', 'University'),
	('E202010017', 'Sabina', 'Trejo', 'F', 'Clinician', 'Personal')
	

INSERT INTO [Wellness.Student] VALUES
	('S119158562', 'Jia-Pei', 'Wu', 'Off Campus', 'jiapei22@umd.edu', 'F', 'In Person', 'Other', '1999-08-01'),
	('S119252109', 'Zehao', 'Lin', 'Off Campus', 'zlin1013@umd.edu', 'M', 'In Person', 'School', '1999-10-13'),
	('S119365724', 'Nishank', 'Shah', 'Off Campus', 'nishank7@umd.edu', 'M', 'In Person', 'School', '1998-12-15'),
	('S117444377', 'Deep', 'Singh', 'Off Campus', 'pds11@umd.edu', 'M', 'In Person', 'School', '1997-10-30'),
	('S119256633', 'Ria', ' Moghe', 'On Campus', 'riamoghe@ummd.edu', 'F', 'In Person', 'School', '1999-02-09'),
	('S118602394', 'Shivani', 'Mehta', 'Off Campus', 'shiv9796@umd.edu', 'F', 'Online', 'Other', '1996-07-09'),
	('S119385289', 'Rashi', 'Sharma', 'On Campus', 'rashis18@umd.edu', 'F', 'In Person', 'School', '1998-07-18'),
	('S119422601', 'Udit', 'Singh', 'Off Campus', 'usingh14@umd.edu', 'M' ,'Online', 'School', '1997-07-02'),
	('S119222041', 'Shival', 'Sehgal', 'Off Campus', 'ssehgal7@umd.edu', 'M', 'In Person', 'School', '1997-05-12'),
	('S119256534', 'Rishikesh', 'Jadhav', 'On Campus', 'rjadhav1@umd.edu', 'M', 'In Person', 'School', '1999-12-22'),
	('S117657432', 'Jack', 'Wesolowski', 'Off Campus', 'jackw2@terpmail.umd.edu', 'M', 'Online', 'Other', '2000-01-12'),
	('S119399545', 'Joseph', 'Thomas', 'Off Campus', 'joseph10@umd.edu', 'M', 'In Person', 'School', '2000-10-10')

INSERT INTO [Wellness.Vaccination] VALUES 
	('V202110004', 'Covid-19 Vaccine', '2021-06-01', 'First Shot', 20),
	('V202110009', 'Covid-19 Vaccine', '2021-06-03', 'First Shot', 20),
	('V202110014', 'Covid-19 Vaccine', '2021-06-05', 'First Shot', 20),
	('V202110010', 'Covid-19 Vaccine', '2021-06-05', 'First Shot', 20),
	('V202110003', 'Covid-19 Vaccine', '2021-12-10', 'Second Shot', 15),
	('V202110020', 'HPV Vaccine', '2021-08-20', 'First Shot', 10),
	('V202110025', 'Covid-19 Vaccine', '2021-12-23', 'Second Shot', 10),
	('V202110044', 'HPV Vaccine', '2021-06-21', 'First Shot', 10),
	('V202110019', 'HPV Vaccine', '2021-09-03', 'Second Shot', 10),
	('V202110040', 'Covid-19 Vaccine', '2021-12-20', 'Second Shot', 15),
	('V202110028', 'Covid-19 Vaccine', '2021-12-13', 'Second Shot', 15),
	('V202110075', 'Covid-19 Vaccine', '2021-12-15', 'Second Shot', 15),
	('V202110008', 'Flu Shot', '2021-06-15', 'Completed', 10),
	('V202110080', 'Flu Shot', '2021-08-01', 'Completed', 10),
	('V202110011', 'Flu Shot', '2021-07-19', 'Completed', 10),
	('V202110005', 'Covid-19 Vaccine', '2021-06-13', 'First Shot', 20),
	('V202110013', 'Covid-19 Vaccine', '2021-12-13', 'Second Shot', 15),
	('V202110001', 'HPV Vaccine', '2021-07-19', 'First Shot', 10)
	
	
INSERT INTO [Wellness.Testing] VALUES 
	('T201505148', '2021-08-05', 'Covid Test', 'Negative', 10),
	('T201505138', '2021-08-10', 'Strep Test', 'Negative', 15),
	('T201505140', '2021-08-15', 'Covid Test', 'Positive', 10),
	('T201505150', '2021-08-29', 'Covid Test', 'Negative', 10),
	('T201505125', '2021-08-15', 'Strep Test', 'Negative', 15),
	('T201505117', '2021-07-05', 'Blood Test', 'Good', 10),
	('T201505197', '2021-08-20', 'Blood Test', 'Medium', 10),
	('T201505168', '2021-08-11', 'Covid Test', 'Negative', 10),
	('T201505118', '2021-06-19', 'Strep Test', 'Negative', 15),
	('T201505144', '2021-08-17', 'Blood Test', 'Good', 10),
	('T201505130', '2022-01-29', 'Covid Test', 'Positive', 10),
	('T201505173', '2021-08-27', 'Covid Test', 'Negative', 10),
	('T201505169', '2021-07-30', 'Strep Test', 'Negative', 15),
	('T201505128', '2021-05-29', 'Covid Test', 'Positive', 10),
	('T201505133', '2021-06-01', 'Covid Test', 'Negative', 10)
	
	
INSERT INTO [Wellness.Payment] VALUES 
	('P503321974', '2021-07-05', NULL, 'T201505117'),
	('P245632342', '2021-08-20', NULL, 'T201505197'),
	('P301262619', '2021-09-12', 'V202110004', 'T201505148'),
	('P245632350', '2021-09-14', 'V202110009', 'T201505150'),
	('P246632360', '2021-09-25', 'V202110014', 'T201505168'),
	('P245632345', '2021-09-10', 'V202110010', 'T201505140'),
	('P245632344', '2022-01-20', 'V202110008', 'T201505138'),
	('P245632370', '2022-01-04', 'V202110080', 'T201505125'),
	('P245632336', '2021-09-14', 'V202110011', 'T201505169'),
	('P245632360', '2021-07-15', 'V202110005', 'T201505128'),
	('P245632353', '2021-12-15', 'V202110013', NULL)
	

INSERT INTO [Wellness.Perform]  VALUES 
	('T201505148', 'S119365724', 'E202010020'),
	('T201505140', 'S119252109', 'E202010010'),
	('T201505150', 'S117444377', 'E202010015'),
	('T201505117', 'S119365724', 'E202010020'),
	('T201505197', 'S119256633', 'E202010010'),
	('T201505144', 'S119422601', 'E202010045'),
	('T201505169', 'S119158562', 'E202010033'),
	('T201505128', 'S119256534', 'E202010010'),
	('T201505133', 'S117657432', 'E202010045')
	
	
INSERT INTO [Wellness.Record]  VALUES
	('V202110004', 'S119365724', 'E202010020'),
	('V202110009', 'S117444377', 'E202010020'),
	('V202110014', 'S119385289', 'E202010010'),
	('V202110011', 'S119158562', 'E202010015'),
	('V202110020', 'S119222041', 'E202010010'),
	('V202110019', 'S118602394', 'E202010033'),
	('V202110080', 'S117444377', 'E202010015'),
	('V202110008', 'S119422601', 'E202010017'),
	('V202110003', 'S119365724', 'E202010010'),
	('V202110010', 'S119256633', 'E202010020'),
	('V202110025', 'S119256633', 'E202010015'),
	('V202110028', 'S117444377', 'E202010033'),
	('V202110040', 'S119385289', 'E202010040'),
	('V202110044', 'S119365724', 'E202010020'),
	('V202110075', 'S118602394', 'E202010045'),
	('V202110005', 'S119256534', 'E202010020'),
	('V202110013', 'S119256534', 'E202010017'),
	('V202110001', 'S119399545', 'E202010033')
