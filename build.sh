#!/bin/bash
cd /src
/svace/bin/svace build --init mvn clean install
/svace/bin/svace analyze