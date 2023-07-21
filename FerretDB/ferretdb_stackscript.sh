#!/bin/bash

# <UDF name="username" label="username for authentication" default="username" />
# <UDF name="password" label="password for authentication" default="password" />
# <UDF name="ipaddr" label="public bind address, rebuild the server after obtaining a public IP to allow remote connections" default="127.0.0.1" />

apt update && apt upgrade -y && apt install -y wget postgresql postgresql-contrib

wget https://github.com/FerretDB/FerretDB/releases/download/v1.6.0/ferretdb.deb

dpkg -i ferretdb.deb

systemctl enable postgresql
systemctl start postgresql

sudo -u postgres createuser $USERNAME --no-superuser --no-createdb --no-createrole
sudo -u postgres psql -c "ALTER USER $USERNAME WITH PASSWORD '$PASSWORD';"
sudo -u postgres createdb ferretdb --locale=en_US.UTF-8 --template=template0
sudo -u postgres psql -c "GRANT CREATE ON DATABASE ferretdb TO $USERNAME;"

cat <<END >/lib/systemd/system/ferretdb.service
[Unit]
Description=FerretDB is an open-source proxy, converting the MongoDB 6.0+ wire protocol queries to SQL - using PostgreSQL or SQLite as a database engine.
# https://docs.ferretdb.io
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/ferretdb --listen-addr=$IPADDR:27017 --debug-addr="127.0.0.1:8089"
Restart=on-failure
RestartSec=5s

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable ferretdb
systemctl start ferretdb