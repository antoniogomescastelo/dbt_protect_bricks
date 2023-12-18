{% macro alter_table_set_rowfilter(source) %}
  {% do log("ACA00") %}}
  {% set relation = adapter.get_relation(database=source.database, schema=source.schema, identifier=source.name) %}

  {% if relation.is_table %}
    {% if source.meta.filter %}
      {% do log("ACA01") %}}
      
      {% for k, v in source.meta.filter.items() %}
        {% do log("ACA02") %}
        {% do log(k) %}
        {% do log(v) %}
        {% set sql %} alter table {{source.database}}.{{source.schema}}.{{source.name}} set row filter {{k}} on ({{v}}); {% endset %}

        {% do run_query(sql) %}

      {% endfor %}      
    {% endif %}
  {% endif %}
{% endmacro %}
