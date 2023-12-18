{% macro create_function_main_sales_dim_store() %} 
  {% if execute %}
    CREATE OR REPLACE FUNCTION {{var('mask_db')}}.{{var('mask_schema')}}.main_sales_dim_store (business_key STRING) RETURNS BOOLEAN
    RETURN CASE 
    WHEN business_key == 'AKL01' THEN 
        CASE 
          WHEN IS_ACCOUNT_GROUP_MEMBER('CodeValue:AKL01') THEN TRUE 
          WHEN IS_ACCOUNT_GROUP_MEMBER('CodeValue:AKL02') THEN TRUE 
          ELSE FALSE 
        END 
    WHEN business_key == 'AKL02' THEN 
        CASE 
          WHEN IS_ACCOUNT_GROUP_MEMBER('CodeValue:AKL01') THEN TRUE 
          WHEN IS_ACCOUNT_GROUP_MEMBER('CodeValue:AKL02') THEN TRUE 
          ELSE FALSE 
        END 
    WHEN business_key == 'BNE02' THEN 
        CASE 
          WHEN IS_ACCOUNT_GROUP_MEMBER('CodeValue:BNE02') THEN TRUE 
          ELSE FALSE 
        END 
    WHEN business_key == 'MEL01' THEN 
        CASE 
          WHEN IS_ACCOUNT_GROUP_MEMBER('CodeValue:MEL01') THEN TRUE 
          WHEN IS_ACCOUNT_GROUP_MEMBER('CodeValue:MEL02') THEN TRUE 
          ELSE FALSE 
        END 
    WHEN business_key == 'MEL02' THEN 
        CASE 
          WHEN IS_ACCOUNT_GROUP_MEMBER('CodeValue:MEL01') THEN TRUE 
          WHEN IS_ACCOUNT_GROUP_MEMBER('CodeValue:MEL02') THEN TRUE 
          ELSE FALSE 
        END 
    WHEN business_key == 'SYD01' THEN 
        CASE 
          WHEN IS_ACCOUNT_GROUP_MEMBER('CodeValue:SYD01') THEN TRUE 
          ELSE FALSE 
        END 
    ELSE FALSE 
    END; 
  {% endif %}
{% endmacro %}