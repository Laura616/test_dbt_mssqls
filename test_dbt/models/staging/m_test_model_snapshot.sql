select id :: text as id,
       status :: text as status,
       updated_at :: text as updated_at
       from  {{ source('example_data', 'f_order_details') }}