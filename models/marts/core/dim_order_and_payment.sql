-- ESSA MACRO RETORNA AS COLUNAS EM RELAÇÃO A UM PREFIXO? NÃO FICOU CLARO
{% set column_names = dbt_utils.get_filtered_columns_in_relation(
    from = ref('int_organize_order_and_payment')
    ) 
%}

with organize_order_payment as (

    select 

        *

    from {{ref('int_organize_order_and_payment')}}

),

pensando as (

    select

        order_status,
        (credit_card + credit_card_1) as teste
        -- EM CONSTRUÇÃO. PRECISA CORRIGIR ERRO DO INT_ORGANIZE_ORDER...
        -- VERIFICAR SE ROLA INSERIR A SAÍDA DA MACRO AQUI (COLUMN_NAMES)

    from organize_order_payment

)

select * from pensando