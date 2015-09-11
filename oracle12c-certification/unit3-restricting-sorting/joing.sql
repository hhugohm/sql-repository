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
3.- selftjoin: Asociar rows con otras rows de la misma tabla.

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

--la relacion en el natural join se debe hacer de forma explicita
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









