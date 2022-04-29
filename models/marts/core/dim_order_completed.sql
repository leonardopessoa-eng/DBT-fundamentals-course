

with orders as (

    select * from {{ref('stg_orders')}}

),

customers as (

    select * from {{ref('stg_customers')}}

),

order_status as (

    select

        first_name,
        last_name,
        status

    from orders
    inner join customers
    on orders.customer_id = customers.customer_id
    where order_id < 50 and status = 'completed'

)     

select * from order_status

