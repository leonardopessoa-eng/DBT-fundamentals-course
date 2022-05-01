
-- NÃO VAI RODAR POIS AS TABELAS SÃO DE TAMANHOS DISTINTOS. 
-- MAS FICOU CLARO A IDEIA.

{{ 
    union_tables_by_prefix (
        database = target.database,
        schema = target.schema,
        prefix = 'stg_'
    )
}}
    
