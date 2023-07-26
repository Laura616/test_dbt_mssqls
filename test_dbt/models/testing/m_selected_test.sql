-- selected_iris.sql
{{ config(
        materialized='table',
        schema='unittesting',
        tags=['test']
    )
}}

-- count the number of special iris id (above average in all aspects)
-- not a very meaningful logic, just for exemplare purpose
SELECT
distinct count(distinct id)
FROM  {{ ref('t_mock_table') }}
where length > 20.9 and width > 3.5