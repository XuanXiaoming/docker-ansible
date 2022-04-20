#!/bin/bash

# 关闭防火墙
ufw disable;

# 启动ssh服务
service ssh start;

#将ip写入iplist文件
ifconfig | grep -Eo '([0-9]{1,3}.){3}[0-9]{1,3}' | head -1 >> /share/iplist

tail -f /dev/null;
