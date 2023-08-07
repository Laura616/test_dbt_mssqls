{{ config(materialized='table', post_hook=["alter table {{ this }} add column message varchar(30)"]
) }}
with final as (

    select
        id as payment_id,
        amount as amount_cents,
        {{ euro_to_dollars('amount',2) }} as amount_usd
    from {{ ref('t_payments') }}

)

select * from final