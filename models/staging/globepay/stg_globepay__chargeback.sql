with source as (
    select *
    from {{ source('globepay', 'chargeback') }}
),

renamed as (
    select
        ref_id,
        status as chargeback_status,
        source as chargeback_source,
        case when chargeback = true then 1 end as is_chargeback
    from source
)

select * from renamed
