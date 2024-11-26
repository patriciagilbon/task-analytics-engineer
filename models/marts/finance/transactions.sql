with transactions as (
    select *
    from {{ ref('int_transactions_converted_to_usd') }}
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
