FROM hadoop-base

HEALTHCHECK CMD curl -f http://localhost:8042/ || exit 1

ADD run.sh /run.sh
RUN chmod a+x /run.sh

#newyly added:
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh


#newyly added:
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8042

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/run.sh"]
