FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER wangiegie@gmail.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /pigx-daemon-quartz

WORKDIR /pigx-daemon-quartz

EXPOSE 5002

ADD ./pigx-daemon-quartz/target/pigx-daemon-quartz.jar ./

CMD java -Djava.security.egd=file:/dev/./urandom -jar pigx-daemon-quartz.jar
