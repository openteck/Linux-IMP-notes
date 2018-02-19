#!/bin/bash
set -e
XML_DIR=/home/tomcat/XMLdata
DEST_DIR=/awsxml_shared/prod_b2c/XMLData
DATE=`date +%y%m%d`
YESTERDAY=`date +%y%m%d -d "yesterday"`
YESTERDAY_TAR_FILE=${YESTERDAY}.tar.gz

cd $XML_DIR |echo $YESTERDAY > /tmp/text.txt


cat /tmp/text.txt | while read list

 do

echo $list

tar -czf  $XML_DIR/$list.tar.gz  $XML_DIR/$list
sleep 10

cp -r $XML_DIR/$list.tar.gz   $DEST_DIR



done

echo "pwd"


#cp -r $XML_DIR/$list.tar.gz   $DEST_DIR


if [ -f "$YESTERDAY.tar.gz" ];
then
    rm $YESTERDAY.tar.gz | rm -rf $list

    echo " $(date +%c) ...$YESTERDAY.tar.gz  file removed from $XML_DIR...."
else
    echo " $(date +%c) ...$YESTERDAY.tar.gz  file does not exist on $XML_DIR..."
fi


#rm -rf $DATE
#echo " $(date +%c) ...$DATE removed on $PREFIX..."
#exit 0
