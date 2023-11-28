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
	WHERE patientNumber = New.patientId  And moveDate<=NEW.testDate;
	IF (NEW.testType= 'SP02' AND NEW.testValue IS NOT NULL AND NEW.testValue<0.96) AND (NEW.testType='Respiratory Rate' AND NEW.testValue IS NOT NULL AND NEW.testValue>20) THEN
        IF admission_id is not null THEN
		UPDATE Admission SET warningPatient = True WHERE patientNumber = NEW.patientId AND (moveDate<=NEW.testDate AND dischargeDate IS NULL);
        END IF;
	ELSEIF (NEW.testType= 'PCR'AND NEW.testValue IS NOT NULL AND NEW.testValue>30) or (NEW.testType= 'Quick Test' AND NEW.testValue IS NOT NULL AND NEW.testValue>30) THEN
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

CREATE TRIGGER test_when_admit_trigger
BEFORE INSERT ON TestWhenAdmit
FOR EACH ROW
BEGIN
    DECLARE patientIdTest INT;
    DECLARE patientIdAdmission INT;

    -- Get the patient ID associated with the test in TestingRecord
    SELECT patientId INTO patientIdTest
    FROM TestingRecord
    WHERE testNumber = NEW.testNumber;

    -- Get the patient ID associated with the admission in Admission
    SELECT patientNumber INTO patientIdAdmission
    FROM Admission
    WHERE admissionId = NEW.admissionId;

    -- Check if the patient IDs match
    IF patientIdTest IS NULL OR patientIdAdmission IS NULL OR patientIdTest != patientIdAdmission THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: The TestingRecord and Admission do not belong to the same patient.';
    END IF;
END //

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
        tr.cyclePRC = NULL
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
