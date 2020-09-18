FROM alpine:3.7
USER root

RUN apk --update-cache \
    add musl \
    linux-headers \
    gcc \
    g++ \
    make \
    gfortran \
    openblas-dev \
    python3 \
    python3-dev \
    freetype-dev
    
RUN pip3 install --upgrade pip setuptools
# RUN pip install pandas
# RUN pip install psycopg2

# pythonのパッケージをインストール
COPY requirements.txt /tmp/
RUN pip install numpy
RUN pip install --requirement /tmp/requirements.txt
COPY . /tmp/

