> Print Topic

```
 docker compose exec kafka /opt/kafka_2.13-2.6.0/bin/kafka-console-consumer.sh --bootstrap-server kafka:9092 --from-beginning --property print.key=true --topic server1.TIDB.T_RSHEET_LASTMILE_DETAIL
 ```

> Reset Offset

```
 docker compose exec kafka /opt/kafka_2.13-2.6.0/bin/kafka-consumer-groups.sh --bootstrap-server kafka:9092 --group test-consumer-group --reset-offsets --to-earliest --execute --topic server1.TIDB.T_RSHEET_LASTMILE_DETAIL
```

> Delete Offset Topic

```
 docker compose exec kafka /opt/kafka_2.13-2.6.0/bin/kafka-topics.sh --bootstrap-server kafka:9092  --delete --topic my_connect_offsets
```
