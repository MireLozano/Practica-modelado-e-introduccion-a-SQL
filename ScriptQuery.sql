-- CONSULTA MODELO ENTIDAD RELACIÓN --

----------------------------------------------------------------

-- CREAR UNA CONSULTA SQL PARA SACAR EL SIGUIENTE LISTADO: --
 
-- Nombre modelo  
-- Nombre marca 
-- Nombre grupo empresarial  
-- Fecha de compra 
-- Matrícula 
-- Color del coche 
-- Total kilometros 
-- Nombre aseguradora 
-- Numero de poliza 

----------------------------------------------------------------


---- revisamos los datos -----



select fecha_compra, km_total, matricula ,id_modelo , id_color  
from mireia_hernandez.coches c ;

select marca 
from mireia_hernandez.marcas m ;

select nombre  
from mireia_hernandez.gruposempresariales g ;

select aseguradora 
from mireia_hernandez.aseguradoras a ;

select numero_poliza 
from mireia_hernandez.polizas p ;





-------- hacemos la petición ----- 
 	  
 	  
 select fecha_compra, km_total, marca, nombre, aseguradora, numero_poliza, modelo, color 
from mireia_hernandez.coches c	, mireia_hernandez.marcas m , mireia_hernandez.gruposempresariales g 
, mireia_hernandez.aseguradoras a , mireia_hernandez.polizas p , mireia_hernandez.modelos m2, mireia_hernandez.colores c2  
 	  	  







 	  
 	  
 	  
 	  
 	  
 	  
 	
 
 
 
 
 