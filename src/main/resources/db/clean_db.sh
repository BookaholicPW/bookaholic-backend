#!/bin/bash
echo "Start cleaning database..."
mysql -h "${DATASOURCE_URL}" -u "${DATASOURCE_USERNAME}" -p "${DATASOURCE_PASSWORD}" < "DDL_generated/drop_tables.sql"
echo "Finished cleaning"
