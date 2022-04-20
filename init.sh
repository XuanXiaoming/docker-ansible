#!/bin/bash

# 关闭防火墙
ufw disable;

# 启动ssh
service ssh start;

# 安装ansible
apt-get install -y ansible;

# ansible的inventory文件位置
mkdir -p ~/ansible/inventory
sed -i "13ainventory       = ~\/ansible\/inventory\/" /etc/ansible/ansible.cfg

# 读取node节点ip，并发送公钥和编写ansible的inventory文件
touch ~/ansible/inventory/hosts
cd ~/.ssh/
for line in `cat /share/iplist`
do
    echo $line
    sshpass -p 'root' ssh-copy-id "-o StrictHostKeyChecking=no" root@$line
    echo "node-'$line' ansible_ssh_host='$line' ansible_ssh_user=root" >> ~/ansible/inventory/hosts
done

tail -f /dev/null;