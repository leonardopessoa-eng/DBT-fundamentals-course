
with payment as (

    select * from {{ref('stg_payment')}}

),

amount_individual as (

    select

        payment_method,
        sum(amount) as total_amount
        -- COMO RETORNAR O PERCENTUAL EM OUTRA COLUNA
        -- BASEADO NO total_amount ???

    from payment
    where status = 'success'
    group by payment_method

)

select * from amount_individual

