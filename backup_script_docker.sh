if [ -z "$1" ]; then
    echo "Database not specified. Usage: $0 <db_name>"
    exit
else
    echo "Database provided: $1"
fi

# (1) set up all the mysqldump variables
DATE=`date +"%d_%b_%Y_%H%M"`
DATABASE=$1
DIR=backup/
SQLFILE=db_backup_${DATABASE}_${DATE}.sql
SQLFILE_DIR=${DIR}${SQLFILE}
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

printf "Adding (USE ${DATABASE}) into ${SQLFILE_DIR}\n"
sed -i "1i USE \`${DATABASE}\`;" ${SQLFILE_DIR}

printf "Adding (CREATE DATABASE IF NOT EXISTS ${DATABASE}) into ${SQLFILE_DIR}\n"
sed -i "1i CREATE DATABASE IF NOT EXISTS \`${DATABASE}\`;" ${SQLFILE_DIR}
