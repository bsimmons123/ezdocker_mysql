# (1) set up all the mysqldump variables
DATE=`date +"%d_%b_%Y_%H%M"`
SQLFILE=backup/db_backup_${DATE}.sql
DATABASE=jsptutorial
USER=root


# (3) do the mysql database backup (dump)
docker exec -i ${1} mysqldump --defaults-extra-file=home/config/mysqlpass.cnf -u ${USER} ${DATABASE} > ${SQLFILE}
