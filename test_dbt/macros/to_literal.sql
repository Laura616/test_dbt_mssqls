-- macros/to_literal.sql
{% macro to_literal(text) %}

    '{{- text -}}'

{% endmacro %}