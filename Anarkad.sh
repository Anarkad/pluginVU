#!/bin/sh

rm -rf /tmp/AnarkadLista.zip

cd /tmp/
wget http://myupdater.dyndns-ip.com/jaro-13.zip -q -O /tmp/AnarkadLista.zip
FILE=/tmp/AnarkadLista.zip

if [ -e $FILE ]; then
    size=`ls -l $FILE | sed -e 's/  */ /g' | cut -d' ' -f5`
    if [ $size -le 500 ]; then
        echo "Nieprawidłowy plik $FILE! Spróbuj ponownie później..."
        exit 0
    else
        unzip -o /tmp/AnarkadLista.zip -d /tmp/
        cd /tmp/AnarkadLista
        if [ -f satellites.xml ]; then
            rm -rf /etc/tuxbox/satellites.xml
            mv /tmp/AnarkadLista/satellites.xml /etc/tuxbox/
            cd /etc/enigma2
            rm -rf *.tv
            rm -rf *.radio
            rm -rf blacklist
            rm -rf lamedb
            mv /tmp/AnarkadLista/* /etc/enigma2
			
            rm -rf /tmp/AnarkadLista
            rm -rf /tmp/AnarkadLista.zip
			
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
