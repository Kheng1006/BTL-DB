-- Insert into Patient table
use QUARANTINE_CAMP;
INSERT INTO Patient (uniqueId, ssn, fName, lName, bDate, gender, comorbitidies, highrisk, phone, address)
VALUES
  (1, 123456789, 'Ngoc', 'Tran', '1990-05-15', 'F', '', 0, '098765432', '123 Nguyen Van Street, Hanoi'),
  (2, 987654321, 'Duc', 'Nguyen', '1985-08-22', 'M', 'Asthma', 1, '012345678', '456 Le Loi Street, Ho Chi Minh City'),
  (3, 555555555, 'Lan', 'Pham', '1998-12-10', 'F', 'Diabetes', 1, '090123456', '789 Truong Dinh Street, Da Nang'),
  (4, 777777777, 'Minh', 'Le', '1973-03-28', 'M', 'Hypertension', 1, '095432109', '101 Tran Hung Dao Street, Hanoi'),
  (5, 999999999, 'Anh', 'Vu', '1982-06-17', 'M', '', 0, '097654321', '222 Nguyen Hue Street, Ho Chi Minh City'),
  (6, 029484938, 'A', 'Nguyen Van', '1988-06-29', 'M', '', 0, '094832489', '222 Nguyen Xien Street, Ho Chi Minh City');

-- Testing Records
INSERT INTO TestingRecord (patientId, testDate, resultPCR, cyclePCR, resultQuick, cycleQuick, spO2, respiratory)
VALUES
  (1, '2022-11-15', true, 20, false, null, 0.98, 18),
  (2, '2022-11-16', true, 25, true, 10, 0.96, 22),
  (3, '2022-11-17', false, null, true, 15, 0.97, 20),
  (4, '2022-11-18', true, 18, false, null, 0.99, 16),
  (5, '2022-11-19', false, null, true, 12, 0.95, 25),
  (6, '2022-2-19', false, null, true, 12, 0.98, 30);

-- Symptoms
INSERT INTO Symtom (id, symtomName, seriousness)
VALUES
  (1, 'Fever', true),
  (2, 'Cough', false),
  (3, 'Shortness of breath', true),
  (4, 'Fatigue', true),
  (5, 'Headache', false),
  (6,'Vomitting',false);


-- Symptoms for Patients
INSERT INTO SymtomPatient (patientNumber, symtomId, startDate, endDate)
VALUES
  (1, 1, '2023-11-15', null),
  (2, 3, '2023-11-16', '2023-11-20'),
  (3, 2, '2023-11-17', null),
  (4, 1, '2023-11-18', '2023-11-25'),
  (5, 4, '2023-11-19', null),
  (6,6,'2023-11-30','2023-12-22');
  
  -- Specialties
INSERT INTO Specialty (id, specialtyName)
VALUES
  (1, 'Internal Medicine'),
  (2, 'Laboratory Science'),
  (3, 'Critical Care'),
  (4, 'Health Administration'),
  (5, 'Security Management'),
  (6, 'Cardiology'),
  (7, 'Pulmonology'),
  (8,'Administration');

-- Workers
INSERT INTO Worker (workerId, ssn, fName, lName, roleName, gender, bDate, degree, startDate, address)
VALUES
  (1, 111223334, 'Van', 'Nguyen', 'Doctor', 'M', '1982-03-25', 'MD', '2017-09-10', '456 Le Lai Street, Hanoi'),
  (2, 444556667, 'Thu', 'Le', 'Volunteer', 'F', '1995-11-12', 'BSc', '2020-04-15', '789 Tran Nhan Tong Street, Ho Chi Minh City'),
  (3, 777889911, 'Nam', 'Tran', 'Manager', 'M', '1988-07-15', 'MBA', '2016-06-20', '101 Nguyen Hue Street, Da Nang'),
  (4, 999112244, 'Linh', 'Pham', 'Staff', 'F', '1990-04-18', 'BA', '2011-11-01', '222 Tran Phu Street, Hanoi'),
  (5, 334455668, 'Quoc', 'Vo', 'Doctor', 'M', '1987-09-30', 'MD', '2018-08-05', '333 Hoang Dieu Street, Ho Chi Minh City'),
  (6, 123456789, 'Huong', 'Tran', 'Nurse', 'F', '1985-06-15', 'RN', '2019-03-10', '789 Le Van Sy Street, Hanoi'),
  (7, 987654321, 'Tuan', 'Nguyen', 'Nurse', 'M', '1992-10-22', 'RN', '2020-08-15', '456 Nguyen Trai Street, Ho Chi Minh City'),
  (8, 555555555, 'Hai', 'Pham', 'Staff', 'M', '1990-12-10', 'BA', '2015-05-20', '101 Tran Hung Dao Street, Da Nang'),
  (9, 777777777, 'Thao', 'Le', 'Staff', 'F', '1975-03-28', 'AA', '2010-09-01', '222 Nguyen Hue Street, Ho Chi Minh City'),
  (10, 999999999, 'Tien', 'Vu', 'Staff', 'M', '1984-06-17', 'BA', '2018-06-17', '333 Le Loi Street, Hanoi');

  
  
  
-- Worker Specialties
INSERT INTO Worker_Specialty (workerId, specialty)
VALUES
  (1, 1),
  (2, 3),
  (3, 5),
  (4, 4),
  (5, 6),
  (6,7),
  (7, 3),
  (8, 8),
  (9, 8),
  (10, 8);
  

-- Admitting Patients
INSERT INTO Admission (admissionId, patientNumber, workerId, warningPatient, moveDate, moveFrom, dischargeDate, testNumber)
VALUES
  (1, 1, 8, false, '2023-11-15', 'City Hospital', NULL, 1),
  (2, 2, 9, true, '2023-11-16', 'Home', NULL, 2),
  (3, 3, 10, false, '2023-11-17', 'City Camp', NULL, 3),
  (4, 4, 8, true, '2023-11-18', 'Home', NULL, 4),
  (5, 5, 9, false, '2023-11-19', 'Home', NULL, 5),
  (6, 6, 4, false, '2023-11-19', 'Home', NULL, 6);

-- Taking Care of Patients by Nurses
INSERT INTO TakingCare (patientId, nurseId, startDate, endDate)
VALUES
  (1, 6, '2023-11-15', NULL),
  (2, 7, '2023-11-16', NULL),
  (3, 6, '2023-11-17', NULL),
  (4, 7, '2023-11-18', '2023-11-25'),
  (5, 6, '2023-11-19', NULL),
  (6, 6, '2023-11-19', NULL);
-- Medications
INSERT INTO Medication (medicationCode, medicationName, price, expireDate, sideEffect)
VALUES
  (1, 'Paracetamol', 5, '2023-12-31', 'None'),
  (2, 'Ibuprofen', 8, '2023-12-31', 'Stomach upset'),
  (3, 'Amoxicillin', 10, '2023-12-31', 'Diarrhea'),
  (4, 'Aspirin', 6, '2023-12-31', 'Bleeding risk'),
  (5, 'Omeprazole', 12, '2023-12-31', 'Headache'),
  (6, 'Ciprofloxacin', 15, '2023-12-31', 'Nausea'),
  (7, 'Loratadine', 7, '2023-12-31', 'Dry mouth'),
  (8, 'Metformin', 9, '2023-12-31', 'Lactic acidosis'),
  (9, 'Atorvastatin', 11, '2023-12-31', 'Muscle pain'),
  (10, 'Diazepam', 14, '2023-12-31', 'Drowsiness');
-- Treatment Records by Doctors
INSERT INTO Treatment (patientId, doctorId, startDate, endDate, result)
VALUES
  (1, 1, '2023-11-15', '2023-11-20', 'Recovered'),
  (2, 5, '2023-11-16', NULL, 'Ongoing treatment'),
  (3, 1, '2023-11-17', NULL, 'Ongoing treatment'),
  (4, 5, '2023-11-18', '2023-11-25', 'Recovered'),
  (5, 1, '2023-11-19', NULL, 'Ongoing treatment'),
  (6, 5, '2023-11-19', NULL, 'Ongoing treatment');
-- Prescription Records by Doctors
INSERT INTO Prescription (patientId, doctorId, mediCode, startDate)
VALUES
  (1, 1, 1, '2023-11-15'),
  (2, 10, 2, '2023-11-16'),
  (3, 1, 3, '2023-11-17'),
  (4, 10, 4, '2023-11-18'),
  (5, 1, 5, '2023-11-19');
-- Hospital Buildings
INSERT INTO Building (buildingName, floors, rooms)
VALUES
  ('Emergency Camp', 5, 100),
  ('Healing Camp', 7, 120),
  ('High Priority Camp', 4, 80),
  ('Central Camp', 6, 90);

-- Inserting Records into Room
INSERT INTO Room (roomNumber, building, floorNumber, roomType, capacity, currentCapacity)
VALUES
  (101, 'Emergency Camp', 2, 'emergency', 10, 0),
  (201, 'Emergency Camp', 3, 'emergency', 5, 0),
  (301, 'High Priority Camp', 1, 'normal', 8, 0),
  (401, 'Healing Camp', 4, 'recuperation', 12, 0),
  (501, 'Central Camp', 5, 'recuperation', 2, 0);
-- Inserting Room Records for Patients in the New Buildings
INSERT INTO RoomRecord (patientId, roomNumber, building, startDate, endDate)
VALUES
  (1, 101, 'Emergency Camp', '2023-11-15', NULL),
  (2, 201, 'Emergency Camp', '2023-11-16', NULL),
  (3, 301, 'High Priority Camp', '2023-11-17', NULL),
  (4, 401, 'Healing Camp', '2023-11-18', NULL),
  (5, 501, 'Central Camp', '2023-11-19', NULL),
  (6,501,'Central Camp','2023-11-19',NULL);

INSERT INTO Patient (uniqueId, ssn, fName, lName, bDate, gender, comorbitidies, highrisk, phone, address)
VALUES
  (7, 957383894, 'A', 'Nguyen Van', '1990-05-15', 'F', '', 0, '098374657', '123 Nguyen Thi Dinh, Hanoi');

INSERT INTO Admission (admissionId, patientNumber, workerId, warningPatient, moveDate, moveFrom, dischargeDate, testNumber)
VALUES
  (7, 7, 4, false, '2023-11-15', 'City Hospital', NULL, NULL);

-- THIS is used to check capacity constraint
INSERT INTO RoomRecord (patientId, roomNumber, building, startDate, endDate)
VALUES
  (7,501,'Central Camp','2023-11-15',NULL);

INSERT INTO RoomRecord (patientId, roomNumber, building, startDate, endDate)
VALUES
  (7,401,'Healing Camp','2023-11-15',NULL);

INSERT INTO TakingCare (patientId, nurseId, startDate, endDate)
VALUES
  (7, 6, '2023-11-15', NULL);

INSERT INTO Treatment (patientId, doctorId, startDate, endDate, result)
VALUES
  (7, 1, '2023-11-15', NULL, NULL);
  
INSERT INTO SymtomPatient (patientNumber, symtomId, startDate, endDate)
VALUES
  (7,6,'2023-11-15','2023-11-30');
  
INSERT INTO TestingRecord (patientId, testDate, resultPCR, cyclePCR, resultQuick, cycleQuick, spO2, respiratory)
VALUES
  (7, '2023-11-16', false, null, true, 12, 0.95, 35);



INSERT INTO TestingRecord (patientId, testDate, resultPCR, cyclePCR, resultQuick, cycleQuick, spO2, respiratory)
VALUES
  (7, '2023-11-29', false, null, true, 12, 0.98, 20);
  
INSERT INTO TestingRecord (patientId, testDate, resultPCR, cyclePCR, resultQuick, cycleQuick, spO2, respiratory)
VALUES
  (7, '2023-12-30', false, null, true, 32, 0.98, 20);

Select * from Admission;

