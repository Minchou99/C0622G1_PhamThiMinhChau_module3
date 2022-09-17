use student_management_ss3;
select * 
from `subject`  
where credit = (
select max(credit) credit_lon_nhat 
from `subject`);

select*
from `subject` s
inner join mark on s.sub_id=mark.sub_id and mark = (
select max(mark) 
from mark); 

select s.student_id,s.student_name, avg(m.mark) diem_trung_binh  
from student s
inner join mark m on s.student_id = m.student_id
group by student_id
order by avg(mark) desc; 


