{% macro drop_function_protect() %} 
  {% if execute %}
    DROP FUNCTION {{var('mask_db')}}.{{var('mask_schema')}}.protect;
    
  {% endif %}
{% endmacro %}