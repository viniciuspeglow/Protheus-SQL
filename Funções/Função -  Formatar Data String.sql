CREATE FUNCTION fn_FormatarData (@DataString VARCHAR(8)) -- Declara uma fun��o chamada FormatarData que recebe um par�metro do tipo VARCHAR(8)
RETURNS VARCHAR(10) -- Define que a fun��o retornar� um valor do tipo VARCHAR(10)
AS
BEGIN
    -- Verifica se o comprimento do par�metro recebido � exatamente 8.
    -- Caso contr�rio, retorna NULL para evitar erros de formata��o.
    IF LEN(@DataString) <> 8
        RETURN NULL;

    -- Formata a string recebida no formato "dd/mm/yyyy".
    -- SUBSTRING � usado para extrair partes espec�ficas da string:
    -- - Os dois �ltimos caracteres (posi��o 7 a 8) correspondem ao dia.
    -- - Os dois caracteres do meio (posi��o 5 a 6) correspondem ao m�s.
    -- - Os primeiros quatro caracteres (posi��o 1 a 4) correspondem ao ano.
    RETURN SUBSTRING(@DataString, 7, 2) + '/' +  -- Extrai o dia e adiciona "/".
           SUBSTRING(@DataString, 5, 2) + '/' +  -- Extrai o m�s e adiciona "/".
           SUBSTRING(@DataString, 1, 4);         -- Extrai o ano.

END;
GO

