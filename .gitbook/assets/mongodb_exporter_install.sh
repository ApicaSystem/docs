#!/bin/bash

sudo apt-get install -y wget

read -p "Enter MongoDB URI (e.g. mongodb://127.0.0.1:27017): " mongodb_uri
read -p "Enter web address and port number where the metrics should be hosted (e.g. localhost:9094): " web_listen_address
read -p "Enter auth username (optional): " auth_user
read -p "Enter auth password (optional): " auth_pass

echo "MongoDB URI: $mongodb_uri"
echo "Web listen address: $web_listen_address"
if [ -n "$auth_user" ]; then
    echo "Auth username: $auth_user"
fi
if [ -n "$auth_pass" ]; then
    echo "Auth password: $auth_pass"
fi

wget https://github.com/percona/mongodb_exporter/releases/download/v0.37.0/mongodb_exporter-0.37.0.linux-amd64.tar.gz

# Extract the tar file
tar -xvf mongodb_exporter-0.37.0.linux-amd64.tar.gz

# Move to /usr/local/bin
sudo mv mongodb_exporter*/mongodb_exporter /usr/local/bin

# Creating a service for the MongoDB exporter
if [ -n "$auth_user" ] && [ -n "$auth_pass" ]; then
    # Both auth user and password are provided
    sudo tee /etc/systemd/system/mongodb_exporter.service > /dev/null <<EOF
[Unit]
Description=MongoDB Exporter
After=network.target

[Service]
User=root
Group=root
ExecStart=/usr/local/bin/mongodb_exporter --mongodb.uri=$mongodb_uri --web.listen-address=$web_listen_address --auth.user=$auth_user --auth.pass=$auth_pass --collect-all
Restart=always

[Install]
WantedBy=multi-user.target
EOF
else
    # No auth user or password provided
    sudo tee /etc/systemd/system/mongodb_exporter.service > /dev/null <<EOF
[Unit]
Description=MongoDB Exporter
After=network.target

[Service]
User=root
Group=root
ExecStart=/usr/local/bin/mongodb_exporter --mongodb.uri=$mongodb_uri --web.listen-address=$web_listen_address --collect-all
Restart=always

[Install]
WantedBy=multi-user.target
EOF
fi

# Reload systemd to read the new service file
sudo systemctl daemon-reload

# Start and enable the service
sudo systemctl start mongodb_exporter
sudo systemctl enable mongodb_exporter
