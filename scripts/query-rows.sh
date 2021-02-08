#!/usr/bin/env bash

docker exec -it stackmaster_dbhost_1 psql -U postgres -d camunda -c "SELECT reltuples as approximate_row_count FROM pg_class WHERE relname = 'act_ru_meter_log';"
