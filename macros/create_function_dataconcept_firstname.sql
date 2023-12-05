{% macro create_function_dataconcept_firstname() %} 
  {% if execute %}
    CREATE OR REPLACE FUNCTION {{var('mask_db')}}.{{var('mask_schema')}}.dataconcept_firstname (value STRING) RETURNS STRING 
    RETURN CASE
    WHEN IS_ACCOUNT_GROUP_MEMBER('Public') 
        THEN {{var('mask_db')}}.{{var('mask_schema')}}.protect(value, 'DEFAULT_MASKING') 
        ELSE '[REDACTED]' 
    END;
    
  {% endif %}
{% endmacro %}