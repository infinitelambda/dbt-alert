{% macro get_sql_send_email(query, title=none) -%}
  {{ return(adapter.dispatch("get_sql_send_email", "dbt_alert")(query=query, title=title)) }}
{%- endmacro %}

{% macro default__get_sql_send_email(query, title=none) -%}

  {% set utcnow = modules.datetime.datetime.utcnow().strftime("%Y-%m-%d %H:%M:%S") %}
  {% set query -%}

    execute immediate
    $$
    declare
      failed_count number default 0;
    begin
      failed_count := (
        {{ query }}
      );
      case
        when failed_count > 0 then
          call system$send_email(
            '{{ dbt_alert.create_or_get_resource() }}',
            '{{ dbt_alert.get_mailing_list() }}',
            '{{ title or "⚠️ Alert!"}} [' || :failed_count || '] | {{ utcnow }} (UTC)',
            '
              <p>This is auto-triggered by the job run: <a href=https://{{ var("dbt_alert__dbt_cloud_access_url", "cloud.getdbt.com") }}/deploy/{{ env_var('DBT_CLOUD_ACCOUNT_ID', 'manual') }}/projects/{{ env_var('DBT_CLOUD_PROJECT_ID', 'manual') }}/runs/{{ env_var('DBT_CLOUD_RUN_ID', 'manual') }}" >runs/{{ env_var('DBT_CLOUD_RUN_ID', 'manual') }}</a></p>
              <p>SQL query used as follows:</p>
              <pre><code> {{ query | replace("'", "''") }} </code></pre>
            ',
            'text/html'
          );
          return 'Alert is in queue 🕥';
        else
          return 'All good, no alert required ✅!';
      end;
    end;
    $$;

  {%- endset %}

  {{ return(query) }}

{%- endmacro %}
