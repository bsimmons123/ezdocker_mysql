@REM # (1) set up all the mysqldump variables
ECHO off
set TIME=%time:~0,2%_%time:~3,2%_%time:~6,2%
::trim left whitespace
for /f "tokens=* delims= " %%a in ("%TIME%") do set TIME=%%a
set DIR=backup/
set SQLFILE=db_backup_test_%TIME%.sql
set SQLFILE_DIR=%DIR%%SQLFILE%
set DATABASE=test
set USER=root
set DOCKER_CONTAINER_NAME=bsimmonsmysql
set PASSWORD=password
ECHO Loading...

ECHO Reaching out to docker container: %DOCKER_CONTAINER_NAME%
@REM # (3) do the mysql database backup (dump)
docker exec -i %DOCKER_CONTAINER_NAME% mysqldump -p%PASSWORD% -u %USER% %DATABASE% > %SQLFILE_DIR%

ECHO Use: (--defaults-extra-file=home/config/mysqlpass.cnf) for better security

ECHO Database backup finished
ECHO Find your backup file at: %SQLFILE_DIR%

ECHO Adding (USE `test`) into %SQLFILE_DIR%

cd backup
echo USE `test`;>temp.txt
type %SQLFILE%>>temp.txt
del %SQLFILE%
rename temp.txt %SQLFILE%

ECHO Adding (CREATE DATABASE  IF NOT EXISTS `test`) into %SQLFILE_DIR%


echo CREATE DATABASE  IF NOT EXISTS `test`;>temp.txt
type %SQLFILE%>>temp.txt
del %SQLFILE%
rename temp.txt %SQLFILE%

pause