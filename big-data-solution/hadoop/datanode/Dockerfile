FROM hadoop-base

HEALTHCHECK CMD curl -f http://localhost:9864/ || exit 1

ENV HDFS_CONF_dfs_datanode_data_dir=file:///hadoop/dfs/data
RUN mkdir -p /hadoop/dfs/data
VOLUME /hadoop/dfs/data

ADD run.sh /run.sh
RUN chmod a+x /run.sh

#newyly added:
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
    
EXPOSE 9864

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/run.sh"]
