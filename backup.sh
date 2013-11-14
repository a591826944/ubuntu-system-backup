#!/bin/bash
#Date 2013-10-9
#author wwpeng
#email 591826944@qq.com
#该脚本用于备份 ubuntu系统 会将系统 /boot /usr /var /home 打包成压缩文件
##########配置参数##########
#备份文件的保存目录 如果保存到windows ntfs分区的花一定要先挂在分区，否则找不到路径
backup_path=/media/CAA45525A45514F3/ubuntu_backup
#root用户密码
su_password=wwpeng

#停止桌面服务
echo stop lightdm service...
echo "$su_password"|sudo -S service lightdm stop
#创建备份目录
backup_path=$backup_path"/"$(date +%Y%m%d%H%M%S)
echo "$su_password"|sudo -S mkdir -p $backup_path
#开始创建 /boot 目录的备份文件
echo create boot backup.
echo "$su_password"|sudo -S tar -cvpzf ${backup_path}"/boot.tar.gz" /boot
#开始创建 /root 目录的备份文件
echo create root backup.
echo "$su_password"|sudo -S tar -cvpzf ${backup_path}"/root.tar.gz" 
--exclude=/sys --exclude=/proc --exclude=/media --exclude=/home 
--exclude=/usr --exclude=/var --exclude=/tmp --exclude=/boot 
--exclude=/mnt --exclude=/prod --exclude=/lost+found --exclude=/run  /
#开始创建 /usr 目录的备份文件
echo create usr backup.
echo "$su_password"|sudo -S tar -cvpzf ${backup_path}"/usr.tar.gz" /usr
#开始创建 /var 目录的备份文件
echo create var backup.
echo "$su_password"|sudo -S tar -cvpzf ${backup_path}"/var.tar.gz" /var
#开始创建 /home 目录的备份文件
echo create home backup.
echo "$su_password"|sudo -S tar -cvpzf ${backup_path}"/home.tar.gz" --exclude=/home/lost+found /home
#备份完成
echo "backup complete"
