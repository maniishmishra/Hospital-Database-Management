CREATE DATABASE Hospital_Database_Management_System;

USE Hospital_Database_Management_System;


CREATE TABLE Feedback ( patient_id INT PRIMARY KEY,
                        Ratings FLOAT,
                        comments varchar(150),
                        FOREIGN KEY (patient_id) references patient_personalinfo(patient_id));
                        drop table feedback;
insert into Feedback (patient_id,Ratings,comments)
values 
(1,4.0,'Great Service'),
(2,4.1,'Staff are helpful'),
(3,4.2,'hygiene is maintained'),
(4,4.3,'Great doctors '),
(5,4.4,'immediate response'),
(6,4.5,'worth it'),
(7,4.6,'great experience'),
(8,4.7,'overall experience is good'),
(9,4.8,'Great Service'),
(10,4.9,'Great Service');

CREATE TABLE Patient_personalinfo (
    patient_id int auto_increment  PRIMARY KEY  , 
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M', 'F', 'O')), 
	bloodgroup varchar(5) CHECK (bloodgroup IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-')),
    contact_number VARCHAR(15),
    address VARCHAR(255),
    medical_history VARCHAR(255) ,
    emergency_contact varchar(100),
    
    INDEX idx_patient_name (last_name, first_name));

INSERT INTO Patient_personalinfo (patient_id,first_name, last_name, date_of_birth, gender,bloodgroup, contact_number, address, medical_history,emergency_contact)
VALUES
	(1,'Deep', 'mukh', '1995-06-11', 'M','A+', '555-1234', '231 abc St, kolkata', 'Hypertension','1234-7689'),
	(2,'priya', 'Shaw', '1998-08-20', 'F','B+', '555-5678', '956 def St,kolkata ' , 'Asthma','1254-7689'),
	(3,'rajsree', 'raj', '1995-01-11', 'M', 'AB+','555-8765', '989 fgh St, kolkata',  'Diabetes','1253-7689'),
	(4,'asha', 'Dev', '2000-10-10', 'F','AB-', '555-4321', '327 rch St, kolkata',  'None','1234-3289'),
	(5,'supratik', 'Bro', '1997-09-25', 'M', 'O+','555-6543', '954 Map St, kolkata',  'Migraine','1234-2689'),
	(6,'anjali', 'Mart', '1996-08-15', 'F', 'A-','555-9876', '187 edar St, kolkata', 'Arthritis','1234-9089'),
	(7,'jack', 'Wil', '1995-07-15', 'M','AB+', '555-1357', '169 Elmnt St, kolkata',  'Heart disease','1234-5689'),
	(8,'illisha', 'Moore', '2005-02-15', 'F','o-', '555-2468', '753 hju St, kolkata',  'None','1234-7689'),
	(9,'abhishek', 'shaw', '1993-05-25', 'M', 'B-','555-3579', '369 lpo St, kolkata',  'High cholesterol','1235-7989'),
	(10,'sophia', 'And', '2003-12-10', 'F','A-', '555-4680', '741 rche St, kolkata', 'None','1235-9689');
select * from patients_personalinfo;

CREATE TABLE Doctor_personalinfo (
    doctor_id int auto_increment  PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialty VARCHAR(100) NOT NULL,
    appointment_number VARCHAR(15),
    available_schedule VARCHAR(255),

    INDEX idx_specialty (specialty));
    
INSERT INTO Doctor_personalinfo (doctor_id,first_name, last_name, specialty, appointment_number, available_schedule)
VALUES
	(1,'Dr. dev', 'Mukhd', 'Cardiology', '2345-1122',  'Mon-Wed 9AM-5PM'),
	(2,'Dr. aryan', 'shaw', 'Neurology', '5657-2233',  'Tue-Thu 10AM-6PM'),
	(3,'Dr. prayag', 'shaw', 'Orthopedics', '9875-3344', 'Mon-Fri 8AM-4PM'),
	(4,'Dr. ranjan', 'bnrje', 'Dermatology', '9555-4455', 'Mon-Fri 9AM-5PM'),
	(5,'Dr. astha', 'singh', 'Pediatrics', '6559-5566',  'Wed-Fri 10AM-6PM'),
	(6,'Dr. anjaan', 'paul', 'General Surgery', '7857-6677',  'Mon-Tue 8AM-3PM'),
	(7,'Dr. sup', 'ranjan', 'Gynecology', '8559-7788',  'Tue-Thu 9AM-5PM'),
	(8,'Dr. shubh', 'bnrje', 'Psychiatry', '9550-8899',  'Mon-Fri 9AM-4PM'),
	(9,'Dr. priya', 'mishra', 'Ophthalmology', '9955-9901',  'Mon-Wed 8AM-5PM'),
	(10,'Dr. snighda', 'sheety', 'ENT', '8955-1112', 'Tue-Fri 10AM-6PM');
    
CREATE TABLE Department_info (
    department_id int auto_increment  PRIMARY KEY ,
    department_name VARCHAR(50),
    location VARCHAR(100)
);

INSERT INTO Department_info (department_id,department_name, location)
VALUES
(1,'cardiology','1stfloor'),
(2,'neurology','1stfloor'),
(3,'orthopedics','2ndfloor'),
(4,'dermatology','2ndfloor'),
(5,'pediatrics','3rdfloor'),
(6,'general surgery','3rdfloor'),
(7,'gynaecology','4thfloor'),
(8,'psychiatry','4thfloor'),
(9,'opthamology','5thfloor'),
(10,'ent','5thfloor'),
(11,'nephrology','1stfloor'),
(12,'general medicine','2ndfloor'),
(13,'gastroenterologist','3rdfloor'),
(14,'endocrinologist','4thfloor'),
(15,'general care','5thfloor');
	
    select * from departments_info;
    
-- Creating Doctor_Department Junction Table (Many-to-Many: Doctors & Departments)
CREATE TABLE Doctor_Department (
    doctor_id int,
    department_id int,

    PRIMARY KEY (doctor_id, department_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor_personalinfo(doctor_id) ON DELETE CASCADE,
    FOREIGN KEY (department_id) REFERENCES Department_info(department_id) ON DELETE CASCADE);
    
    INSERT INTO Doctor_Department (doctor_id, department_id)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);

select * from doctor_department;    
CREATE TABLE Head_of_Departments(HOD int auto_increment primary key,
                                 department_id int,
                                 foreign key(HOD) references doctor_personalinfo(doctor_id),
                                 foreign key(department_id) references department_info(department_id));

INSERT INTO Head_of_Departments (HOD, department_id)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);


CREATE TABLE appointment_schedule ( 
						   sr_no int auto_increment primary key,
                           appointment_id int,
                           patient_id int , 
                           appointment date ,
                           appointment_start time , 
                           apponitment_end time,
                           foreign key(appointment_id) references appointment_info(appointment_id),
                           foreign key(patient_id) references patient_personalinfo(patient_id));
                           
                           
CREATE TABLE Appointment_info (
    appointment_id int auto_increment  PRIMARY KEY ,
    patient_id int ,
    doctor_id int,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    purpose VARCHAR(255),
    status VARCHAR(20) DEFAULT 'Scheduled',
    charges decimal(10,2),

    FOREIGN KEY (patient_id) REFERENCES Patient_personalinfo(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES Doctor_personalinfo(doctor_id) ON DELETE SET NULL,
    INDEX idx_appointment_date (appointment_date, appointment_time));

INSERT INTO Appointment_info (appointment_id,patient_id, doctor_id, appointment_date, appointment_time, purpose, status)
VALUES
	(1,1, 1, '2025-1-2', '09:00', 'Heart checkup', 'Scheduled'),
	(2,2, 2, '2025-1-3', '10:00', 'Neurology consultation', 'Scheduled'),
	(3,3, 3, '2025-1-4', '11:00', 'Knee pain', 'Scheduled'),
	(4,4, 4, '2025-1-5', '14:00', 'Skin rash', 'Scheduled'),
	(5,5, 5, '2025-1-6', '15:00', 'Child vaccination', 'Scheduled'),
	(6,6, 6, '2025-1-7', '16:00', 'Gallbladder surgery', 'Scheduled'),
	(7,7, 7, '2025-1-8', '09:30', 'Gynecological checkup', 'Scheduled'),
	(8,8, 8, '2025-1-9', '10:30', 'Mental health evaluation', 'Scheduled'),
	(9,9, 9, '2025-1-10', '13:00', 'Eye checkup', 'Scheduled'),
	(10,10, 10, '2025-1-11', '14:30', 'Ear examination', 'Scheduled');
    

CREATE TABLE patient_prescription ( prescription_no int auto_increment primary key,
							patient_weight varchar(10),
                            patient_height varchar(10),
                            patient_bp varchar(10),
                            appointment_id int,
							patient_id int,
							doctor_id int,
							concern varchar(100),
                            symptoms varchar(100),
                            test_name varchar(150),
                            foreign key(appointment_id) references appointment_info(appointment_id),
							foreign key(patient_id) references patient_personalinfo(patient_id),
							foreign key(doctor_id) references doctor_personalinfo(doctor_id));

insert into patient_prescription
(prescription_no,patient_weight ,patient_height ,patient_bp ,appointment_id ,patient_id ,doctor_id ,concern ,symptoms ,test_name ) 
values 
(1, '60kg','5.8ft','80/110',1,1,1,'heart pain','plapatation','ecg'),
(2,'70kg','5.9ft','80/110',2,2,2,'none','anxiety','none'),
(3, '87kg','5.10ft','80/110',3,3,3,'knee pain','none','x-ray'),
(4, '65kg','5.5ft','80/110',4,4,4,'skin burn','redness','none'),
(5, '68kg','5.4ft','80/110',5,5,5,'child vaccination','none','none'),
(6, '78kg','5.6ft','80/110',6,6,6,'gallbladder surgery','pain','ultrasonography'),
(7, '65kg','5.7ft','80/110',7,7,7,'checkup','none','none'),
(8, '55kg','5.9ft','80/110',8,8,8,'extreme sweating','anxiety','ecg'),
(9, '90kg','5.10ft','80/110',9,9,9,'eye pain','none','none'),
(10, '75kg','5.11ft','80/110',10,10,10,'ear pain','none','none');
                            
CREATE TABLE lab_test ( test_id int auto_increment primary key,
						prescription_no int,
                        patient_id int,
                        doctor_id int,
                        test_name varchar(150),
                        foreign key (prescription_no) references patient_prescription(prescription_no),
                        foreign key (patient_id) references patient_personalinfo(patient_id),
                        foreign key (doctor_id) references doctor_personalinfo(doctor_id),
                        charges decimal(10,2));
insert into lab_test (test_id,prescription_no,patient_id,doctor_id,test_name)
values
(1,1,1,1,'ecg'),
(2,2,2,2,'none'),
(3,3,3,3,'x-ray'),
(4,4,4,4,'none'),
(5,5,5,5,'none');

CREATE TABLE patient_Treatmentinfo(
	treatment_id int auto_increment primary key,
    prescription_no int ,
    patient_id int,
    doctor_id int,
    prescription_date DATE ,
    diagnosis varchar(100),
    medication_name VARCHAR(100),
    dosage VARCHAR(100),
    frequency VARCHAR(50),
    duration VARCHAR(50),
    notes VARCHAR(255),
    FOREIGN KEY (prescription_no) REFERENCES patient_prescription(prescription_no),
    FOREIGN KEY (patient_id) REFERENCES patient_personalinfo(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor_personalinfo(doctor_id));
    
    
INSERT INTO Patient_treatmentinfo (treatment_id,prescription_no,patient_id, doctor_id, prescription_date, medication_name, dosage, frequency, duration, notes)
VALUES
    (1,1,1, 1, '2024-11-10', 'Paracetamol', '500mg', 'Every 6 hours', '5 days', 'For pain relief'),
    (2,2,2, 2, '2024-11-11', 'Amoxicillin', '250mg', 'Every 8 hours', '7 days', 'For bacterial infection'),
    (3,3,3, 3, '2024-11-12', 'Metformin', '500mg', 'Twice daily', 'Indefinite', 'For diabetes management'),
    (4,4,4, 4, '2024-11-13', 'Aspirin', '75mg', 'Once daily', '30 days', 'For blood thinning'),
    (5,5,5, 5, '2024-11-14', 'Ibuprofen', '200mg', 'Every 4 hours', '3 days', 'For fever and pain');
    INSERT INTO Patient_treatmentinfo (treatment_id,prescription_no,patient_id, doctor_id, prescription_date, medication_name, dosage, frequency, duration, notes)
VALUES
    (6,6,6,6, '2024-11-10', 'zincovita', '500mg', 'Every 6 hours', '5 days', 'For pain relief'),
    (7,7,7, 7, '2024-11-10', 'vitamine', '500mg', 'Every 6 hours', '5 days', 'For pain relief'),
    (8,8,8, 8, '2024-11-10', 'calvin', '500mg', 'Every 6 hours', '5 days', 'For pain relief'),
    (9,9,9, 9, '2024-11-10', 'p-650', '500mg', 'Every 6 hours', '5 days', 'For pain relief'),
    (10,10,10, 10, '2024-11-10', 'Paracetamol', '500mg', 'Every 6 hours', '5 days', 'For pain relief');
    
CREATE TABLE Patient_Medical_Record (
    record_id INT AUTO_INCREMENT  PRIMARY KEY ,
    patient_id int ,
    doctor_id int ,
    appointment_id int ,
    prescription_no int,
    treatment_id int,
    diagnosis VARCHAR(255),
    treatment VARCHAR(255),
    prescription VARCHAR(255),
    FOREIGN KEY (treatment_id) references patient_treatmentinfo(treatment_id) ON DELETE CASCADE,
	FOREIGN KEY (prescription_no) references patient_prescription(prescription_no) ,
    FOREIGN KEY (patient_id) REFERENCES Patient_personalinfo(patient_id) ,
    FOREIGN KEY (doctor_id) REFERENCES Doctor_personalinfo(doctor_id) ,
    FOREIGN KEY (appointment_id) REFERENCES Appointment_info(appointment_id) ,
    INDEX idx_record_patient (patient_id));

drop table patient_medical_record;

INSERT INTO Patient_Medical_Record (record_id,patient_id, doctor_id, appointment_id,prescription_no,treatment_id, diagnosis, treatment, prescription)
VALUES
	(1, 1, 1,1,1,1, 'Hypertension', 'Lifestyle changes, medication', 'Lisinopril'),
	(2, 2, 2,2,2,2, 'Asthma', 'Inhalers, avoid triggers', 'Albuterol'),
	(3, 3, 3,3,3,3, 'Knee Osteoarthritis', 'Physical therapy, pain relief', 'Ibuprofen'),
	(4, 4, 4,4,4,4, 'Dermatitis', 'Topical corticosteroids', 'Hydrocortisone'),
	(5, 5, 5,5,5,5, 'Routine checkup', 'No issues found', 'None'),
	(6, 6, 6,6,6,6, 'Gallstones', 'Surgical removal', 'None'),
	(7, 7,7,7,7,7, 'Pelvic Exam', 'Normal', 'None'),
	(8, 8,8,8,8, 8,'Anxiety', 'Therapy, medication', 'Sertraline'),
	(9, 9, 9,9,9,9, 'Myopia', 'Eyeglasses', 'None'),
	(10, 10, 10,10,10,10, 'Ear Infection', 'Antibiotics', 'Amoxicillin');

CREATE TABLE Billing_info (
    bill_id int auto_increment PRIMARY KEY ,
    patient_id int,
    appointment_id int,
    total_amount DECIMAL(10, 2) NOT NULL,
    bill_description varchar(100),
    amount_paid decimal(10,2),
    amount_due decimal(10,2),
    payment_status VARCHAR(20) DEFAULT 'Pending',
    payment_date DATE,
    payment_type varchar(50),
    insurance_provider VARCHAR(100),
    

    FOREIGN KEY (patient_id) REFERENCES Patient_personalinfo(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (appointment_id) REFERENCES Appointment_info(appointment_id) ON DELETE NO ACTION,
    INDEX idx_payment_status (payment_status));

INSERT INTO Billing_info (bill_id,patient_id, appointment_id, total_amount,bill_description,amount_paid,amount_due, payment_status, payment_date,payment_type, insurance_provider)
VALUES
	(1,1, 1, 10000.00,'consultancy,test' ,5000,5000,'Pending', NULL,'cash', 'Blue star'),
	(2,2, 2, 15000.00, 'none',15000,0,'Paid', '2024-11-21','online', 'Asetna'),
	(3,3, 3, 20000.00,'none',15000, 5000, 'Pending', NULL,'cash', 'signa'),
	(4, 4,4, 1200.00, 'none',1200,0, 'Paid', '2024-11-22', 'upi','Healthcare'),
	(5, 5,5, 8000.00,'none',5000,3000, 'Pending', NULL,'cash', 'Blue Cross'),
	(6, 6,6, 5000.00,'none',5000,0, 'Paid', '2024-11-23','cash', 'Aetna'),
	(7, 7,7, 2500.00,'none',2000,500, 'Pending', NULL,'debit card', 'Cigna'),
	(8, 8,8, 10000.00,'none',10000,0, 'Paid', '2024-11-24','creditcard', 'Healthcare'),
	(9, 9,9, 15000.00,'none', 10000,5000,'Pending', NULL,'upi', 'Blue Cross'),
	(10, 10,10, 13000.00,'none',13000,0, 'Paid', '2024-11-25','net banking', 'Aetna');

drop table hospital_staffinfo;
-- Creating Staff Table (General staff details, including nurses and workers)
CREATE TABLE nursesinfo (
    nurse_id int PRIMARY KEY ,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id int,
    contact_number VARCHAR(15),
    joining_date date,

    FOREIGN KEY (department_id) REFERENCES Department_info(department_id) ON DELETE SET NULL);

INSERT INTO nursesinfo (nurse_id,first_name, last_name, department_id, contact_number, joining_date) 
VALUES
    (1,'Aisha', 'singh', 1, '1234-0199', '2023-08-01'),
    (2,'Bishak', 'Shaw', 2, '1224-0191',  '2022-07-15'),
    (3,'Chahat', 'Brown', 3, '1455-0192', '2021-09-10'),
    (4,'Dinesh', 'Lohia', 4, '1655-0123', '2020-12-05'),
    (5,'mahesh', 'Dev', 5, '1234-5678', '2024-03-20'),
    (6,'ratri', 'mukh', 1, '1345-9876',  '2022-02-25'),
    (7,'sanjay', 'moore', 2, '8989-8989',  '2021-01-15'),
    (8,'saumya', 'qer', 3, '9999-9999', '2020-08-30'),
    (9,'odrika', 'derson', 4, '1679-9875', '2023-06-25'),
    (10,'Jimmy', 'omas', 5, '1563-9109',  '2024-09-10'),
	(11,'Johnston', 'Doe', 6, '1532-0110', '2024-04-01'),
    (12,'Sara', 'po', 7, '1453-1111', '2024-05-15'),
    (13,'Mike', 'err', 8, '1234-1112', '2024-06-10'),
    (14,'lokesh', 'kumar', 9, '1235-9113', '2024-07-22'),
    (15,'drake', 'son', 10, '1345-0990',  '2024-08-01');

CREATE TABLE adminstrative_staffinfo (
    staff_id int  PRIMARY KEY ,
    first_name varchar(100),
    last_name varchar(100),
    job_title VARCHAR(50),
    work_schedule varchar(255));
    
    INSERT INTO adminstrative_staffinfo (staff_id,first_name,last_name, job_title, work_schedule) 
VALUES
	(1, 'admin','aaa','bbb', '8:00 AM - 4:00 PM'),
	(2, 'admin','cc','dd', '9:00 AM - 5:00 PM'),
	(3, 'admin','ee','ff', '10:00 AM - 6:00 PM'),
	(4, 'reception','as','bs', '7:00 AM - 3:00 PM'),
	(5, 'reception','dss','fgh', '6:00 AM - 2:00 PM'),
	(6, 'insurance desk','dfr','ght', '11:00 AM - 7:00 PM'),
	(7, 'insurance desk','pol','hio', '8:00 AM - 4:00 PM'),
	(8, 'help desk','mlo','hui', '10:00 AM - 6:00 PM'),
	(9, 'help desk','kol','lok', '8:00 AM - 4:00 PM'),
	(10, 'admin','iom','uio', '12:00 PM - 8:00 PM');
    

CREATE TABLE hospital_staffinfo (
    staff_id int  PRIMARY KEY ,
    first_name varchar(100),
    last_name varchar(100),
    job_title VARCHAR(50),
    work_schedule VARCHAR(255));

INSERT INTO hospital_staffinfo (staff_id,first_name,last_name, job_title, work_schedule) 
VALUES
	(1, 'Cleaner','aaa','bbb', '8:00 AM - 4:00 PM'),
	(2, 'Security Guard','cc','dd', '9:00 AM - 5:00 PM'),
	(3, 'Janitor','ee','ff', '10:00 AM - 6:00 PM'),
	(4, 'Cook','as','bs', '7:00 AM - 3:00 PM'),
	(5, 'Cleaner','dss','fgh', '6:00 AM - 2:00 PM'),
	(6, 'Security Guard','dfr','ght', '11:00 AM - 7:00 PM'),
	(7, 'Janitor','pol','hio', '8:00 AM - 4:00 PM'),
	(8, 'Cook','mlo','hui', '10:00 AM - 6:00 PM'),
	(9, 'Cleaner','kol','lok', '8:00 AM - 4:00 PM'),
	(10, 'Security Guard','iom','uio', '12:00 PM - 8:00 PM');


CREATE TABLE pharmacy_info (
    medicine_id int  PRIMARY KEY ,
    medicine_name VARCHAR(100) NOT NULL,
    brand VARCHAR(50),
    type VARCHAR(20) CHECK (type IN ('Tablet', 'Capsule', 'Liquid', 'Injection', 'Ointment')),
    dosage VARCHAR(50),
    stock_quantity INT CHECK (stock_quantity >= 0),
    expiry_date DATE);
    
    
INSERT INTO pharmacy_info (medicine_id,medicine_name, brand, type, dosage, stock_quantity, expiry_date) 
VALUES
	(1,'Paracetamol', 'BrandA', 'Tablet', '500mg', 100, '2025-12-31'),
	(2,'Ibuprofen', 'BrandB', 'Capsule', '250mg', 150, '2025-06-30'),
	(3,'Cough Syrup', 'BrandC', 'Liquid', '10ml', 50, '2025-03-31'),
	(4,'Amoxicillin', 'BrandD', 'Capsule', '200mg', 200, '2026-01-31'),
	(5,'Aspirin', 'BrandE', 'Tablet', '500mg', 80, '2025-11-30'),
	(6,'Ciprofloxacin', 'BrandF', 'Tablet', '500mg', 60, '2025-05-31'),
	(7,'Vitamin C', 'BrandG', 'Capsule', '20mg', 120, '2024-12-31'),
	(8,'Doxycycline', 'BrandH', 'Capsule', '100mg', 90, '2026-07-15'),
	(9,'Metformin', 'BrandI', 'Tablet', '500mg', 200, '2026-02-28'),
	(10,'Prednisone', 'BrandJ', 'Tablet', '0.5mg', 50, '2024-11-30');

-- Creating Pharmacy table for storing medication given to patients
CREATE TABLE patientmedicine_info (
    medicine_id int,
    patient_id int primary key,
    quantity INT,
    prescription_date DATE,

    FOREIGN KEY (medicine_id) REFERENCES pharmacy_info(medicine_id) ON DELETE CASCADE,
    FOREIGN KEY (patient_id) REFERENCES Patient_personalinfo(patient_id) ON DELETE CASCADE
);
INSERT INTO patientmedicine_info (medicine_id, patient_id, quantity, prescription_date) 
VALUES
	(1, 1, 10, '2024-10-11'),
	(2, 2, 15, '2024-10-10'),
	(3, 3, 5, '2024-10-09'),
	(4, 4, 20, '2024-10-08'),
	(5, 5, 30, '2024-10-07'),
	(6, 6, 25, '2024-10-06'),
	(7, 7, 10, '2024-10-05'),
	(8, 8, 50, '2024-10-04'),
	(9, 9, 100, '2024-10-03'),
	(10, 10, 30, '2024-10-02');
    


CREATE TABLE BloodBank_info (
    blood_id int auto_increment PRIMARY KEY ,
    blood_type VARCHAR(3) CHECK (blood_type IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-')),
    stock_quantity INT CHECK (stock_quantity >= 0),
    last_updated DATE,

    INDEX idx_blood_type (blood_type)
);
INSERT INTO BloodBank_info (blood_type, stock_quantity, last_updated) 
VALUES
	('A+', 20, '2024-10-10'),
	('A-', 15, '2024-10-10'),
	('B+', 30, '2024-10-09'),
	('B-', 10, '2024-10-08'),
	('AB+', 25, '2024-10-07'),
	('AB-', 5, '2024-10-06'),
	('O+', 50, '2024-10-05'),
	('O-', 40, '2024-10-04'),
	('A+', 18, '2024-10-03'),
	('B-', 12, '2024-10-02');
    
CREATE TABLE Room_Type (
    room_type_id int auto_increment  PRIMARY KEY ,
    room_type_name VARCHAR(50) NOT NULL, 
    description VARCHAR(255)
);

INSERT INTO Room_Type (room_type_id,room_type_name, description)
VALUES
    (1,'ICU', 'ICU for critical care patients'),
    (2,'General ward', '10-patient ward'),
    (3,'Private room', 'single patient room'),
	(4,'Double room', '2-patient room'),
    (5,'Operation theatre', 'Operating rooms for surgeries'),
	(6,'Emergency ward', 'ward for emergency care patients'),
    (7,'consultancy rooms', 'consultancy rooms');


CREATE TABLE Room_Assign (
    room_no VARCHAR(10) PRIMARY KEY ,
    room_type_id INT,
    nurse_id INT NULL,
    patient_id INT NULL,
    assignment_date DATETIME ,
    end_date DATETIME NULL,                  -- End date for the assignment (nullable)
    
    FOREIGN KEY (room_type_id) REFERENCES Room_type(room_type_id) ON DELETE CASCADE,
    FOREIGN KEY (nurse_id) REFERENCES nurseSinfo(nurse_id) ON DELETE SET NULL,
    FOREIGN KEY (patient_id) REFERENCES patient_personalinfo(patient_id) ON DELETE SET NULL);
    
    
INSERT INTO Room_Assign (room_no, room_type_id,nurse_id, patient_id, assignment_date, end_date)
VALUES
    ('ICU-001', 1, 14,NULL, '2024-10-12', NULL),
	('ICU-002', 2, 15,NULL, '2024-10-12', NULL), 
    ('GW-101', 2, 3,NULL, '2024-10-11', '2024-10-15'), 
	('GW-102', 2, 4,3, '2024-10-11', '2024-10-15'), 
	('GW-103', 2, 5,4, '2024-10-11', '2024-10-15'), 
    ('PR-103', 3, 6,NULL, '2024-10-11', '2024-10-15'), 
    ('PR-104', 3, 7,6, '2024-10-11', '2024-10-15'), 
    ('PR-105', 3, 8, 7,'2024-10-11', '2024-10-15'), 
    ('DR-106', 4, 9,NULL, '2024-10-11', '2024-10-15'), 
    ('DR-107', 4, 10,NULL, '2024-10-11', '2024-10-15'),
    ('OT-108', 5, 11,6, '2024-10-11', '2024-10-15'), 
    ('OT-109', 5, 12, 7,'2024-10-11', '2024-10-15'), 
    ('EW-110', 6, 13,NULL, '2024-10-11', '2024-10-15'), 
    ('CR-111', 7, 1,1, '2024-10-11', NULL), 
    ('CR-112', 7, 2,2, '2024-10-11', NULL); 
    



CREATE TABLE Ambulance (
    ambulance_id INT  PRIMARY KEY ,
    ambulance_number VARCHAR(10) UNIQUE,
    availability VARCHAR(15) CHECK (availability IN ('Available', 'On Duty', 'Maintenance')),
    Contact varchar(50));

INSERT INTO Ambulance (ambulance_id,ambulance_number, availability, contact) 
VALUES
    (1,'AMB001', 'Available',  '2024-1010'),
    (2,'AMB002', 'On Duty', '2024-1008'),
    (3,'AMB003', 'Maintenance',  '2024-0920'),
    (4,'AMB004', 'Available',  '2024-0930'),
    (5,'AMB005', 'Available',  '2024-1005'),
    (6,'AMB006', 'On Duty', '2024-1002'),
    (7,'AMB007', 'Maintenance',  '2024-0915'),
    (8,'AMB008', 'Available',  '2024-1001'),
    (9,'AMB009', 'On Duty', '2024-1003'),
    (10,'AMB010', 'Maintenance', '2024-0925');

-- Creating Ambulance_Log Table to track ambulance usage
CREATE TABLE Ambulance_Log (
    log_id INT AUTO_INCREMENT PRIMARY KEY ,
    ambulance_id INT,
    patient_id INT,
    pickup_location VARCHAR(100),
    dropoff_location VARCHAR(100),
    pickup_time DATETIME,
    dropoff_time DATETIME,
    status VARCHAR(15) CHECK (status IN ('Completed', 'In Progress', 'Canceled')),

    FOREIGN KEY (ambulance_id) REFERENCES Ambulance(ambulance_id) ON DELETE CASCADE,
    FOREIGN KEY (patient_id) REFERENCES patient_personalinfo(patient_id) ON DELETE CASCADE,

	INDEX idx_log_status (status)
);

INSERT INTO Ambulance_Log (ambulance_id, patient_id, pickup_location, dropoff_location, pickup_time, dropoff_time, status) 
VALUES
    (1, 1, '123 Main St', 'City Hospital', '2024-10-11 08:30', '2024-10-11 09:00', 'Completed'),
    (2, 3, '456 Elm St', 'County Clinic', '2024-10-10 14:00', '2024-10-10 14:30', 'Completed'),
    (3, 4, '789 Oak St', 'General Hospital', '2024-10-09 10:00', '2024-10-09 10:30', 'In Progress'),
    (4, 2, '321 Pine St', 'Downtown Medical Center', '2024-10-08 12:00', '2024-10-08 12:30', 'Canceled'),
    (5, 5, '654 Maple St', 'State Hospital', '2024-10-07 09:00', '2024-10-07 09:30', 'Completed'),
    (6, 7, '234 Birch St', 'City Hospital', '2024-10-06 13:00', '2024-10-06 13:45', 'Completed'),
    (7, 6, '567 Cedar St', 'General Hospital', '2024-10-05 15:30', '2024-10-05 16:00', 'In Progress'),
    (8, 8, '890 Willow St', 'Downtown Medical Center', '2024-10-04 16:15', '2024-10-04 16:45', 'Completed'),
    (9, 9, '135 Ash St', 'County Clinic', '2024-10-03 11:00', '2024-10-03 11:30', 'Canceled'),
    (10, 10, '246 Oak St', 'State Hospital', '2024-10-02 17:00', '2024-10-02 17:30', 'Completed');
-- Creating Medical_Records_Medicine Table (Junction table for many-to-many relationship between MedicalRecords and Medicine)

CREATE TABLE Visit(Visit_ID int auto_increment primary key,
                    
                   patient_id INT,
                   doctor_id INT,
                   visit_reason varchar(100),
				   FOREIGN KEY (patient_id) REFERENCES patient_personalinfo(patient_id) ON DELETE CASCADE,
					FOREIGN KEY (doctor_id) REFERENCES doctor_personalinfo(doctor_id) ON DELETE CASCADE
                   );

select first_name,last_name from patient_personalinfo
where patient_id in(select patient_id from room_assign);

select p.first_name,p.last_name,r.room_no from patient_personalinfo p join room_assign r on
p.patient_id = r.patient_id;

select first_name,last_name from patient_personalinfo
where patient_id in(select patient_id from billing_info where payment_status = 'pending' );

select p.first_name,p.last_name,b.amount_due from patient_personalinfo p join billing_info b on
p.patient_id = b.patient_id 
where payment_status = 'pending';

select first_name,last_name from patient_personalinfo
where patient_id in(select patient_id from ambulance_log  );

select p.first_name,p.last_name, a.pickup_time,a.dropoff_time,a.status from patient_personalinfo p join ambulance_log a on
p.patient_id = a.patient_id ;

select p.first_name,p.last_name, f.ratings,f.comments from patient_personalinfo p join feedback f on
p.patient_id = f.patient_id ;

select n.first_name,n.last_name, r.room_no from nursesinfo n join room_assign r on
n.nurse_id = r.nurse_id ;

select p.first_name,p.last_name, pp.patient_bp,pp.concern,pp.symptoms,pp.test_name from patient_personalinfo p join patient_prescription pp on
p.patient_id = pp.patient_id ;

select n.first_name,n.last_name, d.department_name from nursesinfo n join department_info d on
n.department_id = d.department_id ;

select n.first_name,n.last_name, r.room_no from nursesinfo n join room_assign r on
n.nurse_id = r.nurse_id ;