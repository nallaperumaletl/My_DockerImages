FROM ubuntu:22.04

#Moving in PySpark/Hadoop test to the container(Write/Reading dataframe)
COPY test.py /

ENV DEBIAN_FRONTEND=noninteractive

RUN sed -i -e "s|http://archive.ubuntu.com|http://jp.archive.ubuntu.com|g" /etc/apt/sources.list \
 && apt-get -qq update  \
 && DEBIAN_FRONTEND=noninteractive apt-get -qq install --no-install-recommends \
      openjdk-11-jdk \
      net-tools \
      curl \
      netcat-traditional \
      gnupg \
      libsnappy-dev \
      nano \
      wget \
    && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y make build-essential libssl-dev zlib1g-dev \
       libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
       libncurses5-dev libncursesw5-dev xz-utils tk-dev
RUN wget https://www.python.org/ftp/python/3.9.9/Python-3.9.9.tgz
RUN tar xzf Python-3.9.9.tgz
RUN cd Python-3.9.9 && ./configure --enable-optimizations && make -j 8 && make altinstall

RUN apt-get install -y python3-pip
RUN pip3 install --no-cache-dir --upgrade pyspark
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 10

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

RUN curl -O https://dist.apache.org/repos/dist/release/hadoop/common/KEYS

RUN gpg --import KEYS

ENV HADOOP_VERSION=3.4.1
ENV HADOOP_URL=https://downloads.apache.org/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz

RUN set -x \
    && curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
    && curl -fSL "$HADOOP_URL.asc" -o /tmp/hadoop.tar.gz.asc \
    && gpg --verify /tmp/hadoop.tar.gz.asc \
    && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
    && rm /tmp/hadoop.tar.gz*

RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop

RUN mkdir /opt/hadoop-$HADOOP_VERSION/logs

RUN mkdir /hadoop-data

ENV HADOOP_HOME=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV MULTIHOMED_NETWORK=1
ENV USER=root
ENV PATH=$HADOOP_HOME/bin/:$PATH
# ENV PATH $HADOOP_HOME/bin/:$PATH

ADD entrypoint.sh /entrypoint.sh

RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
