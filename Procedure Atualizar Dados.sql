

--- Procedure Atualizar Dados
--- Usei os parâmetros Turma Aluno para atualizar a Turma e IDAluno para identificar o Aluno
--- Usei parâmetros de Email dos responsaveis e o ID_Aluno para identificar os responsaveis
--- Usei os parâmetros Rua, Bairro, Cidade, UF e IDendereço para identificar de qual aluno vai atualizar 

CREATE PROCEDURE ATUALIZAR_DADOS
    @TURMA_ALUNO VARCHAR(5),@IDALUNO INT,
    @EMAIL_PAI VARCHAR(30), @EMAIL_MAE VARCHAR(30), @ID_ALUNO INT,
    @RUA VARCHAR(20), @BAIRRO VARCHAR(20), @CIDADE VARCHAR(10), @UF CHAR(2), @IDENDERECO INT
AS
BEGIN

    UPDATE CADASTRO_ALUNO
    SET TURMA_ALUNO = @TURMA_ALUNO
    WHERE IDALUNO = @IDALUNO
    
    UPDATE CADASTRO_RESPONSAVEL
    SET EMAIL_PAI = @EMAIL_PAI, EMAIL_MAE = @EMAIL_MAE
    WHERE ID_ALUNO = @ID_ALUNO
    
    UPDATE ENDERECO_ALUNO
    SET RUA = @RUA, BAIRRO = @BAIRRO, CIDADE = @CIDADE, UF = @UF
    WHERE IDENDERECO = @IDENDERECO

END;


--- Executar Procedure

BEGIN TRANSACTION
EXEC ATUALIZAR_DADOS'023','23',
    'PEDRO@TESTE.COM','KATIA@TESTE.COM','23',
    'RUA TESTANDO','IPIRANGA','SAO PAULO','SP','23';


ROLLBACK;