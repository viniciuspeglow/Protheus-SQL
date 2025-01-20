-- Cria��o de uma fun��o definida pelo usu�rio chamada fn_FormatarCNPJCPF
-- Esta fun��o recebe um par�metro (@Documento) do tipo NVARCHAR(20)
CREATE FUNCTION fn_FormatarCNPJCPF (@Documento NVARCHAR(20))
RETURNS NVARCHAR(20) -- Especifica que a fun��o retorna um valor do tipo NVARCHAR(20)
AS
BEGIN
    -- Declara uma vari�vel local @Tamanho para armazenar o comprimento do documento
    DECLARE @Tamanho INT

    -- Remove caracteres especiais (pontos, tra�os e barras) do valor recebido
    SET @Documento = REPLACE(REPLACE(REPLACE(@Documento, '.', ''), '-', ''), '/', '')

    -- Calcula o tamanho do documento (quantidade de caracteres ap�s a limpeza)
    SET @Tamanho = LEN(@Documento)

    -- Se o tamanho do documento for 11, trata-se de um CPF
    IF @Tamanho = 11
        -- Retorna o CPF formatado com a m�scara 000.000.000-00
        RETURN FORMAT(CAST(@Documento AS BIGINT), '000\.000\.000\-00')
    
    -- Se o tamanho do documento for 14, trata-se de um CNPJ
    ELSE IF @Tamanho = 14
        -- Retorna o CNPJ formatado com a m�scara 00.000.000/0000-00
        RETURN FORMAT(CAST(@Documento AS BIGINT), '00\.000\.000\/0000\-00')

    -- Se o tamanho for diferente de 11 ou 14, retorna NULL
    -- Isso indica que o valor n�o � um CPF nem um CNPJ v�lido
    RETURN NULL
END
GO
