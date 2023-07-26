{{ config(
    materialized="ephemeral"
)}}

with records as (

        select id_employee,
           substring(sale_date, 4, 2) as sale_month,
           record,
           id_partner,
           entry_date
    from {{ ref('f_sales_records') }}


)

select * from records