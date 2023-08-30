# EZDocker MySql


![](https://img.shields.io/badge/Docker-2CA5E0?style=for-the-badge&logo=docker&logoColor=white) ![](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white) ![](https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white) ![](https://img.shields.io/badge/powershell-5391FE?style=for-the-badge&logo=powershell&logoColor=white)

This project is used to _**create**_ and _**dump**_ docker MySql containers easily using helper scripts

## Usage

### Initializing the Database

**Note: Ensure you edit the file `db_files/backup.sql` to have the correct database name for your purposes before proceeding.**

**For Windows Users:**
```shell
# To initialize the database:
# Navigate to the root project directory (e.g., ezdocker_mysql/)
# Run the following command to create the MySQL server
init_script.bat
```
**For Linux Users:**
```shell
# To initialize the database:
# Navigate to the root project directory (e.g., ezdocker_mysql/)
# Run the following command to create the MySQL server
init_script.sh
```

### Performing a Backup

**For Windows Users:**

```shell
backup_script_docker.bat <db_name>
```
**For Linux Users:**
```shell
backup_script_docker.sh <db_name>
```

Replace <db_name> with the actual name of the database you want to create a backup for. Make sure you have navigated to the project's root directory before running the backup script.

### Important Note

If you prefer using one of your backups instead of the blank database created initially, you can replace the `backup.sql` file located in `db_files/` with any backup you have made in the `backup/` folder.


## Background

### Motivation

This project was born out of the necessity I encountered while developing various projects that required a database. Traditional tools like MySQL Workbench felt cumbersome, offering more features than necessary for my development work.

### Benefits

The **EZDocker MySQL** project eliminates complexity from the process of setting up databases, allowing for more streamlined development. It empowers users to effortlessly create multiple MySQL servers and readily generate backups. By doing so, it enables developers to allocate more time and focus on the enjoyable aspects of their projects.
