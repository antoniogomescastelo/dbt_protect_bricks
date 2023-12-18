{% macro create_function_datacategory_personallyidentifiableinformation() %} 
  {% if execute %}
    CREATE OR REPLACE FUNCTION {{var('mask_db')}}.{{var('mask_schema')}}.datacategory_personallyidentifiableinformation (value STRING) RETURNS STRING 
    RETURN CASE 
    WHEN IS_ACCOUNT_GROUP_MEMBER('BusinessProcess|DirectMarketing') 
        THEN main.sbi_template_unitycatalog.protect(value, 'NO_MASKING') 
    WHEN IS_ACCOUNT_GROUP_MEMBER('Public') 
        THEN main.sbi_template_unitycatalog.protect(value, 'DEFAULT_MASKING') 
    ELSE '[REDACTED]' 
    END;

  {% endif %}
{% endmacro %}