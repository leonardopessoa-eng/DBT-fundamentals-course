{% set payment_methods = ['credit_card', 'coupon', 'bank_transfer', 'gift_card'] %}

with payment as (

    select * from {{ ref('stg_payment') }}

),

pivoted as (

    select

        order_id,
        {% for payment_type in payment_methods %}
        sum(case when payment_method = '{{payment_type}}' then amount else 0 end) as {{payment_type}}_amount
        {% if not loop.last %}
            ,
        {% endif %}
        {% endfor %}

    from payment
    where status = 'success'
    group by 1    

)

select * from pivoted