#!/bin/sh

# zakaz modyfikowania skryptu na własną rękę
# zakaz modyfikowania list kanałów i ich późniejsze udostępnianie
# No permission to modify this PLUGIN !!!
# protection by Sancho!!!

rm -rf /tmp/jaro-13.zip

cd /tmp/
wget http://myupdater.dyndns-ip.com/jaro-13.zip -q -O /tmp/jaro-13.zip
FILE=/tmp/jaro-13.zip

if [ -e $FILE ]; then
    size=`ls -l $FILE | sed -e 's/  */ /g' | cut -d' ' -f5`
    if [ $size -le 500 ]; then
        echo "Nieprawidłowy plik $FILE! Spróbuj ponownie później..."
        exit 0
    else
        unzip -o /tmp/jaro-13.zip -d /tmp/
        cd /tmp/jaro-13
        if [ -f satellites.xml ]; then
            rm -rf /etc/tuxbox/satellites.xml
            mv /tmp/jaro-13/satellites.xml /etc/tuxbox/
            cd /etc/enigma2
            rm -rf *.tv
            rm -rf *.radio
            rm -rf blacklist
            rm -rf lamedb
            mv /tmp/jaro-13/* /etc/enigma2
			
            rm -rf /tmp/jaro-13
            rm -rf /tmp/jaro-13.zip
			
			wget -q -O /dev/null http://127.0.0.1/web/servicelistreload?mode=0 2>/dev/null
			echo ""
            echo "Wgrywanie nowej listy kanałów zakończono pomyślnie..."
			echo ""
        else
            echo "Błąd! brak listy! Spróbuj ponownie później..."
        fi
   fi
else
    echo "Błąd! brak pliku listy kanałów! Spróbuj ponownie później..."
fi