#!/bin/bash
sudo hostnamectl set-hostname lzcentos8
echo 修改名称成功
echo 开始下载软件...
sudo yum install mysql
sudo yum install mysql-server
sudo yum install mysql-devel
sudo yum install httpd
sudo yum install samba
sudo yum  update
echo 下载软件完成
echo 开始启动服务...
sudo systemctl start mysqld
sudo systemctl start httpd
sudo systemctl start  smb nmb
sudo systemctl enable mysqld
sudo systemctl enable httpd
sudo systemctl enable  smb nmb
echo 服务启动完成
echo 开始防火墙配置...
sudo firewall-cmd --add-service=mysql --permanent
sudo firewall-cmd --add-service=http --permanent
sudo firewall-cmd --add-service=samba --permanent
sudo firewall-cmd --reload
echo 防火墙配置完成
echo 关闭SELINUX...
sudo sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
echo 设置盖下屏幕不休眠
sudo sed -i 's/#HandleLidSwitch=suspend/HandleLidSwitch=lock/g' /etc/systemd/logind.conf 
