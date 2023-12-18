{% macro alter_table_drop_rowfilter(source) %}
  {% set relation = adapter.get_relation(database=source.database, schema=source.schema, identifier=source.name) %}

  {% if relation.is_table %}
    {% set sql %} select distinct filter_name from {{source.database}}.INFORMATION_SCHEMA.COLUMN_TAGS where table_catalog = '{{source.database}}' and table_schema = '{{source.schema}}' and table_name = '{{source.name}}'; {% endset %}

    {% set results = run_query(sql) %}

    {% if results.columns[0].values() %}

      {% set sql %} alter table {{source.database}}.{{source.schema}}.{{source.name}} drop row filter; {% endset %}

      {% do run_query(sql) %}
      
    {% endif %}
  {% endif %}
{% endmacro %}
