with source as (
    select *
    from {{ source('globepay', 'globepay_chargebacks') }}
),

renamed as (
    select
        external_ref as transaction_id,
        status as chargeback_status,
        source as chargeback_source,
        case when chargeback = true then 1 else 0 end as is_chargeback
    from source
)

select * from renamed
