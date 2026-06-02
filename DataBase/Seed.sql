USE petvida;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE pagamentos;
TRUNCATE TABLE consultas;
TRUNCATE TABLE animais;
TRUNCATE TABLE tutores;
TRUNCATE TABLE veterinarios;
TRUNCATE TABLE especialidades;
TRUNCATE TABLE especies;
SET FOREIGN_KEY_CHECKS = 1;


INSERT INTO especies(nome) VALUES
('Cachorro'),
('Gato'),
('Pássaro'),
('Peixe'),
('Réptil');


INSERT INTO especialidades(nome) VALUES
('Clínico Geral'),
('Cirurgia'),
('Dermatologia');


INSERT INTO veterinarios(nome, crmv, especialidade_id, telefone) VALUES
('João Pedro', 'CRMV101', 1, '71999990001'), 
('Amanda Lima', 'CRMV102', 2, '71999990002'), 
('Carlos Henrique', 'CRMV103', 3, '71999990003');


INSERT INTO tutores(nome, cpf, email, telefone) VALUES
('Marcos Andrade', '111.111.111-11', 'marcos@gmail.com', '71911110001'),
('Fernanda Souza', '222.222.222-22', 'fernanda@gmail.com', '71911110002'),
('Ricardo Lima', '333.333.333-33', 'ricardo@gmail.com', '71911110003'),
('Juliana Rocha', '444.444.444-44', 'juliana@gmail.com', '71911110004'),
('Pedro Henrique', '555.555.555-55', 'pedro@gmail.com', '71911110005'),
('Camila Alves', '666.666.666-66', 'camila@gmail.com', '71911110006'),
('Thiago Santos', '777.777.777-77', 'thiago@gmail.com', '71911110007'),
('Larissa Costa', '888.888.888-88', 'larissa@gmail.com', '71911110008');


INSERT INTO animais(nome, especie_id, raca, data_nascimento, tutor_id) VALUES
('Thor',1,'Labrador','2020-02-10',1),
('Mia',2,'Persa','2021-04-11',2),
('Marley',1,'Pitbull','2022-02-16',2);