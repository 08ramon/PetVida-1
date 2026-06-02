CREATE OR REPLACE VIEW vw_consultas_completas AS
SELECT 
    c.data_hora,
    c.status,
    c.diagnostico,
    c.valor,
    a.nome AS animal,
    e.nome AS especie,
    t.nome AS tutor,
    t.telefone,
    v.nome AS veterinario,
    esp.nome AS especialidade,
    p.forma_pagamento,
    p.status_pagamento
FROM consulta c
INNER JOIN animal a ON c.id_animal = a.id
INNER JOIN especie e ON a.id_especie = e.id
INNER JOIN tutor t ON a.id_tutor = t.id
INNER JOIN veterinario v ON c.id_veterinario = v.id
INNER JOIN especialidade esp ON v.id_especialidade = esp.id
LEFT JOIN pagamento p ON c.id = p.id_consulta;


-- ---------------------------------------------------------------------
-- 2) vw_agenda_hoje
-- Baseada na view anterior, filtrada para o dia atual e ordenada por hora.
-- ---------------------------------------------------------------------
CREATE OR REPLACE VIEW vw_agenda_hoje AS
SELECT 
    TIME(data_hora) AS hora,
    animal,
    especie,
    tutor,
    telefone,
    veterinario,
    status
FROM vw_consultas_completas
WHERE DATE(data_hora) = CURDATE()
ORDER BY hora ASC;


-- ---------------------------------------------------------------------
-- 3) vw_faturamento_mensal
-- Agrupamento por ano, mês e veterinário com contagem e soma financeira.
-- ---------------------------------------------------------------------
CREATE OR REPLACE VIEW vw_faturamento_mensal AS
SELECT 
    YEAR(data_hora) AS ano,
    MONTH(data_hora) AS mes,
    veterinario,
    COUNT(*) AS total_consultas,
    SUM(valor) AS faturamento_bruto
FROM vw_consultas_completas
WHERE status_pagamento = 'Pago' -- Opcional: Garante que só conta o que foi pago
GROUP BY YEAR(data_hora), MONTH(data_hora), veterinario;


-- ---------------------------------------------------------------------
-- 4) vw_animais_detalhados
-- Lista de animais com tutor, espécie e quantidade total de consultas.
-- ---------------------------------------------------------------------
CREATE OR REPLACE VIEW vw_animais_detalhados AS
SELECT 
    a.id AS id_animal,
    a.nome AS animal,
    e.nome AS especie,
    t.nome AS tutor,
    COUNT(c.id) AS total_consultas
FROM animal a
INNER JOIN especie e ON a.id_especie = e.id
INNER JOIN tutor t ON a.id_tutor = t.id
LEFT JOIN consulta c ON a.id = c.id_animal
GROUP BY a.id, a.nome, e.nome, t.nome;


-- ---------------------------------------------------------------------
-- 5) vw_inadimplentes
-- Consultas já concluídas que não possuem registro de pagamento ou estão pendentes.
-- ---------------------------------------------------------------------
CREATE OR REPLACE VIEW vw_inadimplentes AS
SELECT 
    data_hora,
    tutor,
    telefone,
    animal,
    valor,
    status_pagamento
FROM vw_consultas_completas
WHERE status = 'Concluída' 
  AND (status_pagamento = 'Pendente' OR status_pagamento IS NULL);