@echo off
setlocal enabledelayedexpansion

rem Set a custom variable for the timestamp
for /f %%A in ('wmic OS Get localdatetime ^| find "."') do set "datetime=%%A"
set "timestamp=%datetime:~0,4%%datetime:~4,2%%datetime:~6,2%_%datetime:~8,2%%datetime:~10,2%%datetime:~12,2%"

if "%~1"=="" (
    echo Database not specified. Usage: %~nx0 ^<db_name^>
    exit /b 1
)

rem Define variables
set "backup_dir=backup"
set "database=%~1"
set "sql_file=db_backup_%database%_%timestamp%.sql"
set "sql_file_dir=%backup_dir%\%sql_file%"
set "user=root"
set "docker_container_name=bsimmonsmysql"
set "password=password"

echo Loading...

echo Reaching out to docker container: %docker_container_name%

rem Perform the MySQL database backup
docker exec -i %docker_container_name% mysqldump -p%password% -u %user% %database% > "%sql_file_dir%"

echo Use: (--defaults-extra-file=home/config/mysqlpass.cnf) for better security

echo Adding (USE `%database%`) into %sql_file_dir%

rem Create a temporary SQL script for modifications
(
    echo USE `%database%`;
    type "%sql_file_dir%"
) > temp.sql

move /y temp.sql "%sql_file_dir%"

echo Adding (CREATE DATABASE IF NOT EXISTS `%database%`) into %sql_file_dir%

rem Create a temporary SQL script for modifications
(
    echo CREATE DATABASE IF NOT EXISTS `%database%`;
    type "%sql_file_dir%"
) > temp.sql

move /y temp.sql "%sql_file_dir%"

echo Database backup finished
echo Find your backup file at: %sql_file_dir%

echo Process completed successfully.

rem Return to the original directory
cd ..
