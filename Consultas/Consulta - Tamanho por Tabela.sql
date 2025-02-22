SELECT
    t.NAME AS Entidade,
    p.rows AS Registros,
    
    -- Espa�o Total
    SUM(a.total_pages) * 8 AS EspacoTotalKB,
    SUM(a.total_pages) * 8 / 1024.0 AS EspacoTotalMB,
    SUM(a.total_pages) * 8 / 1024.0 / 1024.0 AS EspacoTotalGB,
    
    -- Espa�o Usado
    SUM(a.used_pages) * 8 AS EspacoUsadoKB,
    SUM(a.used_pages) * 8 / 1024.0 AS EspacoUsadoMB,
    SUM(a.used_pages) * 8 / 1024.0 / 1024.0 AS EspacoUsadoGB,
    
    -- Espa�o N�o Usado
    (SUM(a.total_pages) - SUM(a.used_pages)) * 8 AS EspacoNaoUsadoKB,
    (SUM(a.total_pages) - SUM(a.used_pages)) * 8 / 1024.0 AS EspacoNaoUsadoMB,
    (SUM(a.total_pages) - SUM(a.used_pages)) * 8 / 1024.0 / 1024.0 AS EspacoNaoUsadoGB

FROM
    sys.tables t
INNER JOIN sys.indexes i ON t.OBJECT_ID = i.object_id
INNER JOIN sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
INNER JOIN sys.allocation_units a ON p.partition_id = a.container_id
LEFT OUTER JOIN sys.schemas s ON t.schema_id = s.schema_id
WHERE
    t.NAME NOT LIKE 'dt%'
    AND t.is_ms_shipped = 0
    AND i.OBJECT_ID > 255
GROUP BY
    t.Name, s.Name, p.Rows
ORDER BY
    Registros DESC;
