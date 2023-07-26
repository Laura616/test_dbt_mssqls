
with final as (

    select
        id as payment_id,
        amount as amount_cents,
        {{ euro_to_dollars('amount',2) }} as amount_usd
    from {{ ref('t_payments') }}

)

select * from final