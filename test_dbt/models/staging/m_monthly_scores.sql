{{  config(alias='m_month_scores', database='postgres', schema='staging') }}

with records as (

    select *
    from {{ ref('m_records_ephemeral_example') }}

),

final as (

    select  id_employee,
            sale_month,
            sum(record) as record,
            id_partner,
            entry_date
    from records
    group by id_employee, sale_month, id_partner,entry_date
-- tabela vrne vse records združene po id_employee, sale_month (samo mesec) in id_partnerju

)

select * from final

{% if target.name == 'prod' %}
where sale_month <= '9'
{% endif %}