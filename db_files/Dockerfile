#Create MySQL Image for JSP Tutorial Application
FROM mysql
MAINTAINER bsimmons

ENV MYSQL_ROOT_PASSWORD password
ADD backup.sql /docker-entrypoint-initdb.d

RUN mkdir /home/config
RUN touch /home/config/mysqlpass.cnf
RUN chmod 600 /home/config/mysqlpass.cnf

EXPOSE 3306
