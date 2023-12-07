#! /bin/bash

# Change time zone to CST
sudo timedatectl set-timezone America/Chicago

# Install Motiva proxy
mkdir -p /etc/systemd/system/amazon-ssm-agent.service.d
cd /etc/systemd/system/amazon-ssm-agent.service.d
touch override.conf
tee -a override.conf <<EOF
[Service]
Environment="http_proxy=http://proxy.motiva.prv:8080"
Environment="https_proxy=http://proxy.motiva.prv:8080"
Environment="no_proxy=169.254.169.254"
EOF
sudo dnf install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl enable amazon-ssm-agent
sudo systemctl start amazon-ssm-agent
systemctl daemon-reload
systemctl restart amazon-ssm-agent
