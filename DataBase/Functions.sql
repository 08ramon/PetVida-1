USE petvida;

DELIMITER $$


CREATE FUNCTION fn_idade_animal(data_nascimento DATE)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE anos INT;
    DECLARE meses INT;

    SET anos = TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE());
    SET meses = TIMESTAMPDIFF(MONTH, data_nascimento, CURDATE()) MOD 12;

    RETURN CONCAT(anos, ' anos e ', meses, ' meses');
END$$


CREATE FUNCTION fn_total_gasto_tutor(p_tutor_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT IFNULL(SUM(c.valor), 0)
    INTO total
    FROM consultas c
    INNER JOIN animais a ON c.animal_id = a.id
    WHERE a.tutor_id = p_tutor_id
      AND c.status <> 'cancelada';

    RETURN total;
END$$


CREATE FUNCTION fn_qtd_consultas_animal(p_animal_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE qtd INT;

    SELECT COUNT(*)
    INTO qtd
    FROM consultas
    WHERE animal_id = p_animal_id;

    RETURN qtd;
END$$


CREATE FUNCTION fn_status_emoji(p_status VARCHAR(30))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    RETURN CASE
        WHEN p_status = 'agendada' THEN '📅 Agendada'
        WHEN p_status = 'concluida' THEN '✅ Concluída'
        WHEN p_status = 'cancelada' THEN '❌ Cancelada'
        WHEN p_status = 'em_atendimento' THEN '🏥 Em Atendimento'
        ELSE 'Status desconhecido'
    END;
END$$

CREATE FUNCTION fn_classificar_valor(p_valor DECIMAL(10,2))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    RETURN CASE
        WHEN p_valor < 100 THEN 'Consulta Simples'
        WHEN p_valor BETWEEN 100 AND 300 THEN 'Consulta Padrão'
        ELSE 'Procedimento Especial'
    END;
END$$

DELIMITER ;