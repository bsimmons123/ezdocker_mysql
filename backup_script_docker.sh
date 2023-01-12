# (1) set up all the mysqldump variables
DATE=`date +"%d_%b_%Y_%H%M"`
SQLFILE=/home/backup/db_backup_${DATE}.sql
DATABASE=jsptutorial
USER=root
PASSWORD='passsword'

# (3) do the mysql database backup (dump)
mysqldump -u ${USER} -p ${DATABASE} > ${SQLFILE}
