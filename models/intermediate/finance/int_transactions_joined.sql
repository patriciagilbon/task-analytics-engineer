with transactions as (
    select
        t.transaction_id,
        t.transaction_at,
        t.transaction_country,
        t.transaction_currency,
        t.transaction_amount as original_currency_transaction_amount,
        {{ convert_to_usd(
            't.transaction_amount',
            't.transaction_currency',
            'rates.value'
        ) }} as usd_transaction_amount,
        case when t.transaction_state = 'ACCEPTED' then 1 else 0 end as is_transaction_accepted
    from {{ ref('stg_globepay__transactions') }} as t,
        lateral flatten(input => parse_json(t.transaction_rates)) as rates
    where
        rates.key = t.transaction_currency
),

chargebacks as (
    select
        transaction_id,
        is_chargeback
    from {{ ref('stg_globepay__chargebacks') }}
)

select
    transactions.*,
    chargebacks.is_chargeback
from transactions
left join chargebacks
    on transactions.transaction_id = chargebacks.transaction_id
