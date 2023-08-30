ECHO off
ECHO Running docker file

cd db_files
docker build -t bsimmonsmysql:0.1 .

ECHO Running Container
cd ..

ECHO Checking backup dir
mkdir backup

docker run --name=bsimmonsmysql --detach --publish 3306:3306 --volume=%cd%/backup:/home/backup --volume=%cd%/config:/home/config bsimmonsmysql:0.1