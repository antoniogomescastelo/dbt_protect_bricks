{% macro alter_table_set_rowfilter(source) %}
  {% set relation = adapter.get_relation(database=source.database, schema=source.schema, identifier=source.name) %}

  {% if relation.is_table %}
    {% if source.filter %}
      {% for k, v in source.filter.items() %}
        {% set sql %} alter table {{source.database}}.{{source.schema}}.{{source.name}} set row filter {{k}} on ({{v}}); {% endset %}

        {% do run_query(sql) %}

      {% endfor %}      
    {% endif %}
  {% endif %}
{% endmacro %}
