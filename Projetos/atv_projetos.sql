-- 1. Liste o nome de cada projeto. Para cada projeto, conte quantas tarefas existem para
-- cada nível de `prioridade` ('Baixa', 'Normal', 'Alta', 'Urgente'). O resultado deve
-- mostrar o nome do projeto e colunas separadas para a contagem de cada 
-- prioridade. Projetos sem tarefas de uma certa prioridade devem mostrar 0.
select p.nome, 
		count(case when t.prioridade = 'Baixa' then 1 end) as baixa,
        count(case when t.prioridade = 'Normal' then 1 end) as normal,
        count(case when t.prioridade = 'Alta' then 1 end) as alta,
        count(case when t.prioridade = 'Urgente' then 1 end) as urgente
	from projetos as p
    left join tarefas as t on p.id = t.id_projeto
    group by p.nome
    order by p.nome;

-- 2. Mostre o nome dos responsáveis e a quantidade de tarefas pelas quais eles são 
-- responsáveis (id_responsavel_tarefa). Liste apenas os responsáveis que têm 3 ou 
-- mais tarefas atribuídas. Ordene do mais atarefado para o menos atarefado.
select r.nome, count(t.id_responsavel_tarefa) as total from responsaveis as r
	join tarefas as t on r.id = t.id_responsavel_tarefa
    group by r.nome
    having count(t.id_responsavel_tarefa) >= 3
    order by total desc;

-- 3. Calcule a "duração percebida" média das tarefas (em dias) para projetos, agrupados 
-- pelo status do projeto ('Pendente', 'Em Andamento', 'Concluído', 'Cancelado'). Para 
-- este exercício, considere a "duração percebida" de uma tarefa como a diferença em 
-- dias entre a data_prevista_entrega da tarefa e a data_inicio do projeto ao qual ela 
-- pertence. Exiba o status do projeto e a respectiva duração percebida média das 
-- tarefas. Arredonde a média para duas casas decimais. Ignore tarefas ou projetos 
-- onde as datas necessárias sejam nulas.
select p.status, round(avg(datediff(t.data_prevista_entrega, p.data_inicio)), 2) as media
	from tarefas as t
    join projetos as p on t.id_projeto = p.id
    where t.data_prevista_entrega is not null and p.data_inicio is not null
    group by p.status;

-- 4. Para cada projeto que esteja atualmente com o status 'Em Andamento', liste o nome 
-- do projeto. Dentro de cada um desses projetos, mostre cada cargo (da tabela 
-- Responsaveis) dos responsáveis que possuem tarefas atribuídas nesse projeto
-- específico, e o número de tarefas que responsáveis com aquele cargo têm nesse 
-- projeto. Ordene os resultados pelo nome do projeto e, em seguida, pelo nome do 
-- cargo. Só inclua cargos que efetivamente tenham tarefas no respectivo projeto. 
select p.nome, r.cargo, count(*) as total from projetos as p
	join tarefas as t on t.id_projeto = p.id
    join responsaveis as r on t.id_responsavel_tarefa = r.id
    where p.status = 'Em Andamento'
    group by p.nome, r.cargo
    order by p.nome, r.cargo;

-- 5. Gere um ranking com os Top 5 projetos com mais tarefas em atraso.
select id_projeto, count(*) as tarefas_em_atraso from tarefas
	where data_prevista_entrega < curdate() and status not in ('Concluída')
    group by id_projeto
    order by tarefas_em_atraso desc
    limit 5;

-- 6. Verifique quais as Tarefas são urgentes/altas e não concluídas
select * from tarefas where prioridade in ('Alta', 'Urgente') and status not in ('Concluída');

-- 7. Listar projetos com uma ou mais tarefas com status 'Pendente'
select p.id, p.nome, count(*) as tarefas_pendentes from projetos as p
	join tarefas as t on t.id_projeto = p.id
    where t.status = 'Pendente'
    group by p.id, p.nome
    order by tarefas_pendentes desc;
