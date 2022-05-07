{% set paymente_methods = dbt_utils.get_column_values(
    table = ref('int_order_and_payment'), 
    column = 'payment_method'
    ) 
%}

{% set order_methods = dbt_utils.get_column_values(
    table = ref('int_order_and_payment'), 
    column = 'order_status'
    ) 
%}

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
