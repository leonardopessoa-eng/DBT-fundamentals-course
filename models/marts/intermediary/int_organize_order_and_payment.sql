{% set payment_methods = ['credit_card', 'coupon', 'bank_transfer', 'gift_card'] %}
{% set order_methods = ['placed', 'shipped', 'completed', 'returned', 'return_pending'] %}

with order_and_payment as (

    select 

        *
        
    from {{ref('int_order_and_payment')}}

),

organize_order_payment as (
    
    select

        order_status,
        {% for payment_mode in payment_methods %}
            {%- for order_mode in order_methods -%}
        
        sum((case when (payment_method = '{{ payment_mode }}' and order_status = '{{ order_mode }}') then 1 else 0 end)) as {{ payment_mode }} 
        {% if not loop.last %}
            ,
        {% endif %}    
            {% endfor %}
        {% if not loop.last %}
            ,
        {% endif %}     
        {%- endfor -%}

    from order_and_payment
    group by 1
    
)

select * from organize_order_payment
