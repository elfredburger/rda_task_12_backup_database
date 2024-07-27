mysqldump -u $DB_USER -p$DB_PASSWORD --databases ShopDB --result-file=full_backup.sql

mysqldump -u $DB_USER -p$DB_PASSWORD --databases ShopDB --no-create-info --result-file=partial_backup.sql

mysql -u $DB_USER -p$DB_PASSWORD ShopDBReserve < full_backup.sql

mysql -u $DB_USER -p$DB_PASSWORD ShopDBReserve < partial_backup.sql