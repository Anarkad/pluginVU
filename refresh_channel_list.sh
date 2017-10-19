#!/bin/sh

wget -q -O /tmp/listy_kanalow.cfg http://myupdater.dyndns-ip.com/listy_kanalow.cfg 2>/dev/null


cp /tmp/listy_kanalow.cfg /usr/lib/enigma2/python/Plugins/Extensions/MyUpdater/

		
echo "Odświeżenie daty zakończono pomyślnie..." 


rm -rf /tmp/listy_kanalow.cfg


exit 0
