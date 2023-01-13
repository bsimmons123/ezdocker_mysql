# (1) set up all the mysqldump variables
DATE=`date +"%d_%b_%Y_%H%M"`
SQLFILE=backup/db_backup_${DATE}.sql
DATABASE=test
USER=root
DOCKER_CONTAINER_NAME=bsimmonsmysql
printf "Starting...\n"

printf "Connecting to container\n"

# (3) do the mysql database backup (dump)
docker exec -i ${DOCKER_CONTAINER_NAME} mysqldump --defaults-extra-file=home/config/mysqlpass.cnf -u ${USER} ${DATABASE} > ${SQLFILE}

printf "Database backup created at: ${SQLFILE}\n"
