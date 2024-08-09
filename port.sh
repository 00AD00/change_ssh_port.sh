#!/bin/bash

# 变量
NEW_PORT=2024  # 设置新的 SSH 端口为 2024
SSH_CONFIG_FILE="/etc/ssh/sshd_config"
BACKUP_FILE="/etc/ssh/sshd_config.bak"

# 备份当前的 SSH 配置文件
echo "备份当前的 SSH 配置文件到 $BACKUP_FILE"
sudo cp $SSH_CONFIG_FILE $BACKUP_FILE

# 修改 SSH 配置文件中的端口
echo "修改 SSH 配置文件中的端口到 $NEW_PORT"
sudo sed -i "s/^#Port 22/Port $NEW_PORT/" $SSH_CONFIG_FILE
sudo sed -i "s/^Port 22/Port $NEW_PORT/" $SSH_CONFIG_FILE

# 重启 SSH 服务
echo "重启 SSH 服务"
sudo systemctl restart sshd

# 提示用户完成
echo "SSH 端口已修改为 $NEW_PORT。如果无法连接，请检查防火墙设置和 SSH 配置。"
