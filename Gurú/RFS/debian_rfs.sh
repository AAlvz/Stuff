#!/bin/bash

#########################################################################################################
#### This script is intended for the generation of Debian-based ARM-platform specific root file system.  
#### The resultant root file system created is 'Debian GNU/Linux 5.0.4 "lenny"'
#### The Debian "lenny" Release Information can be found at: http://www.debian.org/releases/lenny/

#### The set of packages installed covers a wide range including wireless, bluetooth, LAMP stack etc.
#### For a complete list of packages for "lenny", please refer to: http://www.debian.org/distrib/packages
#########################################################################################################

## TARGET_DIR will be the working directory for the root file system generation.
TARGET_DIR=${TARGET_DIR:-/mnt/bootstrap/rootfs}
mkdir -p $TARGET_DIR

## CACHE_DIR will hold the package-specific *.deb files if present.
if [ ! -z "$CACHE_DIR" ]
then
	echo "Copying deb cache"
	mkdir -p $TARGET_DIR/var/cache/apt/archives/
	cp -a $CACHE_DIR/*.deb $TARGET_DIR/var/cache/apt/archives/
fi

## Install the 'debootstrap' package on the host system.
apt-get -y --force-yes install debootstrap

# debootstrap is used to create a Debian-based system from scratch, into the subdirectory of another already installed system.
# debootstrap doesn't require the availability of dpkg or apt.
# The resultant directory can then be 'chroot'ed into. 
# (http://packages.debian.org/lenny/debootstrap)
echo "Debootstrapping lenny"
debootstrap --verbose --arch armel --foreign lenny $TARGET_DIR/ http://ftp.debian.org/debian/
if [ $? != 0 ]; then
	echo "Error in debootstrap"
	exit -1
fi
echo "Debootstrap second stage"
chroot $TARGET_DIR/ /debootstrap/debootstrap --second-stage

rm -rf $TARGET_DIR/debootstrap

mount -o bind /dev $TARGET_DIR/dev
mount -o bind /proc $TARGET_DIR/proc
mount -o bind /sys $TARGET_DIR/sys
mount -o bind /dev/pts $TARGET_DIR/dev/pts

## Change root passwd
echo "Setting root password to 'nosoup4u'"
echo -e "nosoup4u\nnosoup4u\n" | chroot $TARGET_DIR/ /usr/bin/passwd root

## Add /dev/ttyS0 as the system terminal
echo "Creating serial console /etc/event.d/ttyS0"
sed -i -e 's/\#T0:23:respawn:\/sbin\/getty -L ttyS0 9600 vt100/T0:23:respawn:\/sbin\/getty 115200 ttyS0/' $TARGET_DIR/etc/inittab

## We do not include eth0 in the 'interfaces' file
## Package 'ifplugd' handles the dynamic interface management 
echo "Enabling DHCP on lo, eth0"
cat > $TARGET_DIR/etc/network/interfaces << EOF
# Used by ifup(8) and ifdown(8). See the interfaces(5) manpage or
# /usr/share/doc/ifupdown/examples for more information.
auto lo
iface lo inet loopback
EOF

## Create a standard /etc/fstab file
cat > $TARGET_DIR/etc/fstab <<EOF
udev                    /dev                    tmpfs   rw,mode=0755            0 0
tmpfs                   /var/cache/apt          tmpfs   rw,noexec,nosuid        0 0
tmpfs                   /dev/shm                tmpfs   rw,nosuid,nodev         0 0
devpts                  /dev/pts                devpts  rw,noexec,nosuid,gid=5,mode=620  0 0
sysfs                   /sys                    sysfs   rw,noexec,nosuid,nodev        0 0
proc                    /proc                   proc    rw,noexec,nosuid,nodev        0 0
EOF

## Change hostname to guruplug-debian
cat > $TARGET_DIR/etc/hostname <<EOF
guruplug-debian
EOF

## Fix dependencies (if there are any problems)
chroot $TARGET_DIR/ /usr/bin/apt-get -y -f install

## Add sources.list file
cat > $TARGET_DIR/etc/apt/sources.list << EOF
deb http://ftp.us.debian.org/debian/ lenny main contrib non-free
deb http://http.us.debian.org/debian stable main contrib non-free
deb http://security.debian.org lenny/updates main contrib non-free
deb http://www.backports.org/debian lenny-backports main contrib non-free
EOF

## localhost and debian are 127.0.0.1
cat > $TARGET_DIR/etc/hosts << EOF
127.0.0.1 localhost
127.0.0.1 debian
127.0.0.1 guruplug-debian
EOF

## Touch the net generator udev so that eth0 won't be reassigned in case the user
## changes the MAC address
touch $TARGET_DIR/etc/udev/rules.d/75-persistent-net-generator.rules

## This is required for hostname resolution below
## Use OpenDNS by default
cat > $TARGET_DIR/etc/resolv.conf <<EOF
nameserver 208.67.222.222
nameserver 208.67.220.220
EOF

## Now update the apt data base
echo "Updating apt database"
chroot $TARGET_DIR/ apt-get update

## Install the locales package and configure it before moving on to installing additional packages.
echo "Installing the locales package"
chroot $TARGET_DIR/ apt-get install locales
chroot $TARGET_DIR/ dpkg-reconfigure locales

#### Package Installation
#### Included here is a collection of packages that covers a set of basic use-cases for GuruPlug (WiFi-BT etc.)
#### Feel free to modify the list as per your requirement. 
#### For a complete list of packages avaialble for lenny please see - http://www.debian.org/distrib/packages
PACKAGE_LIST=""

# Install a bunch of general functionality specific packages
PACKAGE_LIST=`echo ${PACKAGE_LIST} openssh-client openssh-server wget sudo atftp`

# Install mtd-utils - utitlities for manipulating memory technology devices.
PACKAGE_LIST=`echo ${PACKAGE_LIST} mtd-utils`

# Install iptables - contains administrative tools for packet filtering and NAT
PACKAGE_LIST=`echo ${PACKAGE_LIST} iptables`

# Install light-weight dhcp server, web server etc.
PACKAGE_LIST=`echo ${PACKAGE_LIST} dnsmasq udhcpd lighttpd`

# Install the USB-hardware specific packages.
PACKAGE_LIST=`echo ${PACKAGE_LIST} usbmount usbutils`

# Install ifplugd - configuration daemon for ethernet interfaces.
PACKAGE_LIST=`echo ${PACKAGE_LIST} ifplugd`

# Install wifi specific utilities
PACKAGE_LIST=`echo ${PACKAGE_LIST} wireless-tools wpasupplicant`

# Install mysql-server, client
PACKAGE_LIST=`echo ${PACKAGE_LIST} mysql-server mysql-client`

# Install bluetooth related packages - bluez, alsa etc.
PACKAGE_LIST=`echo ${PACKAGE_LIST} bluez bluez-alsa python-bluez alsa-utils python-gobject`

# Install samba.
PACKAGE_LIST=`echo ${PACKAGE_LIST} samba`

# Install ntp.
PACKAGE_LIST=`echo ${PACKAGE_LIST} ntp`

# Install ntfs-3g.
PACKAGE_LIST=`echo ${PACKAGE_LIST} ntfs-3g`

echo "Installing Packages"
chroot $TARGET_DIR/ apt-get -y --force-yes install $PACKAGE_LIST || exit 1
chroot $TARGET_DIR/ /usr/bin/apt-get -y -f install

echo "Performing some cleanups"
chroot $TARGET_DIR/ apt-get autoremove
chroot $TARGET_DIR/ apt-get autoclean
chroot $TARGET_DIR/ pwconv
chroot $TARGET_DIR/ update-rc.d -f udhcpd remove
chroot $TARGET_DIR/ update-rc.d -f dnsmasq remove
chroot $TARGET_DIR/ update-rc.d -f NetworkManager remove
chroot $TARGET_DIR/ update-rc.d -f bluetooth remove

sed -i -e 's/exit 0//' $TARGET_DIR/etc/rc.local

echo "DNSMASQ_OPTS=\"--cache-size=200 --interface=uap0 --listen-address=192.168.1.1\"" >> $TARGET_DIR/etc/default/dnsmasq 
cat >> $TARGET_DIR/etc/rc.local <<EOF

mount -a

# We keep the default date as 08:08, Aug 8 2009. 
DEF_DATE=\`date "+%s" --date="08 Aug 2009 08:08"\`

NOW_DATE=\`date "+%s"\`

if [ \$DEF_DATE -gt \$NOW_DATE ]; then
        date 080808082009
fi

mkdir -p /var/cache/apt/archives/partial

/root/init_setup.sh

EOF

#### Post-Processing of the RootFS
## Create the ifplugd.action script which is executed on link-detect/link-removal events.
cat > $TARGET_DIR/etc/ifplugd/ifplugd.action << EOF
#!/bin/sh
# \$Id: ifplugd.action 43 2003-09-13 11:25:11Z lennart $

# This file is part of ifplugd.
#
# ifplugd is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free
# Software Foundation; either version 2 of the License, or (at your
# option) any later version.
#
# ifplugd is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
# for more details.
#
# You should have received a copy of the GNU General Public License
# along with ifplugd; if not, write to the Free Software Foundation,
# Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.

set -e

case "\$2" in
up)
        run-parts --arg="\$1" --arg="\$2" /etc/ifplugd/action.d/
        dhclient3 -e IF_METRIC=100 -pf /var/run/dhclient.\$1.pid -lf /var/lib/dhcp3/dhclient.\$1.leases \$1
        net time set pool.ntp.org
        ;;
down)
        run-parts --reverse --arg="\$1" --arg="\$2" /etc/ifplugd/action.d/
        if [ -f /var/run/dhclient.\$1.pid ] ; then
            pid=\`cat /var/run/dhclient.\$1.pid\`
            kill -9 \$pid
        fi
        ;;
*)
        echo "ifplugd.action: Incorrect action argument" >&2
        exit 1
        ;;
esac

EOF

## Create the DHCP server configuration file.
cat > $TARGET_DIR/etc/udhcpd.conf << EOF
start 192.168.1.100
end 192.168.1.200
interface uap0
opt      lease  86400
opt     router  192.168.1.1
opt     subnet  255.255.255.0
opt     dns     192.168.1.1
opt     domain     localdomain
max_leases     101
lease_file     /var/lib/udhcpd.leases
auto_time       5

EOF

## Tweak the options required for desired functioning.
chroot $TARGET_DIR/ sed -i -e 's/^FILESYSTEMS=\"/FILESYSTEMS=\"vfat /' /etc/usbmount/usbmount.conf
chroot $TARGET_DIR/ sed -i -e 's/^INTERFACES=\"/INTERFACES=\"eth0 eth1/' /etc/default/ifplugd
chroot $TARGET_DIR/ sed -i -e 's/^HOTPLUG_INTERFACES=\"/HOTPLUG_INTERFACES=\"eth0 eth1/' /etc/default/ifplugd

## The below section echoes the steps required to be taken once the rootfs is generated and you have the firmware,kernel modules etc.
echo "=================================================================================================================================="
echo "Please Perform the following steps once you have the Kernel modules, firmware etc."
echo "(1)Create a directory /lib/firmware/mrvl/. Put the Micro-AP firmware binaries(sd8688_helper.bin & sd8688.bin) at that location."
echo "# chroot $TARGET_DIR/ mkdir -p /lib/firmware/mrvl/"
echo "# chroot $TARGET_DIR/ cp -f sd8688.bin sd8688_helper.bin /lib/firmware/mrvl/"
echo "Also maintain copies of these firmware binaries in /root/firmware/."
echo "These are used by the scripts which do the mode switching from AP -> WLAN client."
echo "# chroot $TARGET_DIR/ mkdir -p /root/firmware/"
echo "# chroot $TARGET_DIR/ cp -f sd8688.bin sd8688_helper.bin /root/firmware/"
echo "(2)Install the Kernel modules to this destination rootfs."
echo "# make -C (KERN_DIR)/ (KERN_CROSS_PREFIX) modules_install INSTALL_MOD_PATH=$TARGET_DIR/"
echo "(3)Put the uaputl binary in the created rootfs."
echo "# chroot $TARGET_DIR/ wget http://<extranet pointer>/uaputl --output-document=/usr/bin/uaputl"
echo "# chroot $TARGET_DIR/ chmod +x /usr/bin/uaputl"
echo "==================================================================================================================================="

#### End - Post-Processing of the RootFS

#### Create the initialization and mode-switch scripts

#### The below script - init_setup.sh will be executed every time when the GuruPlug is booting up. 
#### It ensures that GuruPlug comes up AP mode with a unique SSID value and with Open Security configuration.
cat > $TARGET_DIR/root/init_setup.sh << EOF
#!/bin/sh

# This is called from /etc/rc.local to perform the initial setup.

# We always bootup in AP mode. Delete any stale files

rm -f /etc/wlanclient.mode
SSID=GuruPlug-\`ifconfig uap0 | awk -F ":" '/HWaddr/ {print \$6\$7}'\`

modprobe uap8xxx
ifconfig uap0 192.168.1.1 up
/usr/bin/uaputl sys_cfg_ssid \$SSID
/usr/bin/uaputl bss_start
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

echo 1 > /proc/sys/net/ipv4/ip_forward
/etc/init.d/udhcpd start
/etc/init.d/dnsmasq start
iptables -A INPUT -i uap0 -p tcp -m tcp --dport 80 -j ACCEPT

# Re-enable bluetooth. In the earlier case, it didn't find the firmware.
# rmmod libertas_sdio libertas btmrvl_sdio btmrvl bluetooth 2>/dev/null
rmmod btmrvl_sdio btmrvl

/etc/init.d/bluetooth start

modprobe btmrvl_sdio
hciconfig hci0 up
hciconfig hci0 piscan

# Set leds
echo 1 > \`eval ls /sys/class/leds/guruplug\:green\:health/brightness\`
echo 1 > \`eval ls /sys/class/leds/guruplug\:green\:wmode/brightness\`

EOF

chmod +x $TARGET_DIR/root/init_setup.sh

#### The wlan.sh script is used for switching the mode of GuruPlug from AP to WLAN client.
cat > $TARGET_DIR/root/wlan.sh << EOF
#!/bin/sh

# The firmware files are -> sd8688.bin & sd8688_helper.bin
# The firmware files need to be present in /lib/firmware/

rmmod libertas_sdio libertas
cp /root/firmware/sd8688* /lib/firmware/
/etc/init.d/udhcpd stop
/etc/init.d/dnsmasq stop

echo 2 > /proc/uap/uap0/hwstatus
ifconfig uap0 down
rmmod uap8xxx

modprobe libertas_sdio

# This will be deleted on bootup.
# Bootup by-default is always AP mode.

touch /etc/wlanclient.mode
# Delete the firmware immediately so that next bootup is in AP mode.
rm -f /lib/firmware/sd8688*

# The newly created interface will be wlan(n)

# The following command lists all the available wireless networks
# iwlist <ifc-name> scanning
# To connect to a particular SSID
# iwconfig <ifc-name> <essid>

#Set leds for client mode
echo 0 > \`eval ls /sys/class/leds/guruplug\:green\:wmode/brightness\`
echo 1 > \`eval ls /sys/class/leds/guruplug\:red\:wmode/brightness\`

EOF

chmod +x $TARGET_DIR/root/wlan.sh

#### unmount virtual filesystems
umount $TARGET_DIR/dev/pts
umount $TARGET_DIR/dev
umount $TARGET_DIR/proc
umount $TARGET_DIR/sys

