{% macro drop_function_datacategory_personallyidentifiableinformation() %} 
  {% if execute %}
    DROP FUNCTION {{var('mask_db')}}.{{var('mask_schema')}}.datacategory_personallyidentifiableinformation;
    
  {% endif %}
{% endmacro %}