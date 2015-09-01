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
