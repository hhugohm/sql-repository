Unit 3 Restricting and Sorting Data.

Objetives:
3.01 Limit the rows retrieved by a query.

@@@@@@@@@@@@@@@@@@@@@@
Clausula WHERE
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
      
      
