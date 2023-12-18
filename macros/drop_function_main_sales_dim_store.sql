{% macro drop_function_main_sales_dim_store() %} 
  {% if execute %}
    DROP FUNCTION {{var('mask_db')}}.{{var('mask_schema')}}.main_sales_dim_store;
    
  {% endif %}
{% endmacro %}