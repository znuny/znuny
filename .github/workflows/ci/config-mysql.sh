#!/usr/bin/env bash

set -o errexit
set -o pipefail

echo "Change Config.pm"
sed -i 's/\(.*{DatabaseHost}.*\)127.0.0.1/\1'"mariadb"'/' /opt/znuny/Kernel/Config.pm
sed -i 's/\(.*{Database}.*\)znuny/\1'"${MYSQL_DATABASE}"'/' /opt/znuny/Kernel/Config.pm
sed -i 's/\(.*{DatabaseUser}.*\)znuny/\1'"${MYSQL_USER}"'/' /opt/znuny/Kernel/Config.pm
sed -i 's/\(.*{DatabasePw}.*\)some-pass/\1'"${MYSQL_PASSWORD}"'/' /opt/znuny/Kernel/Config.pm

SCHEMA_FILE=$(find /opt/znuny/scripts/database -type f -name '*schema.mysql.sql')
INITIAL_INSERT_FILE=$(find /opt/znuny/scripts/database -type f -name '*initial_insert.mysql.sql')
SCHEMA_POST_FILE=$(find /opt/znuny/scripts/database -type f -name '*schema-post.mysql.sql')

echo "Use SCHEMA_FILE: $SCHEMA_FILE"
echo "Use INITIAL_INSERT_FILE: $INITIAL_INSERT_FILE"
echo "Use SCHEMA_POST_FILE: $SCHEMA_POST_FILE"

echo "Change character set"
mysql -h mariadb -u "${MYSQL_USERNAME}" -p"${MYSQL_PASSWORD}" -e "ALTER DATABASE znuny DEFAULT CHARACTER SET utf8mb4;ALTER DATABASE znuny DEFAULT COLLATE utf8mb4_unicode_ci;" || exit 1

echo "Create schema"
mysql -h mariadb -u "${MYSQL_USERNAME}" -p"${MYSQL_PASSWORD}" znuny < "$SCHEMA_FILE" || exit 1

echo "Initial data"
mysql -h mariadb -u "${MYSQL_USERNAME}" -p"${MYSQL_PASSWORD}" znuny < "$INITIAL_INSERT_FILE" || exit 1

echo "Create post schema"
mysql -h mariadb -u "${MYSQL_USERNAME}" -p"${MYSQL_PASSWORD}" znuny < "$SCHEMA_POST_FILE" || exit 1

