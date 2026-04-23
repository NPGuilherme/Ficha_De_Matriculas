--- Criei uma View(RESUMO_ALUNO) com Inner Join, Left Join e filtrar(Where) por Turma para simplificar as consultas 
--- Nome, Sexo, Turma, e Matricula da Tabela Cadastro Aluno
--- Rua e Bairro da Tabela Endereço Aluno 
--- Número do Telefone da Tabela Telefone Aluno 
--- Nome da Professora da Tabela Funcionario

--- (View Resumo_Aluno_M) Registro do Sexo Masculino

CREATE VIEW RESUMO_ALUNO_M AS
SELECT A.NOME_ALUNO, A.SEXO, A.TURMA_ALUNO, A.MATRICULA,
		E.RUA, E.BAIRRO,
		T.NUMERO
FROM CADASTRO_ALUNO A
LEFT JOIN ENDERECO_ALUNO E
ON A.IDALUNO = E.ID_ALUNO
LEFT JOIN TELEFONE_ALUNO T
ON A.IDALUNO = T.ID_ALUNO
WHERE SEXO = 'MASCULINO';

--- EXECUTAR VIEW RESUMO_ALUNO_M
--- Buscanddo todos registros da View Resumo_Aluno_M da Turma '1C'

SELECT * FROM RESUMO_ALUNO_M
WHERE TURMA_ALUNO = '1C';

--- Atualizei o campo turma aluno usando a View Resumo_Aluno_M

BEGIN TRAN
UPDATE RESUMO_ALUNO_M
SET TURMA_ALUNO = '1F'
WHERE IDALUNO = 10;

COMMIT;


--- (View Resumo_Aluno_F) Registro do Sexo Feminino

CREATE VIEW RESUMO_ALUNO_F AS 
SELECT A.NOME_ALUNO, A.SEXO, A.TURMA_ALUNO, A.MATRICULA,
		E.RUA, E.BAIRRO,
		T.NUMERO
FROM CADASTRO_ALUNO A
LEFT JOIN ENDERECO_ALUNO E
ON A.IDALUNO = E.ID_ALUNO
LEFT JOIN TELEFONE_ALUNO T
ON A.IDALUNO = T.ID_ALUNO
WHERE SEXO = 'FEMININO';


--- EXECUTAR VIEW RESUMO_ALUNO_F
--- Buscanddo todos registros da View Resumo_Aluno_F da Turma '1B'

SELECT * FROM RESUMO_ALUNO_F
WHERE TURMA_ALUNO = '1B';


--- Quero Quantidade de Alunos do Sexo Masculino de cada Turma

CREATE VIEW QNT_TURMA_MASCULINO AS
SELECT SEXO,TURMA_ALUNO, COUNT(*) AS 'QUANTIDADE'
FROM CADASTRO_ALUNO
WHERE SEXO = 'MASCULINO'
GROUP BY SEXO,TURMA_ALUNO;

--- Executar View QNT_TURMA_MASCULINO

SELECT * FROM QNT_TURMA_MASCULINO
WHERE TURMA_ALUNO = '1A';


--- Quero Quantidade de Alunos do Sexo Feminino de cada Turma

CREATE VIEW QNT_TURMA_FEMININO AS
SELECT SEXO,TURMA_ALUNO, COUNT(*) AS 'QUANTIDADE'
FROM CADASTRO_ALUNO
WHERE SEXO = 'FEMININO'
GROUP BY SEXO,TURMA_ALUNO;

--- Executar View QNT_TURMA_FEMININO

SELECT * FROM QNT_TURMA_FEMININO
WHERE TURMA_ALUNO = '1B';




--- Comando para Apagar a View

DROP VIEW QNT_TURMA_FEMININO;