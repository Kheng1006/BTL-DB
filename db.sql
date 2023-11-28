create database QUARANTINE_CAMP;
use QUARANTINE_CAMP;
create table Patient (
	uniqueId int primary key,
    ssn int unique key,
    fName varchar(255) not null,
    lName varchar(255) not null,
    bDate date not null,
    gender ENUM('F','M') not null,
    comorbitidies varchar(255) not null,
    highrisk bool,
    phone char(10) not null,
    address varchar(255) not null
);
CREATE TABLE TestingRecord (
    patientId INT NOT NULL,
    testNumber INT AUTO_INCREMENT PRIMARY KEY,
    testDate DATE NOT NULL,
    testType ENUM('PCR', 'Quick Test', 'SPO2', 'Respiratory Rate') NOT NULL,
    result BOOLEAN,
    testValue DECIMAL(5, 2),
    CHECK (
        (testType = 'PCR'  AND ((result IS TRUE AND testValue>=0 AND testValue = ROUND(testValue)) OR(RESULT IS FALSE AND testValue IS NULL)))
        OR
        (testType = 'Quick Test'  AND ((result IS TRUE AND testValue>=0 AND testValue = ROUND(testValue)) OR(RESULT IS FALSE AND testValue IS NULL)))
        OR
        (testType = 'SPO2' AND result IS NULL AND testValue>0 AND testValue<=1)
        OR
        (testType = 'Respiratory Rate' AND result IS NULL AND testValue>=0 AND testValue = ROUND(testValue))
    ),
    FOREIGN KEY (patientId) REFERENCES Patient(uniqueId),
    INDEX idx_patient (patientId, testDate)
);

create table Symptom (
	id int primary key,
    symptomName varchar(50) not null,
    seriousness bool not null
);
create table SymptomPatient (
	patientNumber int not null,
    symptomId int not null,
    startDate date not null,
    endDate date,
    check(endDate is null or endDate >= startDate),
    foreign key (patientNumber) references Patient(uniqueId),
    foreign key (symptomId) references Symptom(id),
    primary key (PatientNumber,startDate,symptomId)
);
create table Worker (
	workerId int primary key,
    ssn int unique key,
    fName varchar(255) not null,
    lName varchar(255) not null,
    roleName varchar(10) not null,
    gender ENUM('F','M') not null,
    bDate date not null,
    degree varchar(10) not null,
    startDate date not null,
    address varchar(255) not null
);
create table Specialty (
	id int primary key,
    specialtyName varchar(255) not null
);
create table Worker_Specialty (
	workerId int not null,
    specialty int not null,
    foreign key (workerId) references Worker(workerId),
    foreign key(specialty) references Specialty(id),
    primary key (workerId,specialty)
);
create table Admission (
	admissionId int primary key,
	patientNumber int not null,
    workerId int not null,
    warningPatient bool,
    foreign key (patientNumber) references Patient(uniqueId),
    foreign key (workerId) references Worker(workerId),
    moveDate date not null,
    moveFrom varchar(255) not null,
    -- note
    dischargeDate date,
    testNumber int,
    check (dischargeDate is null or moveDate<=dischargeDate),
    foreign key (testNumber) references TestingRecord(testNumber),
    index idx_admission (patientNumber,moveDate)
);
create table TestWhenAdmit (
	testNumber int primary key,
    admissionId int not null,
    foreign key (admissionId) references Admission(admissionId),
    foreign key (testNumber) references TestingRecord(testNumber)
);
create table Building (
	buildingName varchar(255) primary key,
	floors int not null,
    rooms int not null
);
create table Room (
	roomNumber int not null,
    building varchar(255) not null,
    floorNumber int not null,
    roomType varchar(20) not null,
    capacity int not null check (capacity>0),
    currentCapacity int not null check (currentCapacity>=0),
    foreign key (building) references Building(buildingName),
    CONSTRAINT PK_Room PRIMARY KEY (roomNumber,building)
);
create table RoomRecord (
	patientId int not null,
    roomNumber int not null,
    building varchar(255) not null,
    startDate date not null,
    endDate date,
    check(endDate is null or endDate >= startDate),
    foreign key (patientId) references Patient(uniqueId),
    foreign key (roomNumber) references Room(roomNumber),
    foreign key(building) references Room(building),
    CONSTRAINT PK_RoomRecord PRIMARY KEY (patientId,roomNumber,building,startDate)
);
create table Medication (
	medicationCode int primary key,
    medicationName varchar(255) not null,
    price int not null,
    expireDate date not null,
    sideEffect varchar(255)
);

create table Treatment (
	patientId int not null,
    doctorId int,
    startDate date not null,
    endDate date,
    result varchar(255),
    primary key (patientId,doctorId,startDate),
    foreign key (patientId) references Patient(uniqueId),
    foreign key (doctorId) references Worker(workerId),
    index idx_doctorId (doctorId,startDate),
    CHECK (endDate IS NULL OR endDate >= startDate)
    
);
create table Prescription  (
	patientId int not null,
    doctorId int not null,
    mediCode int not null,
    startDate date not null,
    foreign key (patientId) references Patient(uniqueId),
    foreign key (doctorId) references Worker(workerId),
    foreign key (mediCode) references Medication(medicationCode),
    primary key (patientId,doctorId,startDate,mediCode)
);

create table TakingCare (
	patientId int not null,
    nurseId int not null,
    startDate date not null,
    endDate date,
    CHECK (endDate IS NULL OR endDate >= startDate),
    foreign key (patientId) references Patient(uniqueId),
    foreign key (nurseId) references Worker(workerId),
    primary key (patientId,startDate),
    index idx_nurseId (nurseId)
);
