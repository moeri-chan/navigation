#!/usr/bin/env bash
touch etc/yum.repos.d/mongodb-org-3.0.repo
sudo cat > etc/yum.repos.d/mongodb-org-3.0.repo
<<EOF [mongodb-org-3.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.0/x86_64/
gpgcheck=0
enabled=1
EOF

sudo yum install -y mongodb-org
sudo service mongod start
sudo chkconfig mongod on
