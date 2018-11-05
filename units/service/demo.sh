#!/usr/bin/env bash

echo "cp /srv/demo/service/application.service /lib/systemd/system/application.service"
read
cp /srv/demo/service/application.service /lib/systemd/system/application.service

echo "systemctl daemon-reload"
read
systemctl daemon-reload

echo "systemctl status application.service"
read
systemctl status application.service

echo "systemctl start application.service"
read
systemctl start application.service

echo "systemctl status application.service"
read
systemctl status application.service

echo "systemctl --all -t service"
read
systemctl --all -t service

echo "systemctl stop application.service"
read
systemctl stop application.service

echo "systemctl status application.service"
read
systemctl status application.service

echo "systemctl --all -t service"
read
systemctl --all -t service

rm /lib/systemd/system/application.service
systemctl daemon-reload