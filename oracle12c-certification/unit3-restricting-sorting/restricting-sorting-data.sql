##############################################################################
#				Unit 3 Restricting and Sorting Data.
##############################################################################

Objetives:
3.01 Limit the rows retrieved by a query.

@@@@@@@@@@@@@@@@@@@@@@
Clausula WHERE
@@@@@@@@@@@@@@@@@@@@@@
Numeric-Base Condition

1.- Teniendo lo siguiente

desc emp;

Nombre        Nulo     Tipo         
------------- -------- ------------ 
EMPNON        NOT NULL NUMBER(4)    
ENAME                  VARCHAR2(20) 
HIREDATE               DATE         
EDAD                   NUMBER(2)    
SUELDO                 NUMBER(4,2)  
TIPO_LICENCIA          CHAR(1)    

a) Realizar un select de la tabla emp utilizando la clausula WHERE con
   numeric-base condition en el campo sueldo sea mayo o igual a 5
   
 respuesta: --> Automaticamente oracle convierte de cadena a numero
 
 SELECT * FROM emp WHERE sueldo>='5';
 SELECT * FROM emp WHERE sueldo>=5;
 
 b) Teniendo la siguiente informacion en la la tabla emp
 
 5	hugo hidalgo	19/05/15		5	
10	mario tavares	19/05/15		10	
	
--> Comparar por medio de una columna numerica en una sentencia where:
 
 
 select * from emp where EMPNON=SUELDO;
 
 
 c) Realizar una sentencia where que utilice expresiones numericas
 respuesta:
 
 select * from emp where sueldo*100=EMPNON*100;
 
 NOTA: Las condiciones a nivel numerico se puden comparar de dos maneras con
       cadenas(pero q sean numeros-sino arrojara una exception) y numericos
 
-------------------------------------------------------------------------------
@@@@@@@@@
 Character-Based conditions
@@@@@@@@@
1.- Ejecutar el siguiente query:
select * from emp where ENAME='hugo hidalgo';
Que resultado tendra el anterior query?
a) No marca error ya q esta correctamente a nivel sintaxis
b) En caso de existir informacion la presentara.

2.-Ejecutar  el siguiente query:
select * from emp where ENAME="hugo hidalgo";
Que resultado tendra el anterior query?
a) Mandara error "identificador no valido"

3.-Ejecutar  el siguiente query:
select * from emp where ENAME='HUGO HIDALGO';
Que resultado tendra el anterior query?
a) No marca error ya q esta correctamente a nivel sintaxis
b) En caso de existir informacion la presentara.

4.- Ejecutar el siguiente query 
select * from emp where ENAME=TIPO_LICENCIA;
a) es valido el query ya que las dos columnas son cadena (varchar and char)


NOTA: Las condiciones a nivel caracter son sensitivos y van entre comilas simples
      No se puede comparar con campos numericos.
      Se puede realizar concatenacion enter expresiones y columnas.
      
      Ejemplo
       select * from emp where ENAME='hugo hidalgo'||TIPO_LICENCIA;
       select * from emp where 'hugo hidalgo'||TIPO_LICENCIA=ENAME;

-------------------------------------------------------------------------------
@@@@@@@@@@
Data-Based -Condition
@@@@@@@@@
1.- Teniendo la siguiente informaion en la base de datos:

Nombre        Nulo     Tipo         
------------- -------- ------------ 
EMPNON        NOT NULL NUMBER(4)    
ENAME                  VARCHAR2(20) 
HIREDATE               DATE         
EDAD                   NUMBER(2)    
SUELDO                 NUMBER(4,2)  
TIPO_LICENCIA          CHAR(1)    

5	hugo hidalgo	19/05/15		5	5
10	mario tavares	19/05/15		10	

a) Obtener los registros que en fecha de contratacion sean mayor a
17 de Enero de 2015

select * from emp where HIREDATE>'17-JAN-15';
select * from emp where HIREDATE>'17-01-15';
select * from emp where HIREDATE>'17-01-2015';
select * from emp where HIREDATE>TO_DATE('17-JANUARY-15','DD-MONTH-RR');

b) Si tenemos el siguiente query:
select * from emp where HIREDATE>'17-01-50';
-Que fecha es representada en 17-01-50 ? --> 17-01-1950

c) Si tenemos el siguiente query:
select * from emp where HIREDATE>'17-01-49';
-Que fecha es representada en 17-01-50 ? --> 17-01-2049

b) Si tenemos el siguiente query:
select * from emp where HIREDATE>'17-01-99';
-Que fecha es representada en 17-01-99 ? --> 17-01-1999

Nota: la fecha por default es DD-Mon-RR
      de 50 a 99 representa años(1950-1999)
      

-------------------------------------------------------------------------------
@@@@@@@@
Pattern Comparison with the LIKE OPERATOR
@@@@@@@@
1.- Realizar un select a la tabla emp donde en nombre del empleado comience con
 la letra h 
 
 select * from emp where ename LIKE 'h%';
 
 2.- Realizar un select a la tabla emp donde en nombre del empleado comience con
 la letra r
 
 select * from emp where ename LIKE 'r%';
 
 3.- Realizar un select a la tabla emp donde en nombre del empleado sea hugo hidalgo
 
 select * from emp where ename LIKE '%hugo hidalgo%';
 select * from emp where ename LIKE 'hugo hidalgo';
 
  
 4.- Realizar un select a la tabla emp donde en nombre del empleado en su segunda letra
 comience con la letra a.
 
 select * from emp where ename LIKE '_a%';
 
  5.- Realizar un select a la tabla emp donde en nombre del empleado contenga un 
  _ en su nombre
 
 select * from emp where ename LIKE '%\_%' ESCAPE '\';
 
   6.- Realizar un select a la tabla emp donde en nombre del empleado contenga un 
  % en su nombre utilizando $ ESCAPE
  
 select * from emp where ename like '%$%%' ESCAPE '$';
 select * from emp where ename like '%\%%' ESCAPE '\';
 
 -------------------------------------------------------------------------------
 @@@@@@@@@@@@@@@
 Set Comparison with the IN Operator
 @@@@@@@@@@@@@@@
 
 1.- Obtener el salario de los empleados que sean 2, 5 o 10
 
 select * from emp where sueldo in (2,5,10);
 select * from emp where sueldo in (10,2,5);
 
 2.- Del anterior query, ahora realizar lo mismo usando OR
 
   select * from emp where sueldo=2 OR sueldo=5 OR sueldo=10;
   
 3.- Realizar un query donde se obtenga registros con numero de tipo de licencia
 igual a 2,3 o 5
 
 select * from emp where tipo_licencia in ('2','3','5');
 select * from emp where tipo_licencia='2' OR tipo_licencia='3' OR tipo_licencia='5';
 
 4.- Realizar un query donde se obtenga registros con fecha de contratacion 
 '11/03/73', '12/01/20' y '12/01/01'
 
 select * from emp where hiredate IN ('11-MAR-73','12-JAN-20','12-JAN-01');
 
 Nota: Forma default oracle 'DD-MON-RR'}
 ------------------------------------------------------------------------------
 @@@@@@@@@
 Range Comparison with the BETWEEN Operartor.
 @@@@@@@@@
 1.- Realizar un query donde el salario este en un rango 5 y 90 
 
select * from emp where sueldo between 5 and 90;

2.- Realizar el query anterior usando AND y operadores algebraicos

select * from emp where sueldo>=5 AND sueldo<=90;

3.- Realizar un query para saber que empleado fueron contratados desde
el 1/Enero/1901 hasta 1/Diciembre/2001

select * from emp where hiredate between '01-JAN-1901' and '01-DEC-01';

4.- Realizar un query para saber que empleado(s) donde la fecha 19/abril/1977
estan entre la fecha de contratacion y la fecha actual.

select * from emp where '19-APR-77' BETWEEN hiredate   and sysdate;
-------------------------------------------------------------------------------
@@@@@@@@@@@@@@
 Equality and Inequality
@@@@@@@@@@@@@@

1.- Realizar un query donde el nombre de 'hugo' sea menor o igual a la columna
ename

select * from emp where ename<='hugo'


1.- Realizar un query donde la fecha de contratacion sea mayor a 15/febrero/1950
 y sea menor al dia de ayer en la fecha en curso.
 
 select * from emp where hiredate>='17-FEB-1950' and hiredate<=sysdate-1;
 select * from emp where hiredate>=TO_DATE('17-FEB-1950','DD-MON-RRRR') and hiredate<=sysdate-1;
 
 ******************************
 Ejercicios
@@@@@@@
lower
@@@@@@@
select lower('ESTE ES UN MENSAJE EN LA BASE DE DATOS') from dual;
--este es un mensaje en la base de datos
select lower(123456789.89) from dual;
--123456789.89
select lower(to_date('01-Sep-15','DD-Mon-YY')) from dual;
--01/09/15
select lower(to_date('01-Sep-2015','DD-Mon-RR'))from dual;
--01/09/15

@@@@@@@
upper
@@@@@@@
select upper('este es un mensaje en la base de datos') from dual;
--ESTE ES UN MENSAJE EN LA BASE DE DATOS
select upper(123456789.89) from dual;
--123456789.89
select upper(to_date('01-Sep-15','DD-Mon-YY')) from dual;
--01/09/15
select upper(to_date('01-Sep-2015','DD-Mon-RR'))from dual;
--01/09/15

@@@@@@@
initcap
@@@@@@@
select initcap('este es un mensaje en la base de datos') from dual;
--Este Es Un Mensaje En La Base De Datos
select initcap(123456789.89) from dual;
--123456789.89
select initcap(to_date('01-Sep-15','DD-Mon-YY')) from dual;
--01/09/15
select initcap(to_date('01-Sep-2015','DD-Mon-RR'))from dual;
--01/09/15

@@@@@@@
length
@@@@@@@
select length('este es un mensaje en la base de datos') from dual;
--38
select length(123456789.89) from dual;
--12
select length(to_date('01-Sep-15','DD-Mon-YY')) from dual;
--8
select length(to_date('01-Sep-2015','DD-Mon-RR'))from dual;
--8

@@@@@@@
concat
@@@@@@@
select concat('1era cadena','segunda cadena') from dual;
--1era cadenasegunda cadena
select concat(concat('1era cadena','-'),'segunda cadena') from dual;
--1era cadena-segunda cadena
select '1era cadena'||'segunda cadena' from dual;
--1era cadenasegunda cadena
select '1era cadena'||'-'||'segunda cadena' from dual;
--1era cadena-segunda cadena

@@@@@@@
substr
@@@@@@@
--SUBSTR( string, start_position [, length ] )
select substr('ESTE ES UN MENSAJE EN LA BASE DE DATOS') from dual;
--ORA-00938: no hay suficientes argumentos para la función
select substr('ESTE ES UN MENSAJE EN LA BASE DE DATOS',0) from dual;
--ESTE ES UN MENSAJE EN LA BASE DE DATOS
select substr('ESTE ES UN MENSAJE EN LA BASE DE DATOS',1) from dual;
--ESTE ES UN MENSAJE EN LA BASE DE DATOS
select substr('ESTE ES UN MENSAJE EN LA BASE DE DATOS',11) from dual;
-- MENSAJE EN LA BASE DE DATOS
select substr('ESTE ES UN MENSAJE EN LA BASE DE DATOS',11,0) from dual;
--null
select substr('ESTE ES UN MENSAJE EN LA BASE DE DATOS',11,-1) from dual;
--null
select substr('ESTE ES UN MENSAJE EN LA BASE DE DATOS',12,7) from dual;
--MENSAJE
select substr('ESTE ES UN MENSAJE EN LA BASE DE DATOS',-13,4) from dual;
--BASE
select substr('ESTE ES UN MENSAJE EN LA BASE DE DATOS',-39,4) from dual;
--null
select substr(123456789.89,-3,3) from dual;
--.89
select substr(to_date('01-Sep-2015','DD-Mon-RR'),-6,3)from dual;
--/09

@@@@@@@
instr
@@@@@@@
--INSTR( string, substring [, start_position [,  nth_appearance ] ] )
select instr('ESTE ES UN MENSAJE EN LA BASE DE DATOS') from dual;
--ORA-00938: no hay suficientes argumentos para la función
select instr('ESTE ES UN MENSAJE EN LA BASE DE DATOS','O') from dual;
--37
select instr('ESTE ES UN MENSAJE EN LA BASE DE DATOS','A',-9,3) from dual;
--16
select instr('ESTE ES UN MENSAJE EN LA BASE DE DATOS','A',-9,1) from dual;
--27
select instr('ESTE ES UN MENSAJE EN LA BASE DE DATOS','E',9) from dual;
--13

@@@@@@@
lpad
@@@@@@@
--LPAD( string1, padded_length [, pad_string] ) espacios por default
select lpad('ESTE ES UN MENSAJE EN LA BASE DE DATOS',50) from dual;
--            ESTE ES UN MENSAJE EN LA BASE DE DATOS
select lpad('ESTE ES UN MENSAJE EN LA BASE DE DATOS',50,'*') from dual;
--************ESTE ES UN MENSAJE EN LA BASE DE DATOS
select lpad('ESTE ES UN MENSAJE EN LA BASE DE DATOS',10,'*') from dual;
--ESTE ES UN

@@@@@@@
rpad
@@@@@@@
--RPAD( string1, padded_length [, pad_string] ) espacios por default
select rpad('ESTE ES UN MENSAJE EN LA BASE DE DATOS',50) from dual;
--ESTE ES UN MENSAJE EN LA BASE DE DATOS            
select rpad('ESTE ES UN MENSAJE EN LA BASE DE DATOS',50,'*') from dual;
--ESTE ES UN MENSAJE EN LA BASE DE DATOS************
select rpad('ESTE ES UN MENSAJE EN LA BASE DE DATOS',10,'*') from dual;
--ESTE ES UN

@@@@@@@
trim
@@@@@@@
--TRIM( [ [ LEADING | TRAILING | BOTH ] trim_character FROM ] string1 )
select trim('   ESTE ES UN MENSAJE EN LA BASE DE DATOS') from dual;
--ESTE ES UN MENSAJE EN LA BASE DE DATOS
select trim('   ESTE ES UN MENSAJE EN LA BASE DE DATOS       ') from dual;
--ESTE ES UN MENSAJE EN LA BASE DE DATOS
select trim(' ' from '   ESTE ES UN MENSAJE EN LA BASE DE DATOS       ') elimina from dual;
--ESTE ES UN MENSAJE EN LA BASE DE DATOS
select trim(leading '*' from '***ESTE ES UN MENSAJE EN LA BASE DE DATOS*****') from dual;
--ESTE ES UN MENSAJE EN LA BASE DE DATOS*****
select trim(trailing '*' from '***ESTE ES UN MENSAJE EN LA BASE DE DATOS****') from dual;
--***ESTE ES UN MENSAJE EN LA BASE DE DATOS
select trim(both '*' from '***ESTE ES UN MENSAJE EN LA BASE DE DATOS****') from dual;
--ESTE ES UN MENSAJE EN LA BASE DE DATOS

@@@@@@@
round
@@@@@@@
--ROUND( number [, decimal_places] )
select round(987.98765) from dual;
--988
select round(987.5) from dual;
--988
select round(987.4989) from dual;
--987
select round(987.98765,0) from dual;
--988
select round(987.9876,1) from dual;
--988
select round(987.58465,1) from dual;
--987.6
select round(987.58465,2) from dual;
--987.58
select round(987.58465,3) from dual;
--987.585
select round(987.58465,-2) from dual;
--1000
select round(987.58465,-1) from dual;
--990
select round(11256.58465,-3) from dual;
--11000
select round(11254.58465,-1) from dual;
--11250


@@@@@@@
mod
@@@@@@@
--MOD( m, n )
select mod(10,2) from dual;
--0
select mod(11,2) from dual;
--1
select mod(7,3) from dual;
--1
select mod(100,2.1) from dual;
--1.3
select mod(56.89,3.1) from dual;
--1.9


@@@@@@@
trunc
@@@@@@@
--TRUNC( number [, decimal_places] )
select trunc(987.98765) from dual;
--987
select trunc(987.5) from dual;
--987
select trunc(987.4989) from dual;
--987
select trunc(987.98765,0) from dual;
--987
select trunc(987.9876,1) from dual;
--987.9
select trunc(987.58465,1) from dual;
--987.5
select trunc(987.58465,2) from dual;
--987.58
select trunc(987.58465,3) from dual;
--987.584
select trunc(987.58465,-2) from dual;
--900
select trunc(987.58465,-1) from dual;
--980
select trunc(11256.58465,-3) from dual;
--11000
select trunc(11254.58465,-1) from dual;
--11250

@@@@@@@
MONTHS_BETWEEN
@@@@@@@
--MONTHS_BETWEEN( date1, date2 )
select months_between(to_date('01-09-2015','dd-mm-rrrr'),to_date('01-08-2015','dd-mm-rrrr')) from dual;
--1
select months_between(to_date('01-08-2015','dd-mm-rrrr'),to_date('01-09-2015','dd-mm-rrrr')) from dual;
-- -1
select months_between(to_date('01-Sep-15','dd-Mon-rr'),to_date('01-Jun-2015','dd-mm-rrrr')) from dual;
--3

--MONTHS_BETWEEN( date1, date2 )
select months_between(to_date('01-09-2015','dd-mm-rrrr'),to_date('01-08-2015','dd-mm-rrrr')) from dual;
--1
select months_between(to_date('01-08-2015','dd-mm-rrrr'),to_date('01-09-2015','dd-mm-rrrr')) from dual;
-- -1
select months_between(to_date('01-Sep-15','dd-Mon-rr'),to_date('01-Jun-2015','dd-mm-rrrr')) from dual;
--3

@@@@@@@
ADD_MONTHS
@@@@@@@
--ADD_MONTHS( date1, number_months )
select add_months(to_date('01-Sep-15','dd-Mon-rr'),4) from dual;
--01/01/2016
select add_months(to_date('01-Sep-15','dd-Mon-rr'),-4) from dual;
-- 01/05/2015

@@@@@@@
LAST_DAY
@@@@@@@
--LAST_DAY( date )
select last_day(to_date('01-Sep-15','dd-Mon-rr')) from dual;
--30/09/2015
select last_day(to_date('01-Nov-15','dd-Mon-rr')) from dual;
--31/11/2015

@@@@@@@
next_day
@@@@@@@
--NEXT_DAY( date, weekday )
select next_day(to_date('01-09-15','dd-mm-rr'),'Lunes') from dual;
--07/09/2015
select next_day(to_date('01-09-15','dd-mm-rr'),'Domingo') from dual;
--06/09/2015

@@@@@@@
sysdate
@@@@@@@
select sysdate from dual;
--01/09/2015 03:29:50 pm

@@@@@@@
ROUND
@@@@@@@
--ROUND( date [, format] )
select round(to_date('01-09-2015','dd-mm-rrrr')) from dual;
--01/09/2015
select round(to_date('03-09-2015','dd-mm-rrrr'),'day') from dual;
--31/08/2015
select round(to_date('04-09-2015','dd-mm-rrrr'),'day') from dual;
--07/09/2015
select round(to_date('11-09-2015','dd-mm-rrrr'),'day') from dual;
--14/09/2015
select round(to_date('18-09-2015','dd-mm-rrrr'),'day') from dual;
--21/09/2015
select round(to_date('25-09-2015','dd-mm-rrrr'),'day') from dual;
--28/09/2015
select round(to_date('02-10-2015','dd-mm-rrrr'),'day') from dual;
--05/10/2015
--viernes, sabado, domingo, lunes -->  siguiente Lunes
--martes, miercoles, jueves       -->  mismo lunes


select round(to_date('15-10-2015','dd-mm-rrrr'),'month') from dual;
--01/10/2015
select round(to_date('16-10-2015','dd-mm-rrrr'),'month') from dual;
--01/11/2015
-- 1,2,...15 bajan ---> 16,17,...31 -->suben al dia consecuitivo

select round(to_date('15-10-2015','dd-mm-rrrr'),'year') from dual;
--01/01/2016
select round(to_date('01-07-2015','dd-mm-rrrr'),'year') from dual;
--01/01/2016
select round(to_date('01-07-2015','dd-mm-rrrr'),'year') from dual;
--01/01/2016
select round(to_date('30-06-2015','dd-mm-rrrr'),'year') from dual;
--01/01/2015
--ene, feb,mar,abri,may,junio -->baja al primer dia de Enero del año esque se encuentre
--jul,agos, sep, nov, oct, nov, dic--> sube al primer dia de año siguiente.


@@@@@@@
trunc
@@@@@@@
--TRUNC ( date [, format ] )
select trunc(to_date('01-09-2015','dd-mm-rrrr')) from dual;
--01/09/2015
select trunc(to_date('04-09-2015','dd-mm-rrrr'),'day') from dual;
--31/08/2015
select trunc(to_date('11-09-2015','dd-mm-rrrr'),'day') from dual;
--07/09/2015
select trunc(to_date('18-09-2015','dd-mm-rrrr'),'day') from dual;
--14/09/2015
select trunc(to_date('27-09-2015','dd-mm-rrrr'),'day') from dual;
--21/09/2015
--viernes, sabado, domingo,  -->baja lunes anterior
--martes, miercoles, jueves  -->mismo lunes


select trunc(to_date('15-10-2015','dd-mm-rrrr'),'month') from dual;
--01/10/2015
select trunc(to_date('16-10-2015','dd-mm-rrrr'),'month') from dual;
--01/10/2015
--simepre coloca el 1er dia del mes en la fecha

select trunc(to_date('01-07-2015','dd-mm-rrrr'),'year') from dual;
--01/01/2015
select trunc(to_date('30-06-2015','dd-mm-rrrr'),'year') from dual;
--01/01/2015
--simepre coloca el 1er dia de enero del año en la fecha

@@@@@@@
replace
@@@@@@@
--REPLACE( string1, string_to_replace [, replacement_string] )
select replace('***ESTE ES UN MENSAJE EN LA BASE DE DATOS***','*') from dual;
--ESTE ES UN MENSAJE EN LA BASE DE DATOS
select replace('***ESTE ES UN MENSAJE EN LA BASE DE DATOS***','*','@') from dual;
--@@@ESTE ES UN MENSAJE EN LA BASE DE DATOS@@@


@@@@@@@
nvl
@@@@@@@
--NVL( string1, ifnull )
select nvl('valor 1', 'valor cuando es null') from dual;
--valor 1
select nvl(null, 'valor cuando es null') from dual;
--valor cuando es null
select nvl(substr('abc',4),'no existe la cadena') from dual;
--no existe la cadena

@@@@@@@
nvl2
@@@@@@@
--NVL2( string1,ifnotnull,ifnull )
select nvl2(1234,1,'una cadena') from dual;
--error porque debe haber consistencia en los valores
select nvl2(1234,1,2) from dual;
--1
select nvl2(null,1,2) from dual;
--2
select nvl2('original','not null','null') from dual;
--not null

@@@@@@@
nullif
@@@@@@@
--NULLIF( ifunequal, expr2 )
-- if ifunequal = expr2 -->null
-- if  ifunequal <> expr2 -->ifunequal
select nullif('cadena 1','cadena 2') from dual;
--cadena 1
select nullif('cadena 1','cadena 1') from dual;
--null
select nullif(to_date('02-09-2015'),to_date('02-Sep-15','dd-Mon-rr')) from dual;
--null
select nullif(to_date('03-09-2015'),to_date('02-Sep-15','dd-Mon-rr')) from dual;
--03/09/2015

@@@@@@@
coalesce
@@@@@@@
--COALESCE( expr1, expr2, ... expr_n )
--The COALESCE function will compare each value, one by one
select coalesce('valor 1','valor 2',2) from dual;
--Error Ora-00932 tipos de datos inconsistentes
select coalesce('valor 1','valor 2','valor 3') from dual;
--valor 1
select coalesce(null,null,'valor 3') from dual;
--valor 3
select coalesce(null,null,null) from dual;
--null
select coalesce(null,to_date('03-09-2015'),null) from dual;
--03/09/2015

@@@@@@@
decode
@@@@@@@
--DECODE( expression , search , result [, search , result]... [, default] )
select decode(to_date('03-09-2015'),null,null,
                                    to_date('02-Sep-15','dd-Mon-rr'),sysdate,
                                                                            to_date('01-01-1900')) from dual;
--01/01/00
select decode(to_date('03-09-2015'),null,null,
                                    to_date('03-Sep-15','dd-Mon-rr'),sysdate,
                                                                            to_date('01-01-1900')) from dual;
--sysdate
select decode(to_date('03-09-2015'),to_date('03-09-2015'),to_date('30-09-2015'),
                                    to_date('03-Sep-15','dd-Mon-rr'),sysdate,
                                                                            to_date('01-01-1900')) from dual;
--30/09/2015

@@@@@@@
case
@@@@@@@
--CASE [ expression ]

   --WHEN condition_1 THEN result_1
   --WHEN condition_2 THEN result_2
  -- ...
  -- WHEN condition_n THEN result_n

  -- ELSE result

--END

select length('mi cadena'),
case length('mi cadena')
    when 8 then 'mi cadena tiene longitud es de 8'
    when 9 then 'mi cadena tiene longitud ed de 9'
    else 'la cadena tine longitud mayor a 9'
end
from dual;

select sysdate,
case sysdate
    when to_date('01-09-2015','fmdd-mm-rrrr') then 'la fecha es: '||to_date('01-09-2015','fmdd-mm-rrrr')
    when to_date('02-09-2015','fmdd-mm-rrrr') then 'la fecha es: '||to_date('02-09-2015','fmdd-mm-rrrr')
    when to_date('03-09-2015','fmdd-mm-rrrr') then 'la fecha es: '||to_date('03-09-2015','fmdd-mm-rrrr')
    else 'la fecha es: '||sysdate
end
from dual;

@@@@@@@
to_char
@@@@@@@
--TO_CHAR( value [, format_mask] [, nls_language] )
select to_char(1210.73, '$9,999.0') from dual;--coloca el simbolo de moneda y un decimal
--$1,210.7
select to_char(1210.73, '$9,999.00') from dual;--coloca el simbolo de moneda y dos deci
--$1,210.7
select to_char(1210.73, 'fm$9,999.00') from dual;--elimina los espacios lading trailing
--$1,210.7
select to_char(1210.73, 'fmc9,999.00') from dual;--coloca el tipo de moneda
--MXN1,210.73
select to_char(1210.73, 'fmL9999.00') from dual;--coloca el simbolo de moneda
--$1210.73
select TO_CHAR(0012345.6700, 'FM99999.99') from dual;--elimina los espacios lading trailing
--12345.67
select to_char(sysdate)||' es la fecha de hoy' from dual;
--03/09/15 es la fecha de hoy
select 'La fehca de hoy es ' || to_char(sysdate,'fxdd/Month/rrrr') from dual;
--La fehca de hoy es 03/Septiembre/2015
select 'hoy: '||to_char(sysdate,'ddth-mm-rr') from dual;
--hoy: 03rd-09-15
select 'hoy: '||to_char(sysdate,'dd-mm-rr')||' siendo las '||to_char(sysdate,'HH24:MI')||' hr' from dual;
--hoy: 03-09-15 siendo las 16:26 hr
select 'hoy: '||to_char(sysdate,'dd-mm-rr')||' siendo las '||to_char(sysdate,'FMHH12:MI AM')||' hr' from dual;
--hoy: 03-09-15 siendo las 4:30 PM hr
select 'hoy: '||to_char(to_date('03/09/15','fxdd/mm/rr'))||' siendo las '||to_char(sysdate,'fmHH12:MI am')||' hr' from dual;
--hoy: 03/09/15 siendo las 4:32 PM hr

@@@@@@@
to_number
@@@@@@@
select to_number('$1,210.73', '$9,999.00') from dual;
--1210.73
select to_number('MXN1,210.73', 'fmc9,999.00') from dual;
--1210.73
select to_number('$1,210.73', 'fmL9,999.00') from dual;
--1210.73

@@@@@@@
to_date
@@@@@@@
SELECT to_date('2010-Ago-09 02:00:01 PM' , 'yyyy-Mon-dd HH:MI:SS AM') "date" FROM dual;
--09/08/2010 02:00:01 p.m.
SELECT to_date('03/09/15' , 'fxdd/mm/rr')|| ' date' fecha FROM dual;
--03/09/15 date
SELECT to_date('030915' , 'fxddmmrr')|| ' date' fecha FROM dual;
--03/09/15 date


############################################################################## 
#         Unit 6 Reporting Aggregated Data Using the Group Functions.
############################################################################## 

Los Group or aggregate function operan con multiples rows y regresan in solo 
resultado por grupo, estos grupos por lo general son de 0 a mas.
AVG, SUM, MIN, MAX y COUNT

La clausula WHERE restrinje rows en un dataset antes de ser agrupados mientras
que la clausula HAVING hace la restriccion despues de la agrupacion. 

F(g1,g2, g3...gn) = result1, result2, result3, ... resultn

Uno o mas group functions pueden aparecer en la sentencia SELECT:

SELECT group_fuction(column or expression), ....
FROM table [WHERE ...] [ORDER BY..]


la sentencia count se ejecutara segun el numero de grupos encontrados, para asi dar un solo resultado por grupo.

@@@@@@@
count : cuenta el numero de rows en un grupo.
@@@@@@@

COUNT({*|[DISTICT|ALL] expr});
1.-COUNT(*): incluye valores nullos o duplicados
2.-COUNT(DISTINCT expr): solo valores unicos no incluye los valores null.
3.-COUNT(ALL expr): equivalente a COUNT(expr) no incluye los valores null.
4.-COUNT(expr): equivalente a COUNT(ALL expr) no incluye los valores null.

una expr: NUMBER,DATE, CHAR o VARCHAR2.
Si la expresion es NULL sera ignorada a manos que utilice funciones NVL, NVL2 o COALESCE

SELECT count(*), department_id
FROM employees
GROUP BY department_id,
ORDER BY department_id;

@@@@@@@
avg: Esta funcion calcula el promedio de una columna numerica o una expresion numerica.
@@@@@@@

AVG([DISTINCT|ALL] expr);

1.-AVG(DISTINCT expr): Solo toma en cuenta los valores unicos y es dividido entre los valores unicos tambien.
2.-AVG(ALL expr): Agrega los valores notnull y los divide entre la suma de los notnull
3.-AVG(expr):  Agrega los valores notnull y los divide entre los notnull


@@@@@@@
sum: regresa el total de la suma de los notnull de una columna o expresion numerica.
@@@@@@@

SUM([DISTINCT|ALL] expr);

1.- SUM(DISTICT expr): Realiza la suma de valores unicos y diferentes de nulos por cada grupo
2.- SUM all expr): Suma los valores unicos y duplicados ignorando los nullos
3.- SUM(expr) :Suma los valores unicos y duplicados ignorando los nullos

@@@@@@@
max and min: regresa el maximo o minimo valor de un conjunto de grupo
@@@@@@@

MAX([DISTINCT|ALL] expr);
MIN([DISTINCT|ALL] expr);

1.- MAX(DISTINCT expr); MIN(DISTINCT expr); : evaluan el valor mayoy y meno de duplicados e ignora los nulls
2.- MAX(ALL expr); MIN(ALL expr); : evaluan el valor mayoy y meno de duplicados e ignora los nulls
3.- MAX(expr); MIN(expr); : evaluan el valor mayoy y meno de duplicados e ignora los nulls

NUMBER, DATE, CHAR o VARCHAR2

@@@@@@@
stddev and variance
@@@@@@@


ejemplos:
select * from tbl_watchlist;
desc tbl_watchlist;

select count(*) from tbl_watchlist; --cuenta todos los registros(duplicados, nullos y notnulls)
--246614
select sum(2) from tbl_watchlist; --suma cada registro 2 veces por cada row encontrada
--493228
select count(*), nomcomp,razonsoc from tbl_watchlist group by nomcomp,razonsoc order by nomcomp;
--realiza el conteo por grupo nombre y razon social
select count(razonsoc) from tbl_watchlist; --cuenta los todo menos notnull
--11115
select count(ALL razonsoc) from tbl_watchlist; --cuenta todo menos notnull
--11115
select count(DISTINCT razonsoc) from tbl_watchlist; --cuenta los unicos
--8595
select count(nvl(razonsoc,' ')) from tbl_watchlist; --cuenta todos y los nullos los pasa a un espacio para que sean tomados en cuenta
--246614
select count(nvl2(razonsoc,razonsoc,' ')) from tbl_watchlist;
--246614


select avg(stat) from  tbl_watchlist;
--0.883790052470663
select sum(stat)/count(stat) from  tbl_watchlist;
--0.883790052470663
select sum(id_file) from tbl_watchlist;


select max(DISTINCT nomcomp)  from tbl_watchlist;
--ZYNTHYA BORBOA DE ZAMBADA
select max(DISTINCT LAST_UPDATE)  from tbl_watchlist;
--28/08/2015 01:34:31 p.m.
select min(DISTINCT nomcomp)  from tbl_watchlist;
--007 GARCIA CARRILLO
select min(DISTINCT LAST_UPDATE)  from tbl_watchlist;
--25/08/2015 04:27:36 p.m.
select to_char(min(DISTINCT LAST_UPDATE),'fmDd/Month/RRRR')  from tbl_watchlist;
--25/Agosto/2015

select sum(variance(stat)) from  tbl_watchlist;
--0.10270561208759
select variance(nvl(stat,0)) from  tbl_watchlist;
--0.10270561208759
select stddev(stat) from  tbl_watchlist;
--0.32047716312959
select sum(variance(stat)) from  tbl_watchlist;
--[Error] Execution (457: 12): ORA-00978: función de grupo anidada sin GROUP BY
select sum(variance(stat)) from  tbl_watchlist  group by stat;

El anidamiento de Grupo de funciomes solo es posible en 2 niveles.
G1(G2(group_item))= result --> Es MANDATORIO usar Clausula WHERE
G1(G2(G3(group_item)))=NO ES PERMITIDO

@@@@@@@
group by: Agrupacion de datos en donde una tabla al menos tiene una columna y cero o mas rows con informacion
@@@@@@@

select count(*), max(nomcomp) from tbl_watchlist group by nombre;
--32	MIKE UY
--52	PAUL WOLFOWITZ
--1	EFREIN GONZALEZ
--1	ANTWAN JOHSON
--1	SEENORAIN SEENARAIN

--select count(*), nomcomp,razonsoc from tbl_watchlist group by nomcomp,razonsoc order by nomcomp;
select count(*),nomcomp, nvl(razonsoc,' ') razon from tbl_watchlist group by nomcomp,razonsoc;
--2	STEPHEN CRAIG CAMPBELL	 
--1	ALBERTO HUGO BUCIO	 
--1	SQUEAKY BROWN	 
--1	FAT BOY CHAMBERLIN	 
--1	ROBERT L SCHREETER	 
--1	MUSA JAMAL BROWN	 
--1	FREDY FLACO ESPANA	 

select count(*) "contador" , lista from tbl_watchlist  group by lista  having count(*) >23 order by 1
--24	SSEU
--72	ICE
--79	ATF
--136	PIS
--241	LMW
--242	ONUTAL
--251	bis
--253	pgr
--405	UKMW
--568	BID
--575	ONUAQ
--628	CBI
--706	PGJ
--856	BM

select count(*) "contador" , lista from tbl_watchlist where lista in('SSEU','ICE','ATF') group by lista  having count(*) >23 order by;
--24	SSEU
--72	ICE
--79	ATF
