@REM # (1) set up all the mysqldump variables
ECHO off
set time=%time:~0,2%_%time:~3,2%_%time:~6,2%
set DIR=backup/
set SQLFILE=db_backup_dev_%time%.sql
set SQLFILE_DIR=%DIR%%SQLFILE%
set DATABASE=test
set USER=root
set DOCKER_CONTAINER_NAME=bsimmonsmysql
ECHO Loading...

ECHO Reaching out to docker container: %DOCKER_CONTAINER_NAME%
@REM # (3) do the mysql database backup (dump)
docker exec -i %DOCKER_CONTAINER_NAME% mysqldump --defaults-extra-file=home/config/mysqlpass.cnf -u %USER% %DATABASE% > %SQLFILE_DIR%

ECHO Database backup finished
ECHO Find your backup file at: %SQLFILE_DIR%

ECHO Adding (USE `dev`) into %SQLFILE_DIR%

cd backup
echo USE `dev`;>temp.txt
type %SQLFILE%>>temp.txt
del %SQLFILE%
rename temp.txt %SQLFILE%

ECHO Adding (CREATE DATABASE  IF NOT EXISTS `dev`) into %SQLFILE_DIR%


echo CREATE DATABASE  IF NOT EXISTS `dev`;>temp.txt
type %SQLFILE%>>temp.txt
del %SQLFILE%
rename temp.txt %SQLFILE%

pause