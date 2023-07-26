{{ config (
    materialized='incremental',
    unique_key='id'
)}}


with orders as (

    select *  from {{ ref('f_order_details') }}
    {% if is_incremental() %}
    where updated_at >= (select max(updated_at) from {{ this }})
    --preveri katere vrstice so bila nazadnje posodobljene
    {% endif %}
)

select * from orders
