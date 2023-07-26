{% macro format_date(column_name) %}
    {{ dbt_date.convert_timezone((my_column, "America/New_York")) }}
{% endmacro %}