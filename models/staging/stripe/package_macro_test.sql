-- Como rodar uma macro independente?
/*
{{ dbt_utils.datediff("'2018-01-01'", "'2018-01-20'", 'day') }}


with payments as (

    select 
        
        --{{ dbt_utils.last_day(date, datepart) }}
        {{ dbt_utils.last_day(created_at, month) }}

    from {{ref('stg_payment')}}

)

--{{ dbt_utils.last_day(date, datepart) }}

select * from payments
*/

{{ config (
    materialized="table"
)}}

{{ dbt_utils.date_spine(
    datepart="day",
    start_date="cast('2020-01-01' as date)",
    end_date="cast('2021-01-01' as date)"
   )
}}



