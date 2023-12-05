{% macro alter_column_unset_tags(source, column) %}
  {% set relation = adapter.get_relation(database=source.database, schema=source.schema, identifier=source.name) %}

  {% if relation.is_table %}
    {% set sql %} select distinct tag_name from {{source.database}}.INFORMATION_SCHEMA.COLUMN_TAGS where catalog_name = '{{source.database}}' and schema_name = '{{source.schema}}' and table_name = '{{source.name}}' and column_name = '{{column.name}}'; {% endset %}

    {% set results = run_query(sql) %}

    {% if results.columns[0].values() %}
      {% set tag_list %} "{{results.columns[0].values()|join('", "')}}" {% endset %}  

      {% set sql %} alter table {{source.database}}.{{source.schema}}.{{source.name}} alter column {{column.name}} unset tags ({{tag_list}}); {% endset %}

      {% do run_query(sql) %}
      
    {% endif %}
  {% endif %}
{% endmacro %}