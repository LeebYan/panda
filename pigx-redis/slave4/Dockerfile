FROM redis

MAINTAINER huangbosbos@gmail.com

COPY redis.conf /usr/local/etc/redis/redis.conf

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone

RUN chmod 777 /usr/local/etc/redis/redis.conf

EXPOSE 6064
EXPOSE 16064

CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]