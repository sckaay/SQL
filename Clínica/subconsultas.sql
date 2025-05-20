-- Inserts para exemplo --
insert into consultas values 
	(2, 9, now(), now()),
    (4, 13, now(), now());

-- Subconsultas --
select * from pacientes
	where codp in (select distinct codp from consultas as c);