{{ config(
    tags=["emp"]
) }}

select id_employee
from {{ ref('sales_employees') }}
where id_employee < 0