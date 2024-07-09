{% macro execute_job(job_name, dry_run=false) -%}

  {% set JOB_PREFIX = "dbt_alert_job__" %}
  {% if not job_name.startswith(JOB_PREFIX) %}
    {% set job_name = JOB_PREFIX ~ (job_name | trim) %}
  {% endif %}

  {{ return(adapter.dispatch('execute_job', 'dbt_alert')(job_name=job_name, dry_run=dry_run)) }}

{%- endmacro %}


{% macro default__execute_job(job_name, dry_run=false) -%}

  {% set job_macro = context[job_name] %}
  {% if job_macro %}

    {% set job_query, job_title = job_macro() %}
    {% set query = dbt_alert.get_sql_send_email(query=job_query, title=job_title) %}

    {{ log("query: " ~ query, info=True) if execute }}
    {% if not dry_run and execute %}
      {{ log("[RUN]: " ~ job_macro.get_name(), info=True) }}
      {% set results = run_query(query) %}
      {{ log("Completed: " ~ results.columns[0].values()[0], info=True) }}
    {% endif %}

  {% else %}

    {{ exceptions.warn("Could NOT find the job macro " ~ job_name ~ ". SKIPPED!") }}

  {% endif %}


{%- endmacro %}
