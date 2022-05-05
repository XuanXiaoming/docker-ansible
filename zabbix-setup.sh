# 安装mysql服务
apt-get install mysql-server mysql-client

mysql -u root -p

CREATE DATABASE zabbix CHARACTER SET UTF8 COLLATE UTF8_BIN;

CREATE USER 'zabbix'@'%' IDENTIFIED BY 'kamisama123';