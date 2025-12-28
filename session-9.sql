USE u1;
select * from s1,c1,e1;

-- 4. Write a query to display student name and whether their age is even or odd.
select name, mod(age,2)
from s1;


SELECT name,
       CASE WHEN MOD(age,2)=0 THEN 'Even' ELSE 'Odd' END AS age_type
FROM students;

-- CurrentTime and date
select now() ;
select now()  as CurrentTime;


-- extract year and month from dob
select year(dob), month(dob)
from s1;


-- age calculation
select timestampdiff(year,dob,curdate())
from s1;

-- add/ sub dates
select date_add(dob, interval 18 year)
from s1;

select date_sub(dob,interval 10 year)
from s1;
