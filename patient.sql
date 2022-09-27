create database patient_diagnosis;
use patient_diagnosis;
drop table patients ;
CREATE TABLE patients(  
date date  default '0000-00-00',
patient_id varchar(20) NOT NULL,
patient_name VARCHAR(100) NOT NULL, 
age INT NOT NULL, 
weight INT NOT NULL, 
gender CHAR(20) NOT NULL, 
location VARCHAR(50) NOT NULL, 
phone_number INT NOT NULL ,
disease CHAR(20) NOT NULL , 
doctor_name VARCHAR(20) NOT NULL,  
doctor_id INT NOT NULL
 );
INSERT INTO patients VALUES
('2019-06-15','AP2021','Sarath','67','76','Male','chennai','5462829','Cardiac','Mohan','21'),
('2019-02-13','AP2022','John','62','80','Male','banglore','1234731','Cancer','Suraj','22'),
('2018-01-08','AP2023','Henry','43','65','Male','Kerala','9028320','Liver','Mehta','23'),
('2020-02-04','AP2024','Carl','56','72','Female','Mumbai','9293829','Asthma','Karthik','24'),
('2017-09-15','AP2025','Shikar','55','71','Male','Delhi','7821281','Cardiac','Mohan','21'),
('2017-03-25','AP2027','Stephen','69','55','Male','Gujarat','8888211','Liver','Mehta','23'),
('2019-04-22','AP2028','Aaron','75','53','Male','Banglore','9012192','Asthma','Karthik','24');
-- Write a query to display the total number of patients in the table.

SELECT COUNT(patient_id) from patients;
select count(*) as total_patient from patients; 

-- Write a query to display the patient id, patient name, gender, and disease of the patient whose age is maximum.
select patient_id , gender, patient_name,
disease from patients where age=(select max(age) as max_age from patients );

-- Write a query to display patient id and patient name with the current date.
select current_date() ,patient_name,patient_id from patients;

-- Write a query to display the old patient’s name and new patient's name in uppercase.
select (ucase(patient_name)) as new_patient , min(ucase(patient_name)) as old_patient from patients;

-- Write a query to display the patient’s name along with the length of their name
select patient_name , length(patient_name) as patient_name_length from patients ;

-- Write a query to display the patient’s name, and the gender of the patient must be mentioned as M or F.
select patient_name ,case when gender ="Male" then 'M' 
when gender = "Female" then 'F' else 'unknown' end AS GENDER from patients;

-- Write a query to combine the names of the patient and the doctor in a new column.
SELECT concat(patient_name,' ' , doctor_name) as combine_category from patients ;

-- Write a query to display the patients’ age along with the l-- Write a query to display the patients’ age along with the logarithmic value (base 10) of their age. value (base 10) of their age.
select patient_name, log10(age) as logarithm from patients ;

-- Write a query to extract the year from the given date in a separate column.
select date, year(date) as years_column from patients;

-- Write a query to return NULL if the patient’s name and doctor’s name are similar else return the patient’s name.
select if(patient_name=doctor_name, 'yes' ,'no') as simllarty from patients;

-- Write a query to return Yes if the patient’s age is greater than 40 else return No.
select age, case when age > 40 then 'YES' when age < 40 then 'no' end as comparsion from patients;

-- Write a query to display the doctor’s duplicate name from the table.
select doctor_name, count(*) as Occurrence from patients group by doctor_name having count(*)
> 1 ;











