# (1) set up all the mysqldump variables
DATE=`date +"%d_%b_%Y_%H%M"`
DIR=backup/
SQLFILE=db_backup_dev_${DATE}.sql
SQLFILE_DIR=${DIR}${SQLFILE}
DATABASE=test
USER=root
DOCKER_CONTAINER_NAME=bsimmonsmysql
printf "Starting...\n"

printf "Connecting to container\n"

# (3) do the mysql database backup (dump)
docker exec -i ${DOCKER_CONTAINER_NAME} mysqldump --defaults-extra-file=home/config/mysqlpass.cnf -u ${USER} ${DATABASE} > ${SQLFILE_DIR}

printf "Database backup created at: ${SQLFILE_DIR}\n"

#############################
#
# Append test Database creation to file
#
#############################

printf "Adding (USE dev) into ${SQLFILE_DIR}\n"

sed -i '1i USE `dev`;' ${SQLFILE_DIR}

printf "Adding (CREATE DATABASE  IF NOT EXISTS dev) into ${SQLFILE_DIR}\n"

sed -i '1i CREATE DATABASE  IF NOT EXISTS `dev`;' ${SQLFILE_DIR}
