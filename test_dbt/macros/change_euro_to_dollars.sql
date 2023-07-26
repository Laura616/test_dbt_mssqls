
{% macro euro_to_dollars(column_name, precision=3) %}
    ({{ column_name }} * 1.09)::numeric(16, {{ precision }})
{% endmacro %}
