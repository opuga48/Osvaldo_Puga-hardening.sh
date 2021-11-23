#Jose Osvaldo Puga Leija
#1990132
##!/bin/bash
#Script should be able to identify if the OS is or CentOS v7 or CentOS v8
CENTOS=$(grep '^VERSION' /etc/os-release)
echo "Prueba de bash script"
x=$(cat /etc/centos-release)
echo $x
echo "***************"
#It should install clamav antivirus. If the antivirus is already installed or running, the script should stop and uninstall the software before it install a fresh one.
if  rpm -eq clamav; then
 echo "clamav instalado"
else
 sudo yum install https://www.clamav.net/downloads/production/clamav-0.104.1.linux.x86_64.rpm
fi
echo "***************"
#Script should install EPEL repositories only for CENTOS v7 servers
echo $CENTOS
if  $CENTOS  = 'VERSION="7"' ;then
 echo "Centos 8"
else
 sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
fi
echo "***************"
#Finally, script should be capable to update all packages having an available update in the repositories.
echo "Actualizando"
y=$(yum check-update)
echo $y
if $y ="";then
 echo "No hay que actualizar"
else
 echo "Actualizando"
 sudo yum -y update
fi
