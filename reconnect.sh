#!/bin/bash

echo "                                              "
echo "                    ****                      "
echo "                    *******                   "
echo "                    **********                "
echo "                    ****   ******             "
echo "                    ****      *****           "
echo "           ******   ****   ******             "
echo "              ****************                "
echo "                  ********                    "
echo "              ****************                "
echo "           ******   ****   ******             "
echo "                    ****      *****           "
echo "                    ****   ******             "
echo "                    **********                "
echo "                    *******                   "
echo "                    ****                      "
echo "                                              "
echo "                                              "
echo "        Võimas-Bluetooth-Taasühendaja         "
echo "                                              "
echo ""
read -n 1 -s -r -p "Vajuta suvalist klahvi alustamiseks."
echo -e ""

NUMBER_OF_DEVICES=$(bluetoothctl devices | grep "" -c)

if [ $NUMBER_OF_DEVICES == 0 ]
then
	echo "Ei leia ühtegi seadet :("
else
	echo "Läheduses asuvad bluetooth seadmed:"
	bluetoothctl devices
	echo -e "Kokku: $NUMBER_OF_DEVICES \n"
	TUNE=$(bluetoothctl devices | grep "TUNE500BT" | cut -d " " -f 2 ) 
	if [ -z "$TUNE" ]
		then
			echo -e "Ei leia TUNE500BTd :(.\n"
		else 
                        echo -e "TUNE500BT olemas. Ühendan!\n"
			echo -e "Seadme aadress: $TUNE\n"
			echo "Ühendan"
			bluetoothctl connect $TUNE
		fi
fi

echo ""
read -n 1 -s -r -p "Vajuta suvalist klahvi lõpetamiseks."

