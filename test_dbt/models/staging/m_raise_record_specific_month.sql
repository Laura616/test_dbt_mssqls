
with sale_date as (

    select substring(sale_date, 4, 2) as sale_month,
            record
    from {{ ref('f_sales_records') }}
    where substring(sale_date, 4, 2) = '08'

),

final as (

    select
        {{ records('sale_month', 'record') }} as records,
        sale_month,
        record
    from sale_date

)

select * from final
where  {{ records('sale_month', 'record') }} is not null




