{% macro alter_table_drop_rowfilter(source) %}
  {% set relation = adapter.get_relation(database=source.database, schema=source.schema, identifier=source.name) %}

  {% if relation.is_table %}
      {% set sql %} alter table {{source.database}}.{{source.schema}}.{{source.name}} drop row filter; {% endset %}

      {% do run_query(sql) %}
      
  {% endif %}
{% endmacro %}