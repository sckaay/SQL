-- Cross join: ligação entre tabelas sem relacionar as chaves (multiplicação de valores das duas tabelas, gerando duplicidades) --
select * from movies as m
	cross join directors as d;

-- Join (Inner join): tudo o que há de comum entre as duas tabelas mescladas --
select * from movies as m
	inner join directors as d on m.director_id = d.id;
    
-- Left join: tudo o que há na tabela da esquerda, assim como, o que tem em comum com a tabela da direira // o que não há de comum com a tabela da esquerda é apresentado como 'null' --
select * from movies as m
	left join directors as d on m.director_id = d.id;
    
-- Right join: tudo o que há na tabela da direita, assim como, o que tem em comum com a tabela da esquerda // o que não há de comum com a tabela da direita é apresentado como 'null' --
select * from movies as m
	right join directors as d on m.director_id = d.id;