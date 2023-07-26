{{ config(
    tags=["expected"]
) }}

with test as (
    select *
    from {{ ref('t_test_table') }}
),

expected as (
    select *
    from {{ ref('t_expected_table') }}
),

final as (

    select id_value,
           sum(amount)
    from test
    group by id_value

)

    select * from final
    where not exists (
       select * from expected)