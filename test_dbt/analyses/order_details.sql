

with order_details as (

  select *
  from {{ ref('order_details') }}

), employees as (

  select *
  from {{ ref('sales_employees') }}

), partners as (

    select * from {{ ref('sales_partner') }}

)


select
  id as order_id,
  status,
  updated_at,
  a.id_employee,
  name,
  lastname,
  a.id_partner,
  partner_name,
  place
from order_details a
left join employees e on e.id_employee = a.id_employee
left join partners p on p.id_partner = a.id_partner