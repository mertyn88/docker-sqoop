FROM dvoros/hadoop:3.1.0
MAINTAINER dvoros
RUN addgroup -S lific && adduser -S lific -G lific
USER lific:lific

ENV SQOOP_HOME /usr/local/sqoop

RUN curl -s https://www-eu.apache.org/dist/sqoop/1.4.7/sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz | tar -xz -C /usr/local
RUN ln -s /usr/local/sqoop-1.4.7.bin__hadoop-2.6.0 $SQOOP_HOME

ENV PATH $PATH:$HADOOP_HOME/bin:$SQOOP_HOME/bin

COPY bootstrap.sh /etc/bootstrap.sh
RUN chown lific.lific /etc/bootstrap.sh
RUN chmod 700 /etc/bootstrap.sh

CMD ["/etc/bootstrap.sh"]
