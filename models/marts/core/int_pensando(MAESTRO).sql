{% set payment_methods = ['credit_card', 'coupon', 'bank_transfer', 'gift_card'] %}
{% set order_methods = ['placed', 'shipped', 'completed', 'returned', 'return_pending'] %}

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

pensando as (

    select 
        
        order_status,
        payment_method

    from orders
    inner join payments
    on payments.order_id = orders.order_id

),

pensando2 as (
    
    select

        order_status,
        {% for payment_mode in payment_methods %}
            {% for order_mode in order_methods %}
        
        (case when (payment_method = '{{ payment_mode }}' and order_status = '{{ order_mode }}') then 1 else 0 end) as {{ payment_mode }}_{{ order_mode }} 
        {% if not loop.last %}
            ,
        {% endif %}    
            {% endfor %}
        {% endfor %}

    from pensando

)

select * from pensando2