{% macro do_sources_on_run_start() %}
  {% if execute %}
    {% for source in graph.sources.values() %}
      {% for column in source.columns.values() %}
        {% if column.tags or column.meta %}
          {% do alter_column_drop_mask(source, column) %}
          
          {% do alter_column_unset_tags(source, column) %}

        {% endif %}
      {% endfor %}  
    {% endfor %}
  {% endif %}
{% endmacro %}