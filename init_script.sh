printf "Running docker file\n"

cd db_files
docker build -t bsimmonsmysql:0.1 .

printf "Running Container\n"
docker run --name=bsimmonsmysql --publish 3306:3306 --volume=/home/bsimmons/projects/EZDatabase:/home bsimmonsmysql:0.1
