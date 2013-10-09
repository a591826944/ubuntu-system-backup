ubuntu-system-backup
====================

# 备份Ubuntu Linux 系统的shell脚本

###该shell脚本 基于bash环境，会将 /home /boot /usr /var 等目录 打包成压缩包

###使用之前 之需要配置好 shell脚本当中的  备份文件的存放目录路径 以及 sudo 命令的用户密码 之后脚本可以全自动执行操作，备份位置最好是media目录中挂在的其他硬盘分区，或者其他存储介质

##PS：特别注意

###该脚本需要 ctrl+alt+F1 切换到命令行模式下执行，因为执行过程中会停止lightdm桌面服务，执行完成后，因为桌面服务已经停止所以不能切换回原桌面
###只能 sudo service lightdm start 打开新的服务

