use classicmodels ;
select * from studentsperformance;

# What is the average score in each subject (Math, Reading, Writing)
select  'math' as subject , avg(math_score)
from studentsperformance
union all 
select 'reading' as subject , avg(reading_score)
from studentsperformance 
union all 
select 'writing' as subject , avg(writing_score)
from studentsperformance ;

# What is the average score per subject for male and female students?
select gender , 
avg(math_score) as math_avg,
avg(reading_score) as reading_avg,
avg(writing_score) as writing_avg
from studentsperformance
group by gender ;

# What is the average score per subject based on the parental level of education?
select parental_level_of_education,
avg(math_score) as PLOE_math_avg,
avg(reading_score) as PLOE_reading_avg,
avg(writing_score) as PLOE_reading_avg
 from studentsperformance 
 group by parental_level_of_education ;
 
#  Who are the top 5 students based on their math exam scores?
select * from studentsperformance 
order by math_score desc
limit 5;

# How many students completed the test preparation course?
select test_preparation_course, count(*)
 from studentsperformance 
where test_preparation_course ='completed'
group by test_preparation_course;

# What is the average score in writing compared to reading scores for each student?
Select * from studentsperformance;
 (SELECT row_number() over() as studentid,s.*
from studentsperformance as s);

Select * from students;
alter table students
rename to studentsperformance ;

select studentid,reading_score , writing_score 
from students
where reading_score=writing_score ;

alter table studentsperformance 
drop column student_id;

select * from studentsperformance ;

# What is the total score (sum of Math, Reading, and Writing) for each student?
select  sum(math_score+reading_score+writing_score) as total_score
from studentsperformance ;

#  What is the average performance by lunch type (Standard or Free/Reduced)?
select lunch ,
 avg(math_score) ,
 avg(reading_score),
 avg(writing_score)
 from studentsperformance
 group by lunch;
 
 #  Who are the top 5 students based on their total scores (sum of Math, Reading, and Writing scores)?
 select student_id, sum(math_score + reading_score + writing_score)  as total_score 
 from studentsperformance 
 group by student_id
 order by total_score 
 limit 5;
 
 select * from studentsperformance ;
 
#  What percentage of students completed the test preparation course?
(select test_preparation_course, count(test_preparation_course='none') from studentSperformance GROUP BY test_preparation_course );
SELECT count(test_preparation_course) ;
select test_preparation_course , count(358*100/test_preparation_course)as percentage 
from studentsperformance
group by test_preparation_course;

select * from studentsperformance
WHERE math_score > (SELECT AVG(math_score) FROM students_performance)
AND reading_score > (SELECT AVG(reading_score) FROM students_performance)
AND writing_score > (SELECT AVG(writing_score) FROM students_performance);

 
