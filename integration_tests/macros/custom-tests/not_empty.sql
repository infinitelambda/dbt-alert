{% test not_empty(model) %}
 
with validation as (
  select count(1) as row_count from {{ model }}
),
validation_errors as (
  select row_count from validation where row_count = 0
)
select * from validation_errors
 
{% endtest %}