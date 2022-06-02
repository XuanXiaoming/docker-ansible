FROM ubuntu

RUN echo "root:root" | chpasswd \
        && sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
        && sed -i s@/security.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
        && apt clean; apt update \
        && apt -y install openssh-server tree net-tools vim iputils-ping sshpass ufw gzip --fix-missing \
        && sed -i '$a PubkeyAuthentication yes' /etc/ssh/sshd_config \
        && sed -i '$a PermitRootLogin yes' /etc/ssh/sshd_config \
        && ssh-keygen -t rsa -n '' -f ~/.ssh/id_rsa  