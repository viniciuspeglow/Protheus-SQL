EXEC sp_resetstatus 'Nome_Banco_Dados';

ALTER DATABASE Nome_Banco_Dados SET EMERGENCY

DBCC checkdb('Nome_Banco_Dados')

ALTER DATABASE Nome_Banco_Dados SET SINGLE_USER WITH ROLLBACK IMMEDIATE

DBCC CheckDB ('Nome_Banco_Dados', REPAIR_ALLOW_DATA_LOSS)

ALTER DATABASE Nome_Banco_Dados SET MULTI_USER

