FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER wangiegie@gmail.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /pigx-daemon-elastic

WORKDIR /pigx-daemon-elastic

EXPOSE 5002

ADD ./pigx-visual/pigx-daemon-elastic/target/pigx-daemon-elastic.jar ./

CMD java -Djava.security.egd=file:/dev/./urandom -jar pigx-daemon-elastic.jar
