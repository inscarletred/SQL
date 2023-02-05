

SELECT secondtest_ddl.modelos.nombremodelo, secondtest_ddl.marcas.nombremarca,
secondtest_ddl.grupo.nombregrupo, secondtest_ddl.vehiculo.idvehiculo, 
secondtest_ddl.vehiculo.matricula, secondtest_ddl.vehiculo.numeropoliza, 
secondtest_ddl.vehiculo.fechacompra, secondtest_ddl.vehiculo.kilometros,
secondtest_ddl.aseguradora.nombreempresa 
FROM secondtest_ddl.modelos
JOIN secondtest_ddl.marcas
ON secondtest_ddl.modelos.idmarca = secondtest_ddl.marcas.idmarca
JOIN secondtest_ddl.grupo
ON secondtest_ddl.marcas.idgrupo = secondtest_ddl.grupo.idgrupo
JOIN secondtest_ddl.vehiculo
ON secondtest_ddl.modelos.idmodelo = secondtest_ddl.vehiculo.idmodelo
join secondtest_ddl.aseguradora 
on secondtest_ddl.vehiculo.idaseguradora = secondtest_ddl.aseguradora.idaseguradora 
where secondtest_ddl.vehiculo.fechabaja is not null;

