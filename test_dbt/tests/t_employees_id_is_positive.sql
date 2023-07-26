{{ config(
    tags=["emp"]
) }}

select id_employee
from {{ ref('d_sales_employees') }}
where id_employee < 0