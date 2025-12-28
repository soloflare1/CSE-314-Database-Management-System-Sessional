USE u1;
select * from s1,c1,e1;

select dept, count(id)
from s1
group by dept;


alter table e1
add score int;


update e1
set score = 90
where s_id between 1 AND 3;

update e1
set score = 80
where s_id =6;


select c_id,s_id,avg(score)
from e1
group by c_id
having e1.score > avg(score) ;


 -- Count how many students are in each department.
 select dept, count(id)
 from st
 group by dept;
 
 
-- Show only those departments that have more than 1 student.
select dept, count(id)
from s1
group by dept
having count(id) > 1;


 
 -- Find students who scored above the average score in their course.

select s.name, e.c_id
from s1 s
join e1 e
on s.id=e.s_id
where e.score > (
    select avg(score)
    from e1
    where c_id = e.c_id
);


-- 2. Find the highest score per course.
select max(score), c_id
from e1
group by c_id;

-- 3. Count how many students are in each department.
select count(id), dept
from s1
group by dept;



-- Find students enrolled in course 101:
select name,id from s1 
where id in (select s_id from e1 where c_id=101)





