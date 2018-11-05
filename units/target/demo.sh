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

less /srv/demo/target/enterprise.target

execute2 "cp /srv/demo/target/enterprise.target /lib/systemd/system/enterprise.target"
execute2 "mkdir /lib/systemd/system/enterprise.target.wants"
execute2 "systemctl daemon-reload"
execute2 "ln -s /lib/systemd/system/postgresql.service /lib/systemd/system/enterprise.target.wants/postgresql.service"
execute2 "ln -s /lib/systemd/system/redis-server.service /lib/systemd/system/enterprise.target.wants/redis-server.service"
execute "ls -alh /lib/systemd/system/enterprise.target.wants/"

execute "systemctl status postgresql.service"
execute "systemctl status redis-server.service"
# Start application
execute2 "systemctl start enterprise.target"

execute "systemctl status enterprise.target"
execute "systemctl status postgresql.service"
execute "systemctl status redis-server.service"

execute2 "systemctl stop enterprise.target"
execute "systemctl status postgresql.service"
execute "systemctl status redis-server.service"


systemctl stop postgresql.service
systemctl stop redis-server.service
rm /lib/systemd/system/enterprise.target
rm -R /lib/systemd/system/enterprise.target.wants
systemctl daemon-reload