


--- PROCEDURE APAGAR DADOS
--- Coloquei quatro parâmetros de entrada do tipo Int, os IDs para identificar quais linhas vão ser excluidas.


CREATE PROC APAGAR_REGISTRO
 @IDRESPONSAVEL INT ,@IDENDERECO INT, 
 @IDTELEFONE INT, @IDALUNO INT
AS
BEGIN
		--- Tabela Cadastro Responsavel
        DELETE FROM CADASTRO_RESPONSAVEL
        WHERE @IDRESPONSAVEL = ID_ALUNO
		
        --- Tabela Endereço Aluno
        DELETE FROM ENDERECO_ALUNO
        WHERE @IDENDERECO = ID_ALUNO
		
		--- Tabela Telefone Aluno
        DELETE FROM TELEFONE_ALUNO
        WHERE @IDTELEFONE = ID_ALUNO

		--- Tabela Cadastro Aluno
        DELETE FROM CADASTRO_ALUNO
        WHERE @IDALUNO = IDALUNO
        
END;




--- Executar Procedure

BEGIN TRAN
EXEC APAGAR_REGISTRO '13','13','13','13';


ROLLBACK;



--- Apagando Procedure


DROP PROC APAGAR_REGISTRO;