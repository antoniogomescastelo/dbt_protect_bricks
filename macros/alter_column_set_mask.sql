{% macro alter_column_set_mask(source, column) %}
  {% set relation = adapter.get_relation(database=source.database, schema=source.schema, identifier=source.name) %}

  {% if relation.is_table %}
    {% if "mask" in column.meta %}
      {% set sql %} alter table {{source.database}}.{{source.schema}}.{{source.name}} alter column {{column.name}} set mask {{column.meta.mask}}; {% endset %}

      {% do run_query(sql) %}
      
    {% endif %}
  {% endif %}
{% endmacro %}