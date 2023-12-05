{% test not_empty(model) %}
  {{ config(severity = 'warn') }}

  with validation as (select count(*) as row_count from {{ model }})

  select * from validation where row_count = 0
  
{% endtest %}