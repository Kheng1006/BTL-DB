use QUARANTINE_CAMP;
DELIMITER //
CREATE TRIGGER checkTestRecord
BEFORE INSERT ON TestingRecord
FOR EACH ROW
BEGIN
	DECLARE clinicalSign int;
	DECLARE admission_id int;
    SELECT admissionId INTO admission_id
	FROM Admission 
	WHERE patientNumber = New.patientId And moveDate<=NEW.testDate;
	IF (NEW.spO2 IS NOT NULL AND NEW.spO2<0.96) AND (NEW.respiratory IS NOT NULL AND NEW.respiratory>20) THEN
        IF admission_id is not null THEN
		UPDATE Admission SET warningPatient = True WHERE patientNumber = NEW.patientId AND (moveDate<=NEW.testDate AND dischargeDate IS NULL);
        END IF;
	ELSEIF (NEW.cyclePCR IS NOT NULL AND NEW.cyclePCR>30) or (NEW.cycleQuick IS NOT NULL AND NEW.cycleQuick>30) THEN
		SELECT symptomId into clinicalSign
        FROM SymptomPatient
        WHERE patientNumber = NEW.patientId AND (endDate IS NOT NULL AND endDate<=NEW.testDate);
        IF clinicalSign is not null THEN
		UPDATE Admission set dischargeDate = NEW.testDate WHERE admissionId=admission_id;
        END IF;
	END IF;
END;
//
DELIMITER ;



DELIMITER //
CREATE TRIGGER setHighRisk
BEFORE INSERT ON Patient
FOR EACH ROW
BEGIN
    IF NEW.comorbitidies IS NOT NULL AND NEW.comorbitidies != '' THEN
        SET NEW.highrisk = true;
	ELSE 
		SET NEW.highrisk = false;
    END IF;
END;
//
DELIMITER ;




DELIMITER //
CREATE TRIGGER checkRoomCapacity
BEFORE INSERT ON RoomRecord
FOR EACH ROW
BEGIN
    DECLARE currCapacity int;
    DECLARE maxCap int;
    Select currentCapacity,capacity into currCapacity,maxCap
    FROM Room
    WHERE roomNumber = NEW.roomNumber AND building = NEW.building;
    IF currCapacity=maxCap THEN
	signal sqlstate '45000' set message_text = 'Room is currently full!';
    ELSE 
	UPDATE ROOM SET currentCapacity=currentCapacity+1 where roomNumber = NEW.roomNumber AND building = NEW.building;
    END IF;
END;
//
DELIMITER ;



DELIMITER //

CREATE PROCEDURE UpdatePCRTest()
BEGIN
    -- Set the admission date threshold
    DECLARE admissionDateThreshold DATE;
    SET admissionDateThreshold = '2020-09-01';

    -- Update PCR test to positive with null cycle threshold value
    UPDATE TestingRecord tr
    JOIN Admission a ON tr.patientId = a.patientNumber
    SET tr.resultPCR = TRUE,
        tr.cyclePCR = NULL
    WHERE a.moveDate >= admissionDateThreshold;

    SELECT 'PCR tests updated successfully.' AS Message;
END //

DELIMITER ;






DELIMITER //
CREATE PROCEDURE GetTestingRecords(IN pId INT)
BEGIN
    SELECT
        testNumber,
        testDate,
        resultPCR,
        cyclePRC,
        resultQuick,
        cycleQuick,
        spO2,
        respiratory
    FROM
        TestingRecord
    WHERE
        patientId = pId;
END //

DELIMITER ;





DELIMITER //

CREATE PROCEDURE SortNursesByPatientCount(IN start_date DATE, IN end_date DATE)
BEGIN
    SELECT
        w.workerId,
        w.fName,
        w.lName,
        COUNT(tc.patientId) AS patientCount
    FROM
        Worker w
    JOIN
        TakingCare tc ON w.workerId = tc.nurseId
    WHERE
        tc.startDate BETWEEN start_date AND end_date
        AND (tc.endDate IS NULL OR tc.endDate >= start_date)
    GROUP BY
        w.workerId, w.fName, w.lName
    ORDER BY
        patientCount DESC;
END //

DELIMITER ;





DELIMITER //

CREATE FUNCTION GetPatientSymptoms(patientId INT)
RETURNS VARCHAR(4000)
DETERMINISTIC
BEGIN
    DECLARE symptomInfo VARCHAR(4000);
    
    SELECT GROUP_CONCAT(
        'Symptom ID: ', sp.symptomId, 
        ', Start Date: ', sp.startDate, 
        IFNULL(CONCAT(', End Date: ', sp.endDate), '')
    SEPARATOR '\n') 
    INTO symptomInfo
    FROM SymptomPatient sp
    WHERE sp.patientNumber = patientId;
    IF symptomInfo = '' THEN
		Return 'None';
    ELSE
		RETURN symptomInfo;
	END IF;
END //

DELIMITER ;




DELIMITER //

CREATE FUNCTION GetPatientComorbidities(patientId INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE comorbidities VARCHAR(255);

    SELECT comorbitidies
    INTO comorbidities
    FROM Patient
    WHERE uniqueId = patientId;
	IF comorbidities = '' THEN
    RETURN 'None';
    ELSE
		RETURN comorbidities;
	END IF;
END //

DELIMITER ;




DELIMITER //

CREATE FUNCTION GetPatientRoomRecords(patientId INT)
RETURNS VARCHAR(4000)
DETERMINISTIC
BEGIN
    DECLARE roomRecordsInfo VARCHAR(4000);

    SELECT GROUP_CONCAT(
        'Room Number: ', rr.roomNumber,
        ', Building: ', rr.building,
        ', Start Date: ', rr.startDate,
        IFNULL(CONCAT(', End Date: ', rr.endDate), ''),
        '\n'
    )
    INTO roomRecordsInfo
    FROM RoomRecord rr
    WHERE rr.patientId = patientId;

    RETURN roomRecordsInfo;
END //

DELIMITER ;


DELIMITER //

CREATE FUNCTION GetPatientTestingRecords(patientId INT)
RETURNS VARCHAR(4000)
DETERMINISTIC
BEGIN
    DECLARE testingRecordsInfo VARCHAR(4000);

    SELECT GROUP_CONCAT(
        'Test Number: ', tr.testNumber,
        '; Test Date: ', tr.testDate,
        IFNULL(CONCAT('; PCR result: ', tr.resultPCR), ''),
        IFNULL(CONCAT('; PCR cycle: ', tr.cyclePCR), ''),
        IFNULL(CONCAT('; Quick test result: ', tr.resultQuick), ''),
        IFNULL(CONCAT('; Quick test cycle: ', tr.cycleQuick), ''),
        IFNULL(CONCAT('; SPO2 value: ', tr.spO2), ''),
        IFNULL(CONCAT('; Respiratory rate: ', tr.respiratory), ''),
        '\n\n'
    )
    INTO testingRecordsInfo
    FROM TestingRecord tr
    WHERE tr.patientId = patientId;

    RETURN testingRecordsInfo;
END //

DELIMITER ;


DELIMITER //

CREATE FUNCTION GetPatientAdmissionInfo(patientId INT)
RETURNS VARCHAR(4000)
DETERMINISTIC
BEGIN
    DECLARE admissionInfo VARCHAR(4000);

    SELECT GROUP_CONCAT(
        'Admission ID: ', ad.admissionId,
        ', Worker ID: ', ad.workerId,
        ', Warning Patient: ', ad.warningPatient,
        ', Move Date: ', ad.moveDate,
        ', Move From: ', ad.moveFrom,
        IFNULL(CONCAT(', Discharge Date: ', ad.dischargeDate), ''),
        IFNULL(CONCAT(', Test number: ', ad.testNumber), ''),
        '\n'
    )
    INTO admissionInfo
    FROM Admission ad
    WHERE ad.patientNumber = patientId;

    RETURN admissionInfo;
END //

DELIMITER ;



DELIMITER //

CREATE FUNCTION GetPatientTreatmentRecords(patientId INT)
RETURNS VARCHAR(4000)
DETERMINISTIC
BEGIN
    DECLARE treatmentRecordsInfo VARCHAR(4000);

    SELECT GROUP_CONCAT(
        'Doctor ID: ', tr.doctorId,
        ', Start Date: ', tr.startDate,
        IFNULL(CONCAT(', End Date: ', tr.endDate), ''),
		IFNULL(CONCAT(', Result: ', tr.result), 'Ongoing'),
        '\n'
    )
    INTO treatmentRecordsInfo
    FROM Treatment tr
    WHERE tr.patientId = patientId;

    RETURN treatmentRecordsInfo;
END //

DELIMITER ;


DELIMITER //

CREATE FUNCTION GetPatientPrescriptionRecords(patientId INT)
RETURNS VARCHAR(4000)
DETERMINISTIC
BEGIN
    DECLARE prescriptionRecordsInfo VARCHAR(4000);

    SELECT GROUP_CONCAT(
        'Doctor ID: ', pr.doctorId,
        ', Medication Code: ', pr.mediCode,
        ', Start Date: ', pr.startDate,
        '\n'
    )
    INTO prescriptionRecordsInfo
    FROM Prescription pr
    WHERE pr.patientId = patientId;

    RETURN prescriptionRecordsInfo;
END //

DELIMITER ;


DELIMITER //

CREATE FUNCTION GetPatientTakeCareRecords(patientId INT)
RETURNS VARCHAR(4000)
DETERMINISTIC
BEGIN
    DECLARE takeCareRecordsInfo VARCHAR(4000);

    SELECT GROUP_CONCAT(
        'Nurse ID: ', tc.nurseId,
        ', Start Date: ', tc.startDate,
        IFNULL(CONCAT(', End Date: ', tc.endDate), ''),
        '\n'
    )
    INTO takeCareRecordsInfo
    FROM TakingCare tc
    WHERE tc.patientId = patientId;

    RETURN takeCareRecordsInfo;
END //

DELIMITER ;




DELIMITER //


CREATE PROCEDURE GetAllInformation(IN patient_Name VARCHAR(255))
BEGIN
	SELECT uniqueId as Patient_ID,
    fName as First_Name,
    lName as Last_Name,
    bDate as Birthdate,
    gender as Gender,
    phone as PhoneNumber,
    address as Address,
    highrisk as CurrentCondition,
    GetPatientSymptoms(uniqueId) as Symtom_Records,
    GetPatientComorbidities(uniqueId) as Comorbidities,
    GetPatientTestingRecords(uniqueId) as Testing_Records,
    GetPatientRoomRecords(uniqueId) as Room_Records,
    GetPatientAdmissionInfo(uniqueId) as Admission_Records,
    GetPatientTreatmentRecords(uniqueId) as Treatments,
    GetPatientPrescriptionRecords(uniqueId) as Prescriptions,
    GetPatientTakeCareRecords(uniqueId) as Takecare_Records
    FROM (
		SELECT uniqueId,fName,lName,bDate,gender,highrisk,phone,address
        FROM Patient
        WHERE CONCAT(lName,' ',fName) LIKE TRIM(BOTH ' ' FROM REGEXP_REPLACE(patient_Name, '\\s+', ' '))
	) AS subquery;
END // 
DELIMITER ;