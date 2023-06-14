with source_store_codes as (
    select * from {{ source('example_data', 'order_details') }}

),

final as (
    select * from source_store_codes
)

select * from final