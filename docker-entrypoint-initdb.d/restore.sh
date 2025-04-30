#!/bin/bash
set -e

# Check if any user-defined tables exist in the public schema
TABLE_COUNT=$(psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -tAc "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'public';")

if [ "$TABLE_COUNT" -eq "0" ]; then
  echo "No tables found in database. Restoring from backup.sql..."
  psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" < /docker-entrypoint-initdb.d/backup.sql
  echo "✅ Database restore complete."
else
  echo "Tables already exist in database. Skipping restore."
fi
