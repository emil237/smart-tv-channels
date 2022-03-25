#!/bin/sh

#wget -q "--no-check-certificate" https://raw.githubusercontent.com/emil237/smart-tv-channels/main/installer.sh -O - | /bin/sh

version=1.1
#############################################################
TEMPATH=/tmp
MY_IPK="enigma2-plugin-extensions-stvcl_1.1_all.ipk"
MY_DEB="enigma2-plugin-extensions-stvcl_1.1_all.deb"
MY_URL="https://raw.githubusercontent.com/emil237/smart-tv-channels/main"
# remove old version #
rm -rf /usr/lib/enigma2/python/Plugins/Extensions/stvcl

echo ""
# Download and install plugin
cd /tmp
set -e
     wget "$MY_URL/$MY_IPK"
  wait
     wget "$MY_URL/$MY_DEB"

 if which dpkg > /dev/null 2>&1; then
		dpkg -i --force-overwrite $MY_DEB; apt-get install -f -y
	else
		opkg install --force-overwrite $MY_IPK
	fi
echo "================================="
set +e
cd ..
wait
rm -f /tmp/$MY_IPK
rm -f /tmp/$MY_DEB
	if [ $? -eq 0 ]; then
echo ">>>>  SUCCESSFULLY INSTALLED <<<<"
fi
		echo "********************************************************************************"
echo "   UPLOADED BY  >>>>   EMIL_NABIL "   
sleep 4;
		echo ". >>>>         RESTARING     <<<<"
echo "**********************************************************************************"
wait
killall -9 enigma2
exit 0
