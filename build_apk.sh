#!/bin/bash

# [allow permission to run script]
# chmod u+rx build_apk.sh
# [Run the script]
# ./build_apk.sh [env-name]

if [ "$1" = "dev" ];
then
    #clean folder build
    flutter clean
    # flutter pub get
    flutter pub get
    # start build apk for production
    flutter build apk --flavor dev -t lib/main_dev.dart
elif [ "$1" = "pre" ];
then 
    # clean folder build
    flutter clean
    # flutter pub get
    flutter pub get
    # start build apk for production
    flutter build apk --flavor pre -t lib/main_pre.dart
elif [ "$1" = "prod" ];
then 
    # clean folder build
    flutter clean
    # flutter pub get
    flutter pub get
    # start build apk for production
    flutter build appbundle --flavor prod -t lib/main_prod.dart
else   
    echo "Please select a env"
fi

