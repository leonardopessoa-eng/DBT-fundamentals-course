select
    order_date,
from {{ ref('stg_orders') }}
where not(cast(extract(year from order_date) as int) = 2018)