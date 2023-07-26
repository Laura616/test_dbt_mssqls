with records as (

    select * from {{ ref('f_sales_records') }}

),

employees as (

    select * from {{ ref('d_sales_employees') }}
),

partners as (

    select * from {{ ref('d_sales_partner') }}
),


final as (

    select  a.id_employee,
            name,
            lastname,
            sum(record) as best_scores,
            a.id_partner,
            partner_name,
            place
    from records a
    left join employees e on e.id_employee = a.id_employee
    left join partners p on p.id_partner = a.id_partner
    group by a.id_employee,
            name,
            lastname,
            a.id_partner,
            partner_name,
            place


)
select * from final