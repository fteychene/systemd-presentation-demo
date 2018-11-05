#!/usr/bin/env bash

function execute()
{
    echo $1
    read
    $1
    echo
    echo
}

function execute2()
{
    echo $1
    read
    $1
}

less /srv/demo/override/application.service
less /srv/demo/override/override-application.service

execute2 "cp /srv/demo/override/application.service /lib/systemd/system/application.service"
execute2 "cp /srv/demo/override/override-application.service /etc/systemd/system/application.service"
execute2 "systemctl daemon-reload"
# Start application
execute2 "systemctl start application.service"
sleep 2
execute "systemctl status application.service"
# Stop application
execute2 "systemctl stop application.service"


rm /lib/systemd/system/application.service
rm /etc/systemd/system/application.service
systemctl daemon-reload