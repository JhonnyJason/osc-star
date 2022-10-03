#!/bin/bash

############################################################
#region removeStuff
systemctl stop tested.socket
systemctl stop tested.service
rm /run/tested.sk
#endregion

############################################################
#region copyStuff
cp tested.service /etc/systemd/system/
cp tested.socket /etc/systemd/system/
cp nginx-config /etc/nginx/servers/tested
#endregion

############################################################
#region reloadAndRestart
systemctl daemon-reload
systemctl start tested.socket
nginx -s reload
#endregion
