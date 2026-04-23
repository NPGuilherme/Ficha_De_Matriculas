

--- Rollback - Commit

--- Comando TCL Transact Control Language(Linguagem de Controle de Transação)
--- Permitem que a Gente Controle as Transações DML (Insert, Update, Delete)

--- UPDATE
--- Iniciar com comando(Begin Transaction) para realizar um UPDATE seguro, assim posso revisar antes de se tornar definitivo

BEGIN TRANSACTION
UPDATE CADASTRO_ALUNO
SET SEXO = 'FEMININO'
WHERE IDALUNO = 1;

--- Rollback - Server para Desfazer a Transação atual no Banco de Dados 

ROLLBACK TRANSACTION

--- UPDATE
--- Iniciar com comando(Begin Transaction) para realizar um UPDATE seguro, assim posso revisar antes de se tornar definitivo

BEGIN TRANSACTION
UPDATE CADASTRO_ALUNO
SET SEXO = 'FEMININO'
WHERE IDALUNO = 1;

--- Commit - Confirma todas as Alterações feitas na Transação atual no Banco de Dados
    
COMMIT TRANSACTION;


--- INSERT 
--- Begin Transaction - Rollback Transaction

BEGIN TRANSACTION
EXEC INSERIR_DADOS  'LUARA','FEMININO','2024-02-12','39804471638','BRASILEIRO','1B','029','',
                    'JOAO FRANCA','63176875372','JFRANCA@UOL.COM',
                    'MARCELLI ROSA','51951200318','MARCELLI@UOL.COM',
                    'RUA FRANCISCO ALMEIDA - N:177 ','SANTA CATARINA','SAO PAULO', 'SP',
                    'CEL','993133760';

ROLLBACK TRANSACTION;



--- INSERT
--- Begin Transaction - Commit Transaction 

BEGIN TRANSACTION
EXEC INSERIR_DADOS  'LUARA','F','2024-02-12','39804471638','BRASILEIRO','1B','025','',
                    'JOAO FRANCA','63176875372','JFRANCA@UOL.COM',
                    'MARCELLI ROSA','51951200318','MARCELLI@UOL.COM',
                    'RUA FRANCISCO ALMEIDA - N:177 ','SANTA CATARINA','SAO PAULO', 'SP',
                    'CEL','993133760';

COMMIT TRANSACTION;


--- DELETE
--- Begin Transaction - Rollback Transaction

BEGIN TRANSACTION
DELETE FROM TELEFONE_ALUNO
WHERE IDTELEFONE = 7;

ROLLBACK TRANSACTION;

--- DELETE
--- Begin Transaction - Commit Transaction
 
BEGIN TRANSACTION
DELETE FROM TELEFONE_ALUNO
WHERE IDTELEFONE = 7;


COMMIT TRANSACTION;