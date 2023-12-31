{{
    config(
        tags=["special"]
    )
}}


with scores as (

    select *  from {{ ref('m_monthly_scores') }} order by sale_month asc

),

last_month as (

    select
    LAST_VALUE ( sale_month )
    over(
        ORDER BY sale_month
            RANGE BETWEEN
                UNBOUNDED PRECEDING AND
                UNBOUNDED FOLLOWING
    ) last_month
    from scores
--vrne tabelo s samo zapisi zadnjega meseca
),

employees as (

    select * from {{ ref('d_sales_employees')}}

),

final as (

    select distinct
                last_month,
                s.id_employee,
                sale_month,
                record,
                id_partner,
                e.name = '{{ var("current_best_salesman") }}' as best_salesman,
                s.entry_date
    from last_month a
    left join scores s on s.sale_month = a.last_month
    left join employees e on e.id_employee = s.id_employee
-- vrne tabelo z zapisi zadnjega meseca z joinom tabele scores in employees, dodana je tudi spremenljivka current_best_salesman

)
select * from final