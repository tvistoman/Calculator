#!/bin/bash
dpkg -i aksusbd_8.52-1_amd64.deb

cd /src

/svace/bin/svace build --init mvn clean install
/svace/bin/svace analyze

# tar cvpzf svace-dir.tar.gz .svace-dir
# rm -fr .svace-dir

/codescoring/johnny scan dir . --project $JOB_NAME --create-project --save-results \
--api_token $TOKEN --api_url $URL --with-hashes --ignore .git