with records as (

    select id_employee, substring(sale_date, 4, 2) as sale_month, record, id_partner  from {{ ref('sales_records') }}

),

final as (

    select  id_employee,
            sale_month,
            sum(record) as record,
            id_partner
    from records
    group by id_employee, sale_month, id_partner

)
select * from final