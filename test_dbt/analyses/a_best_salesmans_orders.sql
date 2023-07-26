

with order_details as (

  select *
  from {{ ref('f_order_details') }}

), employees as (

  select *
  from {{ ref('d_sales_employees') }}

), partners as (

    select * from {{ ref('d_sales_partner') }}

), final as (


select
  id as order_id,
  status,
  updated_at,
  a.id_employee,
  name,
  lastname,
  a.id_partner,
  partner_name,
  place,
  e.name = '{{ var("current_best_salesman") }}' as best_salesman
from order_details a
left join employees e on e.id_employee = a.id_employee
left join partners p on p.id_partner = a.id_partner


)

select * from final where best_salesman = true
