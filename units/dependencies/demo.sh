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

less /srv/demo/dependencies/application.service

execute2 "cp /srv/demo/dependencies/application.service /lib/systemd/system/application.service"
execute2 "systemctl daemon-reload"
#Status
execute "systemctl status application.service"
execute "systemctl status postgresql.service"
execute "systemctl status redis-server.service"
# Start application
execute2 "systemctl start application.service"
execute "systemctl status application.service"
execute "systemctl status postgresql.service"
execute "systemctl status redis-server.service"
# Stop application
execute2 "systemctl stop application.service"
execute "systemctl status application.service"
execute "systemctl status postgresql.service"
execute "systemctl status redis-server.service"
# Stop redis
execute2 "systemctl start application.service"
execute "systemctl status application.service"
execute2 "systemctl stop redis-server.service"
execute "systemctl status redis-server.service"
execute "systemctl status application.service"
execute "systemctl status postgresql.service"


systemctl stop postgresql.service
rm /lib/systemd/system/application.service
systemctl daemon-reload