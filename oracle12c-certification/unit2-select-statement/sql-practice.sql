---SCHEMA HR
select * from departments;
select last_name,salary , 2 * (salary +100) as suma,commission_pct, commission_pct from employees;
select last_name,salary , 2 * (salary + null) as suma,commission_pct from employees;
select last_name,salary , 2 * (salary / null) as suma,commission_pct from employees;
--Exception division 0
--select last_name,salary , 2 * (commission_pct / 0) as suma,commission_pct from employees;
select last_name,salary , 2 * (0 / null) as suma,commission_pct from employees;
--Solo se permite la resta de fechas que da como resultado dias, tambien restar dias, horas, segundos
--select employee_id,first_name,hire_date,hire_date + hire_date fecha,salary, commission_pct from employees;

select employee_id,first_name,(sysdate -10/1440) - hire_date   from employees;

select employee_id, first_name ||' '|| last_name as complete_name, 
last_name ||' '||commission_pct||' '||salary||' '|| hire_date as FULL_DATA
from employees;
       
select employee_id,first_name,hire_date||' - '|| commission_pct from employees;
select employee_id,first_name,hire_date||null commission_pct from employees;
select * from dual;
select '6*6' "Area" FROM employees;
select 'hugo''s' HUGO from dual;
select 'vamos con todo "MEXICO" ' from dual;
select 'vamos con todo "MEXICO''s" ' from dual;
select q'<vamos con todo "MEXICO's" >' from dual;
select q'<vamos con todo "MEXICO''s" >' from dual;
select q'<<vamos con todo MEXICO''s >' from dual;
select 'Coda""s favorite fetch toy is this orange ring' from DUAL;

----------------------------------------------------------------------------
--LAB QUESTION UNIT 2 Data Retrieval Using the SQL SELECT Statement
----------------------------------------------------------------------------
--SCHEMA OE
--1 
--Obtain structural for the product_information and orders tables
describe product_information;
describe orders;

--2
--Select the unique sales_rep_id values from the orders table.
select * from orders;
select distinct sales_rep_id from orders;

--3
--Create a result set based on the orders table that includes the 
--ORDER_ID, ORDER_DATE,ORDER_TOTAL colummns 
select  ORDER_ID, ORDER_DATE,ORDER_TOTAL from orders;

--4
--The PRODUCT_INFORMATION table store data ragarding the products available for sale in 
--a fictitious IT hardware store. Produce a set of results that will be useful
--for a sales person. Extract production information in the format:
--<PRODUCT_NAME> with code: <PRODUCT_ID> has sttus of <PRODUCT_STATUS>. as "Product."
--The result should provide the LIST_PRICE AND MIN_PRICE, slso the difference between LIST_PRICE AND MIN_PRICE
--aliased as "MAX Actual Savings", along with additional expression that takes difference between 
--LIST_PRICE-MIN_PRICE and divides it by LIST_PRICE ann then multiples the total by 100. This expression should be aliased as "MAX Discount%" 
select  PRODUCT_NAME||' with code: '||PRODUCT_ID||' '|| 'has sttus of: '||PRODUCT_STATUS||'.' as "Product.",
LIST_PRICE, MIN_PRICE,
LIST_PRICE-MIN_PRICE as "MAX Actual Savings",
100*((LIST_PRICE-MIN_PRICE)/LIST_PRICE )as "MAX Discount%"
from PRODUCT_INFORMATION;

--5
select (4*(22/7)*(3958.759*3958.759)) as "Earth's Area" from dual;



