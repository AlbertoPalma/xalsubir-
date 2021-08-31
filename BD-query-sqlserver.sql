.....sqlserver.....

create database xaldigital
use xaldigital

create table aerolineas (
id_aerolinea int not null ,
 nombre_aerolinea varchar(20),
 PRiMARY KEY(id_aerolinea) 
 )

 create table aeropuertos(
 id_aeropuerto int not null ,
 nombre_aeropuerto varchar (20),
 primary key (id_aeropuerto)
 )

 create table movimientos(
 id_movimiento int not null ,
 descripcion varchar (20),
 primary key (id_movimiento)
 )

 create table vuelos (
 id_aerolinea int ,
 id_aeropuerto int ,
 id_movimiento int ,
 dia datetime,
 FOREIGN KEY (id_aerolinea) REFERENCES aerolineas(id_aerolinea),
 FOREIGN KEY (id_aeropuerto) REFERENCES aeropuertos(id_aeropuerto),
 FOREIGN KEY (id_movimiento) REFERENCES movimientos(id_movimiento)
 )



 insert into aerolineas values (1,'Volaris'),(2,'Aeromar'),(3,'Interjet'),(4,'Aeromexico')

 insert into aeropuertos values (1,'Benito Juarez'),(2,'Guanajuato'),(3,'La paz'),(4,'Oaxaca')

 insert into movimientos values (1,'Salida'),(2,'Llegada')

 insert into vuelos values (1,1,1,'2021-05-02'),(2,1,1,'2021-05-02'),(3,2,2,'2021-05-02'),
 (4,3,2,'2021-05-02'),(1,3,2,'2021-05-02'),(2,1,1,'2021-05-02'),(2,3,1,'2021-05-04'),
 (3,4,1,'2021-05-04'),(3,4,1,'2021-05-04')



select  a.nombre_aeropuerto ,count (v.id_movimiento) as moviemintos from aeropuertos a inner join vuelos v
on v.id_aeropuerto=a.id_aeropuerto and YEAR(v.dia)='2021'  group by (a.nombre_aeropuerto)
having COUNT(id_movimiento)= 
(select top 1 count (v.id_movimiento) from aeropuertos a INNER JOIN vuelos v
ON  v.id_aeropuerto=a.id_aeropuerto  group by (a.nombre_aeropuerto) order by count (v.id_movimiento) desc)

select a.nombre_aerolinea, COUNT(v.id_movimiento) as moviminetos  from aerolineas a inner join vuelos v
on a.id_aerolinea=v.id_aerolinea and YEAR(v.dia)='2021' group by (a.nombre_aerolinea) having COUNT(v.id_movimiento) =
(select top 1 COUNT(v.id_movimiento) from aerolineas a inner join vuelos v
on a.id_aerolinea=v.id_aerolinea group by (a.nombre_aerolinea)order by count (v.id_movimiento) desc )


Select count(v.id_movimiento) as vuelos, CONVERT(date,v.dia) as fecha  from vuelos v  group by dia 


select a.nombre_aerolinea, count(v.id_movimiento) as movimientos, CONVERT(date,v.dia) as fecha from aerolineas a INNER JOIN vuelos v 
on v.id_aerolinea=a.id_aerolinea group by (a.nombre_aerolinea),(v.dia) having count(v.id_movimiento)>2;
