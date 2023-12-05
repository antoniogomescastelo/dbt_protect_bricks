{% macro drop_function_dataconcept_firstname() %} 
  {% if execute %}
    DROP FUNCTION {{var('mask_db')}}.{{var('mask_schema')}}.dataconcept_firstname;
    
  {% endif %}
{% endmacro %}