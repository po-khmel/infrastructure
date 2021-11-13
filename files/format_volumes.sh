#!/bin/bash 
sudo mkdir /export
sudo chown -R galaxy:galaxy /export

sudo mkfs -t ext4  /dev/vdb
sudo mkdir /export/tools
echo "/dev/vdb  /export/tools ext4 defaults,nofail 0 2" >> /etc/fstab
sudo mount /dev/vdb /export/tools
sudo chown -R galaxy:galaxy /export/tools

sudo mkfs -t ext4  /dev/vdc
sudo mkdir /export/datamanager
echo "/dev/vdc  /export/datamanager ext4 defaults,nofail 0 2" >> /etc/fstab
sudo mount /dev/vdc /datamanager
sudo chown -R galaxy:galaxy /export/datamanager

sudo mkfs -t ext4  /dev/vdd
sudo mkdir /export/sync
echo "/dev/vdd  /export/sync ext4 defaults,nofail 0 2" >> /etc/fstab
sudo mount /dev/vdd /export/sync
sudo chown -R galaxy:galaxy /export/sync

sudo mkfs -t ext4  /dev/vde
sudo mkdir /export/jwd
echo "/dev/vde /export/jwd ext4 defaults,nofail 0 2" >> /etc/fstab
sudo mount /dev/vde /export/jwd
sudo chown -R galaxy:galaxy /export/jwd

sudo mkfs -t ext4  /dev/vdf
sudo mkdir /export/data
echo "/dev/vdf  /export/dati ext4 defaults,nofail 0 2" >> /etc/fstab
sudo mount /dev/vdf /export/data
sudo chown -R galaxy:galaxy /export/dati

