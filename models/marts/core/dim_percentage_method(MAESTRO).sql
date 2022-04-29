
with amount as (

    select * from {{ref('int_amount_payment')}}

),

percentage as (

    select 
    
        total_amount,
        sum(total_amount)/total_amount as final_percentage 
        -- COMO RETORNAR O PERCENTUAL EM OUTRA COLUNA
        -- BASEADO NO total_amount ???
        -- PRECISO AGRUPAR SEMPRE QUANDO SOMO?

    from amount
    group by total_amount

)

select * from percentage

