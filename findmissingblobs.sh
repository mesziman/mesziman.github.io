#!/bin/bash
EXCLUDE_REGEX="^(*.acdb|*.apk|*.b00|*.b01|*.b02|*.b03|*.b04|*.bin|*.cfg|*.cng|*.conf|*.config|*.dat|*.db|*.elf|*.fw|*.jar|*.json|*.mdt|*.mk|*.pem|*.qti|*.qwsp|*.rc|*.so|*.sql|*.tflite|*.txt|*.widevine|*.wmfw|*.xml)"
if [[ $1 =~ $EXCLUDE_REGEX ]]
then
  exit
fi

findwhat=$(readelf -d $1 | grep "\(NEEDED\)" | sed -r "s/.*\[(.*)\]/\1/")
for line in $findwhat
do
    if [[ -z $(find out/target/product/cepheus/ -name $line) ]]
    then
        echo "$1 is missing file: $line";
    fi
done
