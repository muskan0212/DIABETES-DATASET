use n1;

create table diabetes (
Pregnancies int,
Glucose int,
BloodPressure int,
SkinThickness int,
Insulin int,
BMI float(90,2),
DiabetesPedigreeFunction float(10,3),
Age int,
Outcome int);

LOAD DATA INFILE
'E:/diabetes.csv'
into table diabetes
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

drop table diabetes;
select * from diabetes;

#Q-1. Find records where pregnancies is 10 and Glucose is 115, 168, 139.
select * from diabetes where pregnancies = 10 and glucose in (115,168,139);

#Q-2. Find Ratio for Outcome 0 and 1.
SELECT COUNT(case when COMPANY_SIZE = 'M' then 1 else 0 end)/count(*) as MEDIUM_RATIO,
       COUNT(case when COMPANY_SIZE = 'L' then 1 else 0 end)/count(*) as LARGE_RATIO
FROM DATA_SCIENCE_JOB;

select count(case when Outcome = "0" then 1 else 0 end)/count(*) as zero,
       count(case when Outcome = "1" then 1 else 0 end)/count(*) as _one
from diabetes;

#Q-3. Find records of skin thickness and outcome where both are same.


#Q-4. Find records where BMI is more than 20 and less than equal to 30.1.
select * from diabetes where bmi > 20 and bmi <= 30.1;

#Q-5. Find all records where Age is not equal to 31. 
select * from diabetes where age not in (31);

#Q-6. Find Blood Pressure where Blood Presure is less than or equal to 76.
select bloodpressure from diabetes where bloodpressure <= 76;

#Q-7. Find Insulin, BMI and Diabetes Pedigree Function betwwen age 30 and 50. 
select insulin, bmi, diabetespedigreefunction from diabetes where age between 30 and 50;

#Q-8. Find Highest and lowest Blood Pressure with respect to BMI and Age. 
select bmi, age, min(bloodpressure) from diabetes where 
bloodpressure = (select max(bloodpressure) from diabetes);

#Q-9. find all records where the value is zero for any one column in each respetive row. 
select * from diabetes where outcome = 0;

#Q-10. Find Average Blood Pressure with respect to Age and Pregnancies where blood pressure is more than 70.
select age, pregnancies, avg(bloodpressure) as avg_bp from diabetes group by age having bloodpressure > 70;

