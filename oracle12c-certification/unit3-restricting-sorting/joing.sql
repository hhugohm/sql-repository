############################################################################## 
#         Unit 7 Displaying Data from multiple Tables.
############################################################################## 



Los tres pilares de la teoria relacional son: 
1.- Seleccion
2.- Proyeccion
3.- Joining (union): Rows de diferentes tablas son asociadas usando joins

Las tecnicas ocupadas para realizar los joins son:
1.- equijoin
2.- nonequijoin
3.-     selftjoin: Asociar rows con otras rows de la misma tabla.

inner join: Cuando se realiza la asociacion por medio de un match entre tabla source y target. 
			Donde el valor de la columna que hace match en la tabla source aparece de igualmente en la tabla target.
outer join: Cuando se realiza la asociacion entre una tabla source y target pero no es necesario que exista
			un valor match entre las dos tablas.

cross join/ Cartesian product: Es cuando cada row de una tabla es joined con todas los rows in la otra

inner join esta dividido en los siguiente:
1.-Natural join, using  y ON

@@@@@@@
Natural Join: cuando la tabla source y la tabla target se relacionan automaticamente por el nombre de columnas sin especificar el joing, solo debe coincidir el nombre de columnas.
@@@@@@@
select table1.column,table2.column
from table1
natural join table2;

-la relacion en el natural join sera en automatico
-No se podra usar qualifiers (alias o nombre completo tabla.nombreCampo) en los campos join.

select * from regions natural joing countries where country_id='US';
select employee_id, job_id, department_id, emp.last_name, emp.hire_date, jh.end_date from join job_history jh   natural join employees emp; 
select region_name from regions natural join countries where country_name='Canada';
select country_name from countries natural join regions where 	region_name='America';
 
select id_bitacora, id_subj_sys,bitacora.id_sistema,dtl.level_coincidence
from tbl_watchlist_bitacora bitacora
natural join tbl_watchlist_bitacora_dtl  dtl
where id_subj_sys=1073014 and trunc(date_trans)=to_date('10-09-15')
order by id_bitacora;
--id_bitacora
--id_subj_sys

@@@@@@@
join using: Mientras natural join realiza en automatico el join, el using hay que especificar explicitamente los nombres de las relaciones
@@@@@@@
select table1.column,table2.column
from table1
join table2 using(join_column1,join_colum2...);

--la relacion en el  join using  se debe hacer de forma explicita
--No se podra usar qualifiers(alias o nombre completo tabla.nombreCampo) en los campos join.
--No se puede usar en conjunto con el natural

select region_name from regions natural joing using (region_id) where country_name='Canada'; --marca error
select country_name from countries join regions on (countries.region_id=regions.region_id) where region_name='Americas'; 

select id_bitacora id, id_subj_sys person ,bitacora.id_sistema,dtl.level_coincidence
from tbl_watchlist_bitacora bitacora
join tbl_watchlist_bitacora_dtl  dtl 
using (id_bitacora,id_subj_sys)
where id_subj_sys=1073014 and trunc(date_trans)=to_date('10-09-15')
order by id;

@@@@@@@
join on: Es una forma explicita de realizar el joing de las columnas asi como una forma mas flexible.
@@@@@@@
select table1.column, table2.column
from table1
join table2 on (table1.column_name=table2.column_name);

--Si se podra usar qualifiers(alias o nombre completo tabla.nombreCampo) en los campos join.
--No se puede usar en conjunto con el natural

select * from departments d join employees e on(e.employee_id=d.department_id);
select * from emplloyees e , departments d where e.employee_id=d.department_id;

--union de dos tablas
select bitacora.id_bitacora id , dtl.id_subj_sys id_person ,bitacora.id_sistema,dtl.level_coincidence
from tbl_watchlist_bitacora bitacora
join tbl_watchlist_bitacora_dtl  dtl 
on (bitacora.id_bitacora=dtl.id_bitacora and bitacora.id_subj_sys=dtl.id_subj_sys) --se unen dos columnas
where  bitacora.id_subj_sys=1073014 and trunc(bitacora.date_trans)=to_date('10-09-15')
order by id;

--union de tres tablas
select bitacora.id_bitacora id , dtl.id_subj_sys id_person ,wlista.nomcomp,bitacora.id_sistema,dtl.level_coincidence
from tbl_watchlist_bitacora bitacora
join tbl_watchlist_bitacora_dtl  dtl 
on (bitacora.id_bitacora=dtl.id_bitacora and bitacora.id_subj_sys=dtl.id_subj_sys) --se unen dos columnas
join tbl_watchlist wlista
on (dtl.id_subj_wl= wlista.id_subj_wl)
where  bitacora.id_subj_sys=1073014 and trunc(bitacora.date_trans)=to_date('10-09-15')
order by id;

select bitacora.id_bitacora id , dtl.id_subj_sys person ,bitacora.id_sistema,dtl.level_coincidence
from tbl_watchlist_bitacora bitacora,tbl_watchlist_bitacora_dtl  dtl
where bitacora.id_bitacora=dtl.id_bitacora and  bitacora.id_subj_sys=dtl.id_subj_sys and
bitacora.id_subj_sys=1073014 and trunc(bitacora.date_trans)=to_date('10-09-15')
order by id;

select e.employee_id, e.last_name, j.start_date,e.hire_date, j.end_date, j.job_id previous_job, e.job_id current_job
from job_history j
join employee e
on (j.start_date=e.hire_date)

--union de tres tablas / oracle standar
select bitacora.id_bitacora id , dtl.id_subj_sys person ,wlista.nomcomp,bitacora.id_sistema,dtl.level_coincidence
from tbl_watchlist_bitacora bitacora,tbl_watchlist_bitacora_dtl  dtl, tbl_watchlist wlista
where bitacora.id_bitacora=dtl.id_bitacora and  bitacora.id_subj_sys=dtl.id_subj_sys and dtl.id_subj_wl= wlista.id_subj_wl and
bitacora.id_subj_sys=1073014 and trunc(bitacora.date_trans)=to_date('10-09-15')
order by id;



(55) 11427711 --> Sandra
