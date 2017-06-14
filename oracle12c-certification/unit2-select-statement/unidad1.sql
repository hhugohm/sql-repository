--select last_name,salary , 2 * (salary +100) as suma,commission_pct, commission_pct from employees;

--select employee_id,first_name,hire_date,hire_date + hire_date fecha,salary, commission_pct from employees;

--select employee_id,first_name,(sysdate -10/1440) - hire_date   from employees;

select employee_id, first_name ||' '|| last_name as complete_name, 
       last_name ||' '||commission_pct||' '||salary||' '|| hire_date as FULL
       from employees;
       
select * from employees;