printf "Running docker file\n"

cd db_files
docker build -t bsimmonsmysql:0.1 .

cd ..

printf "Checking backup dir\n"
mkdir -p backup

printf "Running Container\n"
docker run --name=bsimmonsmysql --detach --publish 3306:3306 --volume=$(pwd)/backup:/home/backup --volume=$(pwd)/config:/home/config bsimmonsmysql:0.1
