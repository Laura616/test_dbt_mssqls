{% macro records(sale_month, record) %}
    {% if (sale_month) == ('08') %}
        ({{ record }} + 20)
    {% else %}
        null
    {% endif %}
{% endmacro %}