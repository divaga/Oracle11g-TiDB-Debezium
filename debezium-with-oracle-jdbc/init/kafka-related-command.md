```
 docker compose exec kafka /opt/kafka_2.13-2.6.0/bin/kafka-console-consumer.sh     --bootstrap-server kafka:9092     --from-beginning     --property print.key=true     --topic server1.TIDB.T_RSHEET_LASTMILE_DETAIL
 ```
