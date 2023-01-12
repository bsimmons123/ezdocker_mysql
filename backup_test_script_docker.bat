@REM # (1) set up all the mysqldump variables
set time=%time:~0,2%_%time:~3,2%_%time:~6,2%
set SQLFILE=backup/db_backup_%time%.sql
set DATABASE=test
set USER=root
set DOCKER_CONTAINER_NAME=bsimmonsmysql

@REM # (3) do the mysql database backup (dump)
docker exec -i %DOCKER_CONTAINER_NAME% mysqldump --defaults-extra-file=home/config/mysqlpass.cnf -u %USER% %DATABASE% > %SQLFILE%
pause