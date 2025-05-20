-- Tabelas Temporárias --
select * 
	from (select * from medicos where especialidade = 'ortopedia') 
	as ortopedistas
join consultas as c on c.codm = ortopedistas.codm;

