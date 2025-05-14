-- Exemplo do comando Having -- 
select id_evento, count(*) as qtd from inscricoes 
	group by id_evento having qtd > 1;