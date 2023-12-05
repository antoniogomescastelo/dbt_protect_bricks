{% macro alter_column_set_tags(source, column) %}
  {% set relation = adapter.get_relation(database=source.database, schema=source.schema, identifier=source.name) %}

  {% if relation.is_table %}
    {% if column.tags %}
      {% set tag_list %} "{{column.tags|join('", "')}}" {% endset %}  

      {% set sql %} alter table {{source.database}}.{{source.schema}}.{{source.name}} alter column {{column.name}} set tags({{tag_list}}); {% endset %}

      {% do run_query(sql) %}

    {% endif %}

    {% if column.meta %}
      {% set meta_list = [] %}

      {% for k, v in column.meta.items() %}
        {% set tag %}"{{k}}"="{{v}}"{% endset %} 

        {{meta_list.append(tag)}}

      {% endfor %}

      {% set meta_list %} {{meta_list|join(', ')}} {% endset %}  

      {% set sql %} alter table {{source.database}}.{{source.schema}}.{{source.name}} alter column {{column.name}} set tags ({{meta_list}}); {% endset %}

      {% do run_query(sql) %}
      
    {% endif %}
  {% endif %}
{% endmacro %}