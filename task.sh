
#mysql -u $DB_USER -p$DB_PASSWORD -e "GRANT SELECT, LOCK TABLES, SHOW VIEW, PROCESS ON *.* TO 'backup'@'%';"
#mysql -u $DB_USER -p$DB_PASSWORD -e "GRANT ALL ON ShopDBReserve.* TO 'backup'@'%';"
#mysql -u $DB_USER -p$DB_PASSWORD -e "GRANT INSERT, LOCK TABLES, ALTER ON ShopDBDevelopment.* TO 'backup'@'%';"

mysqldump -u $DB_USER -p$DB_PASSWORD --databases ShopDB --result-file=full_backup.sql

mysqldump -u $DB_USER -p$DB_PASSWORD --databases ShopDB --no-create-info --result-file=partial_backup.sql

mysql -u $DB_USER -p$DB_PASSWORD ShopDBReserve < full_backup.sql

mysql -u $DB_USER -p$DB_PASSWORD ShopDBDevelopment < partial_backup.sql