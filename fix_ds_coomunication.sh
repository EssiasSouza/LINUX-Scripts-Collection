#!/bin/bash

log_ds="/var/DS_SFTP/log/dssft.log"

if [ -f "$log_ds" ]; then
        echo "DS - OK"
        data_transfer_check=$(grep datatransfer /etc/hosts)
        echo "$data_transfer_check"
        sudo sed -i '/datatransfer/d' /etc/hosts
        if [ -n "$data_transfer_check" ]; then
                echo "/etc/hosts errado"
                sudo sed -i '/datatransfer/d' /etc/hosts
                sudo rm -Rf /home/pi/EDI/1.ENVIO/DATA_MASTER
                sudo mkdir /home/pi/EDI/1.ENVIO/DATA_MASTER
                sudo Ds_sftpRestart

        else
                echo "/etc/hosts - OK"
        fi

else
        echo "DS - NOK"

        novpn=$(ip a | grep 172.)
        if [ -n "$novpn" ]; then
                echo "VPN"
        else
                echo "NOVPN"
        fi
fi
