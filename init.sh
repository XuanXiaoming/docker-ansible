#!/bin/bash

# 关闭防火墙
ufw disable;

# 启动ssh
service ssh start;

# 安装ansible
apt-get install -y ansible;

# ansible的inventory文件位置（不存在文件夹时，初始化文件夹及其ansible配置）
if [ ! -d "~/ansible/inventory" ]; then
  mkdir -p ~/ansible/inventory
  sed -i "13ainventory       = ~\/ansible\/inventory\/" /etc/ansible/ansible.cfg
fi

# 存在hosts文件则清空，不存在则创建
> ~/ansible/inventory/hosts 

# 读取node节点ip，并发送公钥和编写ansible的inventory文件
for line in `cat /share/iplist`
do
    echo $line
    sshpass -p 'root' ssh-copy-id -i ~/.ssh/id_rsa.pub "-o StrictHostKeyChecking=no" root@$line
    echo "node-$line ansible_ssh_host=$line ansible_ssh_user=root" >> ~/ansible/inventory/hosts
done

# 使用完清空iplist文件
> /share/iplist

tail -f /dev/null;