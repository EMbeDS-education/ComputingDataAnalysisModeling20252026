
-- What about returning avarage mark 
-- and number of exams student by student?

select *
from exams
order by student

select student, surname,name, avg(mark*1.0) as AGVMARK, 
count(*) as NExams
from exams join students on student = studentID 
--where student = 276545
group by student, surname, name

-- avg of mark and number of exam for each courseID
SELECT course, title, avg(mark*1.0) as AGVMARK, 
count(*) as NExams
FROM exams join Courses on code=course
group by course, title 
having count(*) > 1

-- number of students supervised by each teacher
-- for teacher provide the num. of supervised students
SELECT supervisor, count(*) as NStud
from students 
where supervisor is not null
group by supervisor


-- number of students supervised by each teacher
-- for teacher provide the num. of supervised students 
-- only if he/she is supervising more than 1 student
SELECT s.supervisor, t.surname, t.name, count(*) as NStud
from students s join Teachers t  on s.supervisor = t.code
where supervisor is not null
group by s.supervisor, t.surname, t.name
having count(*) > 1

-- for teacher provide the num. of supervised students 
-- only if he/she is supervising only 
-- students with year > 1 
SELECT s.supervisor, t.surname, t.name, count(*) as NStud
from students s join Teachers t  on s.supervisor = t.code
where supervisor is not null
group by s.supervisor, t.surname, t.name
having min(year) > 1

-- for teacher provide the num. of supervised students 
-- only if he/she is supervising 
--students that in total have average mark > 25 

SELECT s.supervisor, t.surname, t.name, count(*) as NStud
from students s join Teachers t  on s.supervisor = t.code
join exams e on e.student = s.studentID 
where supervisor is not null
group by s.supervisor, t.surname, t.name
having avg(mark*1.0) > 29

SELECT *
from students s join Teachers t  on s.supervisor = t.code
join exams e on e.student = s.studentID 
where program = 'bachelor' 
