-- 1. Crie uma consulta SQL que exiba o nome do participante, o nome do evento e uma coluna chamada status_descricao que deve exibir:
	-- 'Pago' se o status_pagamento for 'pago'
	-- 'Pendente' se o status_pagamento for 'pendente'
	-- 'Cancelado' se o status_pagamento for 'cancelado'
	-- 'Desconhecido' para quaisquer outros valores
select p.nome, e.nome_evento, i.status_pagamento,
	case
		when status_pagamento = 'Pago' then 'pago'
        when status_pagamento = 'Pendente' then 'pendente'
        when status_pagamento = 'Cancelado' then 'cancelado'
        else 'desconhecido'
	end as status_descricao
from inscricoes as i
	join participantes as p on p.id = i.id_participante
    join eventos as e on e.id = i.id_evento;
    
-- 2. Escreva uma consulta que exiba o nome do evento, as datas de início e fim e uma nova coluna chamada classificacao_evento, com base na duração do evento:
	-- 'Evento de 1 dia' se data_inicio for igual a data_fim
    -- 'Evento de Curta Duração' se a diferença for de até 3 dias
	-- 'Evento de Longa Duração' se for mais que 3 dias
select nome_evento, data_inicio, data_fim,
	case
		when data_inicio = data_fim then 'Evento de 1 dia'
        when datediff(data_fim, data_inicio) <= 3 then 'Evento de Curta Duração'
        else 'Evento de Longa Duração'
	end as classificacao_evento
from eventos;

-- 3. Liste todos os participantes com uma coluna extra chamada tipo_participante, que deve conter:
	-- 'Veterano' se a data de inscrição for anterior a 2024
	-- 'Novo' se a inscrição for em 2024 ou posterior
select *,
	case 
		when year(data_inscricao) < 2024 then 'Veterano'
        else 'Novo'
	end as tipo_participante
from participantes;

-- 4. Crie uma consulta que retorne o nome dos organizadores, seus cargos e uma nova coluna chamada funcao, com:
	-- 'Gestor Principal' se o cargo for igual a 'Diretor'
	-- 'Coordenação' se o cargo for 'Coordenador' ou 'Supervisor'
    -- 'Apoio' para todos os outros cargos
select *,
	case
		when cargo = 'Diretor' then 'Gestor Principal'
        when cargo = 'Coordenador' or cargo = 'Supervisor' then 'Coordenação'
        else 'Apoio'
	end as funcao
from organizadores;

-- 5. Crie uma consulta que exiba o nome dos participantes e uma coluna chamada prioridade_contato, que deve mostrar:
	-- 'WhatsApp' se o telefone estiver preenchido (telefone IS NOT NULL)
	-- 'E-mail' se o telefone for NULL e o e-mail estiver preenchido
	-- 'Sem contato disponível' se ambos forem NULL
select nome, telefone, email,
	case
		when telefone is not null then 'WhatsApp'
        when telefone is null and email is not null then 'E-mail'
        else 'Sem contato disponível'
	end as prioridade_contato
from participantes;

-- 6. Liste todos os eventos com nome, tipo e uma nova coluna chamada classificacao_tipo, que mostre:
	-- 'Competição' se o tipo de evento for 'Campeonato', 'Corrida' ou 'Torneio'
	-- 'Formativo' se for 'Oficina', 'Curso' ou 'Palestra'
	-- 'Outro' para qualquer outro tipo
select nome_evento, tipo_evento,
	case
		when tipo_evento = 'Campeonato' or tipo_evento = 'Corrida' or tipo_evento = 'Torneio' then 'Competição'
        when tipo_evento = 'Curso' or tipo_evento = 'Palestra' then 'Formativo'
        else 'Outro'
	end as classificacao_tipo
from eventos;


