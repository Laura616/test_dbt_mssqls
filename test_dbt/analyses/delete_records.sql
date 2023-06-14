with scores as (

    select * from {{ ref('monthly_scores') }}

)


Delete from scores where record = 750