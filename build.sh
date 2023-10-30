#!/bin/bash
TOKEN='bb98ac24654060d34b8555d0498432d08ae5bd16'
URL='http://paltus.intra.ispras.ru:8081'
NAME='Calculator'

dpkg -i aksusbd_8.52-1_amd64.deb

cd /src

/svace/bin/svace build --init mvn clean install
/svace/bin/svace analyze
echo "--------Going to tar .svace-dir--------"
tar cvpzf svace-dir.tar.gz .svace-dir
echo "--------Deleting .svace-dir--------"
rm -fr .svace-dir

echo "--------Going to process SCA--------" 
/codescoring/johnny scan dir . --project $NAME --create-project --save-results --api_token $TOKEN --api_url $URL --with-hashes --ignore .git
echo "--------All the steps done--------" 