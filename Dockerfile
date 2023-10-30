FROM adoptopenjdk/maven-openjdk11
COPY build.sh /
COPY aksusbd_8.52-1_amd64.deb /
# RUN dpkg -i aksusbd_8.52-1_amd64.deb
CMD ./build.sh
