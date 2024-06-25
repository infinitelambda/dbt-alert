{% macro execute_jobs(dry_run=false) -%}
  {{ return(adapter.dispatch('execute_jobs', 'dbt_alert')(dry_run=dry_run)) }}
{%- endmacro %}

{% macro default__execute_jobs(dry_run=false) -%}

  {% set job_names = var("dbt_alert__jobs").split(",") %}
  {% for job_name in job_names %}
    {{ dbt_alert.execute_job(job_name, dry_run=dry_run) }}
  {% endfor %}

{%- endmacro %}