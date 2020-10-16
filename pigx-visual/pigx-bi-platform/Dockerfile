FROM pig4cloud/java:8-jre

MAINTAINER wangiegie@gmail.com

ENV TZ=Asia/Shanghai
ENV JAVA_OPTS="-Xms128m -Xmx256m -Djava.security.egd=file:/dev/./urandom"

RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN mkdir -p /pigx-bi-platform

WORKDIR /pigx-bi-platform

EXPOSE 5006

ADD ./target/pigx-bi-platform.jar ./

CMD sleep 60;java $JAVA_OPTS -jar pigx-bi-platform.jar
