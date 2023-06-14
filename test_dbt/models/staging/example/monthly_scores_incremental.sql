{{ config (
    materialized='incremental',
    unique_key='id'
)}}


with orders as (

    select *  from {{ ref('order_details') }}
    {% if is_incremental() %}
    where updated_at >= (select max(updated_at) from {{ this }})
    {% endif %}
)

select * from orders
