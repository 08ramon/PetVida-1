# seed.sql

```sql
USE petvida;

INSERT INTO especies(nome) VALUES
('Cachorro'),
('Gato'),
('Pássaro'),
('Peixe'),
('Réptil');

INSERT INTO veterinarios(nome, crmv, especialidade, telefone) VALUES
('João Pedro', 'CRMV101', 'Clínico Geral', '71999990001'),
('Amanda Lima', 'CRMV102', 'Cirurgia', '71999990002'),
('Carlos Henrique', 'CRMV103', 'Dermatologia', '71999990003');

INSERT INTO tutores(nome, cpf, email, telefone) VALUES
('Marcos Andrande', '111.111.111-11', 'marcos@gmail.com', '71911110001'),
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
('Rex',1,'Pitbull','2019-06-12',3),
('Nina',2,'Siamês','2022-01-20',4),
('Bolt',1,'Poodle','2020-07-30',5),
('Luna',2,'Angorá','2021-09-15',6),
('Piu',3,'Calopsita','2023-03-10',7),
('Gold',4,'Betta','2022-05-18',8),
('Spike',5,'Iguana','2021-08-01',1),
('Belinha',1,'Bulldog','2020-12-19',2),
('Tom',2,'Maine Coon','2019-11-05',3),
('Fred',3,'Papagaio','2018-04-08',4),
('Bruce',1,'Doberman','2021-02-14',5),
('Kiara',2,'Bengal','2022-06-17',6),
('Dory',4,'Kinguio','2023-01-09',7);
```