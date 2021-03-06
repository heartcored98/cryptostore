FROM python:3.7.3-stretch

COPY setup.py /

RUN apt install gcc git

RUN pip install --no-cache-dir cython
RUN pip install --no-cache-dir pyarrow
RUN pip install --no-cache-dir redis
RUN pip install --no-cache-dir aioredis

RUN pip install --no-cache-dir git+https://github.com/bmoscon/cryptofeed.git

## Add any extra dependencies you might have
# eg RUN pip install --no-cache-dir boto3
COPY cryptostore /cryptostore

RUN pip install -e .

COPY config-docker-private.yaml /config.yaml

## Add any keys, config files, etc needed here
# COPY access-key.json /

ENTRYPOINT [ "cryptostore" ]
