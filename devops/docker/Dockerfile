FROM python:3.7.6

COPY docker-entrypoint.sh /
COPY requirements.txt /

RUN pip install --no-cache-dir locustio==0.14.4\
    && chmod +x /docker-entrypoint.sh \
    && mkdir /locust

WORKDIR /locust
EXPOSE 8089 5557 5558

ENTRYPOINT ["/docker-entrypoint.sh"]