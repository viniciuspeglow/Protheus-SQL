CREATE FUNCTION fn_FormatarData (@DataString VARCHAR(8)) -- Declara uma função chamada FormatarData que recebe um parâmetro do tipo VARCHAR(8)
RETURNS VARCHAR(10) -- Define que a função retornará um valor do tipo VARCHAR(10)
AS
BEGIN
    -- Verifica se o comprimento do parâmetro recebido é exatamente 8.
    -- Caso contrário, retorna NULL para evitar erros de formatação.
    IF LEN(@DataString) <> 8
        RETURN NULL;

    -- Formata a string recebida no formato "dd/mm/yyyy".
    -- SUBSTRING é usado para extrair partes específicas da string:
    -- - Os dois últimos caracteres (posição 7 a 8) correspondem ao dia.
    -- - Os dois caracteres do meio (posição 5 a 6) correspondem ao mês.
    -- - Os primeiros quatro caracteres (posição 1 a 4) correspondem ao ano.
    RETURN SUBSTRING(@DataString, 7, 2) + '/' +  -- Extrai o dia e adiciona "/".
           SUBSTRING(@DataString, 5, 2) + '/' +  -- Extrai o mês e adiciona "/".
           SUBSTRING(@DataString, 1, 4);         -- Extrai o ano.

END;
GO

