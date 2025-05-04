ARG spark_version="3.5.5"
FROM spark-base

ARG build_date
EXPOSE 8080 7077

CMD bin/spark-class org.apache.spark.deploy.master.Master >> logs/spark-master.out
# CMD ["bin/spark-class", "org.apache.spark.deploy.master.Master", ">>", "logs/spark-master.out"]

