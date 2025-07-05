#!/bin/bash
set -e

if [ -e "/opt/airflow/requirements.txt" ]; then
    $(command -v pip) install --user -r /opt/airflow/requirements.txt
fi

if [ ! -f "/opt/airflow/airflow.db" ]; then
    airflow db init && \
    airflow users create \
        --username Admin \
        --firstname Admin \
        --lastname Admin \
        --role Admin \
        --email Admin@example.com \
        --password Admin
fi

$(command -v airflow) db upgrade

exec airflow webserver