{% macro create_function_protect() %} 
  {% if execute %}
    CREATE OR REPLACE FUNCTION {{var('mask_db')}}.{{var('mask_schema')}}.protect (method STRING, value STRING) RETURNS STRING 
    RETURN CASE method 
      WHEN 'DEFAULT_MASKING' THEN sha(value) 
      WHEN 'HASH' THEN hash(value) 
      WHEN 'SHA' THEN sha(value) 
      WHEN 'NO_MASKING' THEN value ELSE '[REDACTED]' 
    END;
    
  {% endif %}
{% endmacro %}