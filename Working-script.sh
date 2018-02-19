#!/bin/bash
set -e
XML_DIR=/home/sgeddada/XMLdata
DEST_DIR=/home/sgeddada/awsxml_shared/prod_b2c/XMLData
BKP_DIR=/home/sgeddada/BKP
DATE=`date +%y%m%d`
YESTERDAY=`date +%y%m%d -d "yesterday"`

sleep 5

cd $XML_DIR ; ls -ltr | echo $YESTERDAY  > /tmp/xml-list.txt

cat /tmp/xml-list.txt | while read list
do
 tar -czf $XML_DIR/$list.tar.gz   $list
echo $list

##Copy archive files from XML directory to Destnation
cp -r $XML_DIR/$list.tar.gz  $DEST_DIR

done

echo "Yesterday xml archives moved  to awsxml_shared"

sleep 2
cd $XML_DIR|pwd

if [ -f "$YESTERDAY.tar.gz" ];
then
    rm $YESTERDAY.tar.gz;rm -r $YESTERDAY

    echo " $(date +%c) ...$YESTERDAY.tar.gz & $YESTERDAY  folder are removed from $XML_DIR...."
else
    echo " $(date +%c) ...$YESTERDAY.tar.gz  file does not exist on $XML_DIR..."
fi

echo "Job Completed Successfully"
