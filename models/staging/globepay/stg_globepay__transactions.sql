with source as (
    select *
    from {{ source('globepay', 'transactions') }}
),

renamed as (
    select
        external_ref as transaction_id,
        status as transaction_status,
        source as transaction_source,
        ref as transaction_ref,
        date_time as transaction_at,
        state as transaction_state,
        amount as transaction_amount,
        country as transaction_country,
        currency as transaction_currency,
        rates as transaction_rates,
        case when cvv_provided = true then 1 end as is_cvv_provided
    from source
)

select * from renamed
