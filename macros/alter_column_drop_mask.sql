{% macro alter_column_drop_mask(source, column) %}
  {% set relation = adapter.get_relation(database=source.database, schema=source.schema, identifier=source.name) %}

  {% if relation.is_table %}
    {% set sql %} select distinct mask_name from {{source.database}}.INFORMATION_SCHEMA.COLUMN_MASKS where table_catalog = '{{source.database}}' and table_schema = '{{source.schema}}' and table_name = '{{source.name}}' and column_name = '{{column.name}}'; {% endset %}

    {% set results = run_query(sql) %}

    {% if results.columns[0].values() %}
      {% set mask_list %} "{{results.columns[0].values()|join('", "')}}" {% endset %}  

      {% set sql %} alter table {{source.database}}.{{source.schema}}.{{source.name}} alter column {{column.name}} drop mask; {% endset %}

      {% do run_query(sql) %}
      
    {% endif %}
  {% endif %}
{% endmacro %}