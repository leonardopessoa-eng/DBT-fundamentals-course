
with organize_order_payment as (

    select 

        *

    from {{ref('int_organize_order_and_payment')}}

),

pensando as (

    select

        order_status,
        (credit_card + credit_card_1) as teste
        -- EM CONTRUÇÃO. PRECISA CORRIGIR ERRO DO INT_ORGANIZE_ORDER...

    from organize_order_payment

)

select * from pensando