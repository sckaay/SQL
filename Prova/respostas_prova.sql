-- 1 - Liste os cursos e suas ofertas que têm data de início entre 2023-01-01 e 2023-06-30 --
select c.nome, o.data_inicio from curso as c
	join oferta as o on o.id_oferta = c.id_curso
    where o.data_inicio > '2023-01-01' and o.data_inicio < '2023-06-30'
    order by o.data_inicio asc;

-- 2 - Qual é o total de inscrições por tipo de público  alvo? --
select count(u.nome), o.publico_alvo from usuario as u
	join oferta as o on u.id_usuario = o.id_oferta
	group by o.publico_alvo;

-- 3 - Quantas inscrições existem por curso? --
select count(u.nome), c.nome from usuario as u
	join curso as c on u.id_usuario = c.id_curso
	group by c.nome;

-- 4 - Liste os 10 usuários mais recentes que se inscreveram em ofertas. --
select u.nome, i.data_inscricao from inscricao as i
	join usuario as u on u.id_usuario = i.id_inscricao
    order by data_inscricao desc
    limit 10;

-- 5 - Liste os cursos que têm ofertas com inscrições de usuários que
-- nasceram entre 1980 e 2000, e calcule a média de carga horária desses cursos.
-- Além disso, ordene os resultados pela média de carga horária em
-- ordem decrescente e limite a lista aos 5 primeiros cursos
select c.nome, c.carga_horaria, u.nome, u.data_nascimento from curso as c
	join oferta as o on o.id_oferta = c.id_curso
    join inscricao as i on i.id_inscricao = o.id_oferta
    join usuario as u on u.id_usuario = i.id_inscricao
    where u.data_nascimento > '1980-01-01' and u.data_nascimento < '2000-12-31'
    limit 5;
   
-- 6 - Gere o CROSS JOIN das tabelas cursos e ofertas --
select * from curso as c
	cross join oferta as o;
    