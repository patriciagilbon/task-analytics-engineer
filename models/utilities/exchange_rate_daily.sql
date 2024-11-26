select
    t.transaction_at::date as date_day,
    rates.value::float as currency,
    rates.key as exchange_rate
from {{ ref('stg_globepay__transactions') }} as t,
    lateral flatten(input => parse_json(t.transaction_rates)) as rates
where date_day is not null
qualify (
    row_number() over (
        partition by t.transaction_at::date, rates.key order by t.transaction_at desc
    )
) = 1
