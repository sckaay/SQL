select * from medicos;

select nome, idade from medicos;

select * from medicos where codm = 3;

select * from medicos where idade > 30 or especialidade = "pediatria" ;

select distinct (especialidade) from medicos;

select count(codm) from medicos;

select especialidade, count(*) as qtd_medicos from medicos
group by especialidade
order by qtd_medicos;

select * from medicos where cidade = 'Florianopolis' or cidade = 'Blumenal';
    
select * from medicos where cidade in ('Florianopolis', 'Blumenal');

----------------

-- mesclar duas tabelas (MEDICOS e CONSULTAS), sem que hajam duplicidades ('where' faz o relacionamento entre chaves) -- 
select * from medicos as m, consultas as c where m.codm = c.codm;

-- realiza a mesma consulta do código acima, mesclando também a tabela PACIENTES, porém, usando o comando 'join' -- 
select * from medicos as m
    join consultas as c on m.codm = c.codm
    join pacientes as p on p.codp = c.codp
    
-- realiza a união entre as tabelas -- 
select nome, cpf from medicos
union
select nome, cpf from funcionarios;