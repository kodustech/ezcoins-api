#!/bin/sh
# shellcheck disable=SC2046

if ! [ -f ".env" ]; then
  cp .env.backup .env
fi

export $(cat .env)

while ! pg_isready -q -h $DB_HOST -p 5432 -U $DB_USER; do
  echo "$(date) - $DATABASE_URL - waiting for database to start"
  sleep 2
done

bin/ez_coins_api eval EzCoinsApi.Release.migrate

bin/ez_coins_api start
