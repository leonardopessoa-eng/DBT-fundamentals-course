
-- ESSA MACRO DENTRO DO 'SET' RETORNA UM VETOR COM OS VALORES PRESENTES NA COLUNA.
{% set results_list = dbt_utils.get_column_values(
    table=ref('stg_payment'), 
    column='payment_method') %}

select
order_id,
{% for payment_method in results_list %}
sum(case when payment_method = '{{ payment_method }}' then amount end) as {{ payment_method }}_amount,
{% endfor %}
sum(amount) as total_amount
from {{ ref('stg_payment') }}
group by 1