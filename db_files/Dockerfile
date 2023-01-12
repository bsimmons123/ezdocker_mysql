#Create MySQL Image for JSP Tutorial Application
FROM mysql
MAINTAINER bsimmons

ENV MYSQL_ROOT_PASSWORD password
ADD backup.sql /docker-entrypoint-initdb.d

EXPOSE 3306
