Use University

-- return the list of students
SELECT *
FROM Students s

-- projection 
SELECT s.studentID as studentCode, s.surname, s.name 
FROM Students s

SELECT s.studentID, s.surname as StudentSurname, s.name 
FROM Students s

-- list course codes with a mark greater than 25
-- table: exams

select distinct e.course--, e.mark 
from exams e
where e.mark > 25

-- list of students without a supervisor
-- table: Students
select *
from Students s 
where s.supervisor is NULL

-- list of students with a supervisor
-- table: Students
select *
from Students s 
where s.supervisor is NOT NULL

-- list of students with surname containing "r"
-- or name containg "c" and ending with "o"
-- table: Students
-- % any combination of chars; _ a single char

select *
from Students s 
where s.surname LIKE '%s%' or s.name LIKE '%b%o'
order by s.surname desc, s.name

-- list the name and surname of teachers supervising 
-- a student
-- tables: students and teanchers 
select s.surname as StudSurname, s.name as StudName, 
t.surname as TeacSurname, t.name as TeacName
from Students s JOIN Teachers t on s.supervisor = t.code 

-- StudentID and surname of students who did 
-- the exam of databases
--tables: students, exams, courses

SELECT distinct s.studentID, s.surname, s.name 
from Students s join Exams e on s.studentID = e.student
join Courses c on e.course = c.code
where c.title like '%databases%'

-- StudentID and surname of students who did 
-- the exam of databases with mark > 27
--tables: students, exams, courses
SELECT distinct s.studentID, s.surname, s.name 
from Students s join Exams e on s.studentID = e.student
join Courses c on e.course = c.code
where c.title like '%databases%' and e.mark > 27

-- list courses ONLY with grade greater than 27
SELECT e.course 
from Exams e
where e.mark > 27
except
SELECT e.course 
from Exams e
where e.mark <= 27
order by course 

-- list of people with their name and surname in our database
SELECT s.studentID , s.name 
from Students s 
union
SELECT t.name, t.department 
from Teachers t 