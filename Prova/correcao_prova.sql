-- 1 - Liste os cursos e suas ofertas que têm data de início entre 2023-01-01 e 2023-06-30 --
select * from curso as c
	join oferta as o on o.id_curso = c.id_curso
    where o.data_inicio > '2023-01-01' and o.data_inicio < '2023-06-30'
    order by o.data_inicio asc;

-- 2 - Qual é o total de inscrições por tipo de público  alvo? --
select count(*), o.publico_alvo from inscricao as i
	join oferta as o on o.id_oferta = i.id_oferta
	group by o.publico_alvo;

-- 3 - Quantas inscrições existem por curso? --
select count(*), c.id_curso from inscricao as i
	join oferta as o on i.id_oferta = o.id_oferta
    join curso as c on c.id_curso = o.id_curso
	group by c.id_curso;

-- 4 - Liste os 10 usuários mais recentes que se inscreveram em ofertas. --
select * from inscricao as i
    order by i.data_inscricao desc
    limit 10;

-- 5 - Liste os cursos que têm ofertas com inscrições de usuários que
-- nasceram entre 1980 e 2000, e calcule a média de carga horária desses cursos.
-- Além disso, ordene os resultados pela média de carga horária em
-- ordem decrescente e limite a lista aos 5 primeiros cursos
select c.id_curso, avg(c.carga_horaria) as media from curso as c
	join oferta as o on o.id_curso = c.id_curso
    join inscricao as i on i.id_oferta = o.id_oferta
    join usuario as u on u.id_usuario = i.id_usuario
    where u.data_nascimento between '1980-01-01' and '2000-12-31'
    group by c.id_curso
    order by media desc
    limit 5;
   
-- 6 - Gere o CROSS JOIN das tabelas cursos e ofertas --
select * from curso as c
	cross join oferta as o;