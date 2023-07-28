{% macro insert_audits(action_name) -%}


insert into postgres.staging.dbt_audits (audit_type)

values ('{{ action_name }}');

commit;

{%- endmacro %}