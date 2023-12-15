{% macro do_sources_on_run_end() %}
  {% if execute and flags.WHICH in ["run", "test", "seed", "snapshot", "run-operation"] %}
    {% for source in graph.sources.values() %}
      {% for column in source.columns.values() %}
        {% if column.tags or column.meta %}
          {% do alter_column_set_tags(source, column) %}
    
          {% do alter_column_set_mask(source, column) %}
          
        {% endif %}
      {% endfor %}  
    {% endfor %}
  {% endif %}
{% endmacro %}