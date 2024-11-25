with source as (
    select *
    from {{ source('globepay', 'acceptance') }}
),

renamed as (
    select
        ref_id,
        status as acceptance_status,
        source as acceptance_source,
        ref as acceptance_ref,
        date_time as acceptance_at,
        state as acceptance_state,
        amount as acceptance_amount,
        country as acceptance_country,
        currency as acceptance_currency,
        rates as acceptance_rates,
        case when cvv_provided = true then 1 end as is_cvv_provided
    from source
)

select * from renamed
