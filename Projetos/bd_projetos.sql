CREATE DATABASE projetos;
USE projetos;

-- Tabela para armazenar os Responsáveis
CREATE TABLE Responsaveis (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    cargo VARCHAR(100),
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabela para armazenar os Projetos
CREATE TABLE Projetos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    data_inicio DATE,
    data_prevista_termino DATE,
    status VARCHAR(50) DEFAULT 'Pendente', -- Ex: Pendente, Em Andamento, Concluído, Cancelado
    id_responsavel_projeto INT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_responsavel_projeto) REFERENCES Responsaveis(id)
        ON DELETE SET NULL -- Se o responsável for deletado, o projeto fica sem responsável (ou pode ser RESTRICT)
        ON UPDATE CASCADE -- Se o id do responsável mudar, atualiza aqui
);

-- Tabela para armazenar as Tarefas
CREATE TABLE Tarefas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_projeto INT NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT,
    data_prevista_entrega DATE,
    prioridade VARCHAR(50) DEFAULT 'Normal', -- Ex: Baixa, Normal, Alta, Urgente
    status VARCHAR(50) DEFAULT 'Pendente', -- Ex: Pendente, Em Andamento, Concluída, Bloqueada
    id_responsavel_tarefa INT, -- Responsável específico pela tarefa (pode ser diferente do responsável do projeto)
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_projeto) REFERENCES Projetos(id)
        ON DELETE CASCADE -- Se o projeto for deletado, suas tarefas também são
        ON UPDATE CASCADE,
    FOREIGN KEY (id_responsavel_tarefa) REFERENCES Responsaveis(id)
        ON DELETE SET NULL -- Se o responsável pela tarefa for deletado, a tarefa fica sem responsável
        ON UPDATE CASCADE
);


-- Inserindo 40 Responsáveis
INSERT INTO Responsaveis (id, nome, email, cargo) VALUES
(1, 'Ana Silva', 'ana.silva@example.com', 'Gerente de Projetos Sênior'),
(2, 'Bruno Costa', 'bruno.costa@example.com', 'Desenvolvedor Full Stack Pleno'),
(3, 'Carla Dias', 'carla.dias@example.com', 'Analista de QA'),
(4, 'Daniel Faria', 'daniel.faria@example.com', 'Desenvolvedor Backend Sênior'),
(5, 'Elisa Gomes', 'elisa.gomes@example.com', 'Designer UX/UI'),
(6, 'Fernando Lima', 'fernando.lima@example.com', 'Product Owner'),
(7, 'Gabriela Alves', 'gabriela.alves@example.com', 'Scrum Master'),
(8, 'Hugo Martins', 'hugo.martins@example.com', 'Desenvolvedor Frontend Júnior'),
(9, 'Isabela Nogueira', 'isabela.nogueira@example.com', 'Analista de Negócios'),
(10, 'João Pereira', 'joao.pereira@example.com', 'Arquiteto de Software'),
(11, 'Karina Oliveira', 'karina.oliveira@example.com', 'Desenvolvedora Mobile Pleno'),
(12, 'Lucas Souza', 'lucas.souza@example.com', 'Engenheiro DevOps'),
(13, 'Mariana Ribeiro', 'mariana.ribeiro@example.com', 'Gerente de Projetos Pleno'),
(14, 'Nícolas Antunes', 'nicolas.antunes@example.com', 'Desenvolvedor Backend Júnior'),
(15, 'Olívia Barros', 'olivia.barros@example.com', 'Analista de Dados'),
(16, 'Paulo Castro', 'paulo.castro@example.com', 'Desenvolvedor Full Stack Sênior'),
(17, 'Quintino Damasceno', 'quintino.damasceno@example.com', 'Especialista em Segurança'),
(18, 'Rafaela Esteves', 'rafaela.esteves@example.com', 'Designer Gráfico'),
(19, 'Samuel Ferreira', 'samuel.ferreira@example.com', 'Analista de Sistemas'),
(20, 'Tatiana Guedes', 'tatiana.guedes@example.com', 'Coordenadora de TI'),
(21, 'Ulisses Henriques', 'ulisses.henriques@example.com', 'Desenvolvedor Frontend Pleno'),
(22, 'Vanessa Ibanez', 'vanessa.ibanez@example.com', 'Analista de Suporte Técnico'),
(23, 'Wagner Justino', 'wagner.justino@example.com', 'Consultor de BI'),
(24, 'Xênia Lacerda', 'xenia.lacerda@example.com', 'Gerente de Produto'),
(25, 'Yasmin Macedo', 'yasmin.macedo@example.com', 'Desenvolvedora Full Stack Júnior'),
(26, 'Zacarias Neves', 'zacarias.neves@example.com', 'Engenheiro de Software'),
(27, 'Amanda Orlanda', 'amanda.orlanda@example.com', 'Tech Lead'),
(28, 'Bernardo Pires', 'bernardo.pires@example.com', 'Analista de Requisitos'),
(29, 'Clara Queiroz', 'clara.queiroz@example.com', 'Desenvolvedora Backend Pleno'),
(30, 'Davi Sampaio', 'davi.sampaio@example.com', 'Especialista Cloud'),
(31, 'Ester Rocha', 'ester.rocha@example.com', 'Gerente de Contas'),
(32, 'Fábio Tamoio', 'fabio.tamoio@example.com', 'Desenvolvedor Mobile Sênior'),
(33, 'Giovana Uchoa', 'giovana.uchoa@example.com', 'Analista de Marketing Digital'),
(34, 'Heitor Viana', 'heitor.viana@example.com', 'Desenvolvedor Full Stack Pleno'),
(35, 'Íris Watanabe', 'iris.watanabe@example.com', 'Analista Financeiro'),
(36, 'Júlio Xavier', 'julio.xavier@example.com', 'CEO'),
(37, 'Laura Yamashita', 'laura.yamashita@example.com', 'Diretora de Operações'),
(38, 'Miguel Zimbres', 'miguel.zimbres@example.com', 'CTO'),
(39, 'Natália Abreu', 'natalia.abreu@example.com', 'Head de Produto'),
(40, 'Otávio Bastos', 'otavio.bastos@example.com', 'Gerente de Inovação');

-- Inserindo 40 Projetos
INSERT INTO Projetos (id, nome, descricao, data_inicio, data_prevista_termino, status, id_responsavel_projeto) VALUES
(1, 'Sistema de Gestão Alpha', 'Desenvolvimento do novo sistema de gestão interna.', '2024-01-15', '2024-12-20', 'Em Andamento', 1),
(2, 'Aplicativo Mobile Beta', 'Criação do aplicativo mobile para clientes.', '2024-03-01', '2025-02-28', 'Em Andamento', 13),
(3, 'Plataforma E-commerce Gamma', 'Implementação da nova plataforma de vendas online.', '2023-11-01', '2024-09-30', 'Concluído', 6),
(4, 'Otimização de Performance Delta', 'Melhoria de performance dos servidores atuais.', '2024-05-10', '2024-08-15', 'Pendente', 12),
(5, 'Migração Cloud Epsilon', 'Migração da infraestrutura para a nuvem.', '2024-02-20', '2024-11-30', 'Em Andamento', 10),
(6, 'Atualização Legado Zeta', 'Modernização de sistema legado crítico.', '2025-01-05', '2025-12-05', 'Pendente', 16),
(7, 'Pesquisa de Mercado Eta', 'Análise de novas oportunidades de mercado.', '2024-04-01', '2024-07-31', 'Concluído', 9),
(8, 'Criação Portal Theta', 'Desenvolvimento do novo portal do cliente.', '2024-06-01', '2025-03-31', 'Em Andamento', 5),
(9, 'Reestruturação BD Iota', 'Otimização e reestruturação do banco de dados principal.', '2024-07-15', '2024-10-15', 'Pendente', 4),
(10, 'Integração API Kappa', 'Desenvolvimento de API para integração com parceiros.', '2023-10-01', '2024-05-30', 'Concluído', 2),
(11, 'Ferramenta de Análise Lambda', 'Criação de uma ferramenta interna para análise de dados.', '2024-08-01', '2025-01-31', 'Pendente', 15),
(12, 'Dashboard Gerencial Mu', 'Desenvolvimento de dashboards para a diretoria.', '2024-03-10', '2024-06-20', 'Concluído', 23),
(13, 'Processo de Onboarding Nu', 'Melhoria do processo de onboarding de novos clientes.', '2024-09-01', '2024-12-01', 'Pendente', 7),
(14, 'Sistema de Vendas Xi', 'Novo sistema para a equipe de vendas.', '2025-02-01', '2025-10-30', 'Pendente', 24),
(15, 'Marketing Digital Omicron', 'Campanha de marketing para novo produto.', '2024-05-01', '2024-09-01', 'Em Andamento', 33),
(16, 'Recursos Humanos Pi', 'Implementação de novo software de RH.', '2023-09-15', '2024-04-15', 'Concluído', 20),
(17, 'Financeiro Integrado Rho', 'Integração de sistemas financeiros.', '2024-07-01', '2025-05-01', 'Em Andamento', 35),
(18, 'Operações Logísticas Sigma', 'Otimização da cadeia logística.', '2024-10-01', '2025-06-30', 'Pendente', 37),
(19, 'Inovação Tecnológica Tau', 'Projeto de pesquisa e desenvolvimento de novas tecnologias.', '2024-01-20', '2025-01-20', 'Em Andamento', 40),
(20, 'App Interno Upsilon', 'Aplicativo para comunicação interna da empresa.', '2024-06-15', '2024-11-15', 'Pendente', 39),
(21, 'Segurança da Informação Phi', 'Projeto para reforçar a segurança dos dados.', '2024-03-01', '2024-08-31', 'Em Andamento', 17),
(22, 'Consultoria Externa Chi', 'Projeto de consultoria para otimização de processos.', '2024-02-01', '2024-05-01', 'Concluído', 1),
(23, 'Treinamento Corporativo Psi', 'Desenvolvimento de plataforma de treinamento.', '2024-08-10', '2025-02-10', 'Pendente', 7),
(24, 'Website Institucional Omega', 'Reformulação completa do website da empresa.', '2023-12-01', '2024-06-30', 'Concluído', 5),
(25, 'Módulo de Relatórios Astra', 'Criação de um novo módulo de relatórios para o sistema X.', '2024-09-05', '2025-01-05', 'Pendente', 15),
(26, 'Plataforma de IoT Boreal', 'Desenvolvimento de uma plataforma para dispositivos IoT.', '2025-03-01', '2026-03-01', 'Pendente', 10),
(27, 'Análise Preditiva Corvus', 'Implementação de modelos de análise preditiva.', '2024-07-20', '2024-12-20', 'Em Andamento', 23),
(28, 'Sistema de Suporte Draco', 'Novo sistema de tickets para suporte ao cliente.', '2024-04-15', '2024-10-15', 'Em Andamento', 22),
(29, 'Automação de Testes Eridanus', 'Implementação de automação nos testes de software.', '2023-11-10', '2024-05-10', 'Concluído', 3),
(30, 'Gamificação Interna Fornax', 'Projeto para gamificar processos internos e engajamento.', '2024-10-01', '2025-04-01', 'Pendente', 33),
(31, 'Expansão Internacional Grus', 'Estudo de viabilidade para expansão internacional.', '2025-01-15', '2025-07-15', 'Pendente', 36),
(32, 'Otimização SEO Hydra', 'Projeto para melhorar o ranking do site nos buscadores.', '2024-05-20', '2024-08-20', 'Em Andamento', 24),
(33, 'Marketplace Indus', 'Criação de uma plataforma de marketplace.', '2024-11-01', '2025-11-01', 'Pendente', 6),
(34, 'Rebranding Lyra', 'Projeto de rebranding da marca.', '2024-02-01', '2024-07-01', 'Concluído', 18),
(35, 'App de Realidade Aumentada Mensa', 'Desenvolvimento de um app com funcionalidades de RA.', '2025-04-01', '2025-12-01', 'Pendente', 11),
(36, 'Inteligência Artificial Orion', 'Implementação de IA para atendimento ao cliente.', '2024-06-01', '2025-02-01', 'Em Andamento', 38),
(37, 'Rede Social Corporativa Pavo', 'Criação de uma rede social para os colaboradores.', '2024-09-10', '2025-03-10', 'Pendente', 39),
(38, 'Análise de Sentimento Phoenix', 'Ferramenta para analisar sentimento em redes sociais.', '2023-10-15', '2024-03-15', 'Concluído', 9),
(39, 'Plano de Continuidade Pictor', 'Desenvolvimento do plano de continuidade de negócios.', '2024-07-01', '2024-11-01', 'Em Andamento', 17),
(40, 'Adoção de Metodologia Ágil Vela', 'Implementação de metodologias ágeis em toda a empresa.', '2024-01-01', '2024-06-01', 'Concluído', 7);

-- Inserindo 40 Tarefas
INSERT INTO Tarefas (id, id_projeto, titulo, descricao, data_prevista_entrega, prioridade, status, id_responsavel_tarefa) VALUES
(1, 1, 'Levantamento de Requisitos Alpha', 'Coletar todos os requisitos funcionais e não funcionais.', '2024-02-15', 'Alta', 'Concluída', 9),
(2, 1, 'Design da Arquitetura Alpha', 'Definir a arquitetura do novo sistema.', '2024-03-30', 'Alta', 'Em Andamento', 10),
(3, 2, 'Criação Mockups App Beta', 'Desenvolver os mockups e protótipos das telas.', '2024-04-15', 'Alta', 'Concluída', 5),
(4, 2, 'Desenvolvimento Backend App Beta', 'Implementar os serviços de backend para o app.', '2024-08-30', 'Alta', 'Em Andamento', 4),
(5, 3, 'Configuração Ambiente E-commerce', 'Preparar o ambiente de desenvolvimento e produção.', '2023-12-01', 'Alta', 'Concluída', 12),
(6, 3, 'Cadastro de Produtos Iniciais', 'Incluir os primeiros 100 produtos na plataforma.', '2024-01-15', 'Média', 'Concluída', 6),
(7, 4, 'Análise de Gargalos Performance', 'Identificar os principais pontos de lentidão.', '2024-06-10', 'Urgente', 'Em Andamento', 16),
(8, 5, 'Planejamento Migração Cloud', 'Definir o plano detalhado de migração.', '2024-03-20', 'Alta', 'Concluída', 10),
(9, 5, 'Execução Migração Servidores DB', 'Migrar os bancos de dados para a nuvem.', '2024-07-15', 'Alta', 'Em Andamento', 12),
(10, 6, 'Mapeamento Funcionalidades Legado', 'Documentar todas as funcionalidades do sistema atual.', '2025-02-28', 'Alta', 'Pendente', 19),
(11, 7, 'Coleta de Dados de Concorrentes', 'Pesquisar informações sobre principais concorrentes.', '2024-05-01', 'Média', 'Concluída', 9),
(12, 8, 'Definição User Stories Portal', 'Criar as histórias de usuário para o portal.', '2024-07-01', 'Alta', 'Em Andamento', 6),
(13, 8, 'Desenvolvimento Frontend Portal', 'Codificar a interface do usuário do portal.', '2024-10-30', 'Alta', 'Pendente', 8),
(14, 9, 'Análise Estrutura Atual BD', 'Avaliar a estrutura existente e identificar problemas.', '2024-08-15', 'Alta', 'Pendente', 4),
(15, 10, 'Especificação Endpoints API', 'Definir os contratos dos endpoints da API Kappa.', '2023-11-15', 'Alta', 'Concluída', 2),
(16, 10, 'Testes de Integração API', 'Realizar testes de integração com um parceiro piloto.', '2024-04-30', 'Média', 'Concluída', 3),
(17, 11, 'Definição Métricas Análise', 'Escolher as métricas chave para a ferramenta Lambda.', '2024-09-01', 'Alta', 'Pendente', 15),
(18, 12, 'Desenvolvimento Dash Vendas', 'Criar o dashboard de acompanhamento de vendas.', '2024-04-30', 'Alta', 'Concluída', 23),
(19, 13, 'Mapeamento Processo Onboarding Atual', 'Analisar o fluxo atual de onboarding.', '2024-09-30', 'Média', 'Pendente', 7),
(20, 14, 'Protótipo Telas Sistema Vendas', 'Criar protótipo navegável do novo sistema.', '2025-04-01', 'Alta', 'Pendente', 5),
(21, 15, 'Criação Conteúdo Campanha', 'Produzir textos e imagens para a campanha Omicron.', '2024-06-15', 'Alta', 'Em Andamento', 18),
(22, 16, 'Treinamento Usuários RH', 'Capacitar os usuários chave do novo software de RH.', '2024-03-30', 'Média', 'Concluída', 20),
(23, 17, 'Desenvolvimento Módulo Conciliação', 'Implementar o módulo de conciliação financeira.', '2024-11-30', 'Alta', 'Em Andamento', 34),
(24, 18, 'Otimização Rotas de Entrega', 'Analisar e propor otimizações para as rotas.', '2025-01-15', 'Alta', 'Pendente', 37),
(25, 19, 'Estudo de Viabilidade Blockchain', 'Pesquisar a aplicação de blockchain nos processos.', '2024-06-30', 'Média', 'Em Andamento', 40),
(26, 20, 'Desenvolvimento Chat App Interno', 'Implementar funcionalidade de chat no app Upsilon.', '2024-08-15', 'Alta', 'Pendente', 11),
(27, 21, 'Teste de Penetração', 'Realizar testes de invasão nos sistemas críticos.', '2024-07-01', 'Urgente', 'Em Andamento', 17),
(28, 22, 'Relatório Final Consultoria', 'Entrega do relatório com as recomendações.', '2024-04-25', 'Alta', 'Concluída', 1),
(29, 23, 'Produção Conteúdo Treinamento Psi', 'Criar os materiais didáticos para a plataforma.', '2024-11-10', 'Média', 'Pendente', 7),
(30, 24, 'Migração Conteúdo Website Omega', 'Transferir conteúdo do site antigo para o novo.', '2024-03-01', 'Baixa', 'Concluída', 21),
(31, 25, 'Definição Layout Relatórios Astra', 'Desenhar o layout dos novos relatórios.', '2024-10-05', 'Média', 'Pendente', 15),
(32, 26, 'Seleção Sensores IoT Boreal', 'Escolher os sensores adequados para o projeto.', '2025-05-01', 'Alta', 'Pendente', 10),
(33, 27, 'Coleta e Limpeza de Dados Corvus', 'Preparar os dados para os modelos preditivos.', '2024-09-20', 'Alta', 'Em Andamento', 23),
(34, 28, 'Configuração Base de Conhecimento Draco', 'Alimentar a base de conhecimento do sistema.', '2024-07-15', 'Média', 'Em Andamento', 22),
(35, 29, 'Criação Scripts Teste UI Eridanus', 'Desenvolver scripts para testes automatizados de interface.', '2024-02-10', 'Alta', 'Concluída', 3),
(36, 30, 'Definição Regras Gamificação Fornax', 'Estabelecer as regras e recompensas do sistema.', '2024-12-01', 'Média', 'Pendente', 33),
(37, 31, 'Análise Legal Países Alvo Grus', 'Verificar aspectos legais para expansão.', '2025-04-15', 'Alta', 'Pendente', 36),
(38, 32, 'Pesquisa Palavras-chave Hydra', 'Identificar palavras-chave relevantes para SEO.', '2024-06-20', 'Alta', 'Em Andamento', 24),
(39, 36, 'Treinamento Modelo IA Orion', 'Treinar o modelo de inteligência artificial com dados históricos.', '2024-10-01', 'Alta', 'Em Andamento', 38),
(40, 40, 'Workshop Metodologias Ágeis Vela', 'Realizar workshops introdutórios para as equipes.', '2024-02-01', 'Alta', 'Concluída', 7);
