<!-- markdownlint-disable no-inline-html no-alt-text ul-indent code-block-style -->
# dbt-alert

<img align="right" width="150" height="150" src="https://raw.githubusercontent.com/infinitelambda/dbt-alert/main/docs/assets/img/il-logo.png">

[![dbt-hub](https://img.shields.io/badge/Visit-dbt--hub%20↗️-FF694B?logo=dbt&logoColor=FF694B)](https://hub.getdbt.com/infinitelambda/dbt_alert)
[![support-snowflake](https://img.shields.io/badge/support-Snowflake-7faecd?logo=snowflake&logoColor=7faecd)](https://docs.snowflake.com?ref=infinitelambda)
[![support-dbt](https://img.shields.io/badge/support-dbt%20v1.6+-FF694B?logo=dbt&logoColor=FF694B)](https://docs.getdbt.com?ref=infinitelambda)

Triggering alerts from Data Warehouse managed by dbt 🚀

**_Who is this for?_**

For the dbt-ers who want:

- To leverage the notification feature of the Data Warehouse (e.g. Snowflake Notification Integration)
- To manage the alerting jobs via SQL script (which is similar to dbt singular test)

## Installation

- Add to `packages.yml` file:

```yml
packages:
  - package: infinitelambda/dbt_alert
    version: [">=1.0.0", "<1.1.0"]
```

Or use the latest version from git:

```yml
packages:
  - git: "https://github.com/infinitelambda/dbt-alert"
    revision: <release version or tag>
```

And run `dbt deps` to install the package!

## Quick Demo

Jump into [Getting Started](getting-started-snowflake.md) page for more details on how to start using this package with Snowflake.

📹 Here is a quick live demo:

`TODO`

## Variables

!!! tip "See `dbt_project.yml` file"
    Go to `vars` section [here](https://github.com/infinitelambda/dbt-alert/blob/main/dbt_project.yml#L15) 🏃

    We managed to provide the inline comments only for now, soon to have the dedicated page for more detail explanation.

Here are the full list of built-in variables:

- `dbt_alert__mailing_list`: Mandatory
- `dbt_alert__jobs`: Mandantory if using `execute_jobs` macro
- `dbt_alert__dbt_cloud_access_url`
- `dbt_alert_notification_integration_id`
- `dbt_alert_notification_integration_usage_role`

## How to Contribute ❤️

`dbt-alert` is an open-source dbt package. Whether you are a seasoned open-source contributor or a first-time committer, we welcome and encourage you to contribute code, documentation, ideas, or problem statements to this project.

👉 See [CONTRIBUTING guideline](https://dbt-alert.iflambda.com/latest/nav/dev/contributing.html) for more details or check out [CONTRIBUTING.md](https://github.com/infinitelambda/dbt-alert/tree/main/CONTRIBUTING.md)

🌟 And then, kudos to **our beloved Contributors**:

<a href="https://github.com/infinitelambda/dbt-alert/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=infinitelambda/dbt-alert" alt="Contributors" />
</a>

## About Infinite Lambda

Infinite Lambda is a cloud and data consultancy. We build strategies, help organizations implement them, and pass on the expertise to look after the infrastructure.

We are an Elite Snowflake Partner, a Platinum dbt Partner, and a two-time Fivetran Innovation Partner of the Year for EMEA.

Naturally, we love exploring innovative solutions and sharing knowledge, so go ahead and:

🔧 Take a look around our [Git](https://github.com/infinitelambda)

✏️ Browse our [tech blog](https://infinitelambda.com/category/tech-blog/)

We are also chatty, so:

👀 Follow us on [LinkedIn](https://www.linkedin.com/company/infinite-lambda/)

👋🏼 Or just [get in touch](https://infinitelambda.com/contacts/)

[<img src="https://raw.githubusercontent.com/infinitelambda/cdn/1.0.0/general/images/GitHub-About-Section-1080x1080.png" alt="About IL" width="500">](https://infinitelambda.com/)
