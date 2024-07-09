{% macro dbt_alert_job__sample_1() %}

  {% set alert_query -%}

    /*
      Your rule description
    */
    with failures as ( -- your query should be the same approach as dbt singuar test query

      select  1

    )
    select  count(*) as failed_count
    from    failures
    where   1=1
    --  and   -- your condition to implement the rule e.g. datediff(hour, max_<timestamp>, sysdate()) > 3

  {%- endset %}
  {% set alert_title = "⚠️ Sample Alert" %} {# your concise email title #}

  {{ return((alert_query, alert_title)) }}

{% endmacro %}
