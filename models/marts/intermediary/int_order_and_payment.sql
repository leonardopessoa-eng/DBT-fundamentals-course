with orders as (

    select 

        order_id,
        status as order_status

    from {{ref('stg_orders')}}

),

payments as (

    select 

        order_id,
        payment_method,

    from {{ref('stg_payment')}}
    
),

order_and_payment as (

    select 
        
        order_status,
        payment_method

    from orders
    inner join payments
    on payments.order_id = orders.order_id

)

select * from order_and_payment
