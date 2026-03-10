#!/bin/bash

# Configuration
BACKUP_DIR="/backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
DB_HOST="db"
DB_NAME="glpi"
DB_USER="glpi"

echo "Starting DB Backup: $TIMESTAMP"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Database Dump
mariadb-dump -h "$DB_HOST" -u "$DB_USER" "$DB_NAME" > "$BACKUP_DIR/glpi_db_$TIMESTAMP.sql"

# Keep only the last 7 backups
ls -t "$BACKUP_DIR"/glpi_db_*.sql | tail -n +8 | xargs rm -f -- 2>/dev/null

echo "Backup completed: $BACKUP_DIR/glpi_db_$TIMESTAMP.sql"
