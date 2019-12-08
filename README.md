# postgresql_rls_test

Dummy Datenbank:

```
docker run --rm --name edit-db -p 54321:5432 --hostname primary \
-e PG_DATABASE=edit -e PG_LOCALE=de_CH.UTF-8 -e PG_PRIMARY_PORT=5432 -e PG_MODE=primary \
-e PG_USER=admin -e PG_PASSWORD=admin \
-e PG_PRIMARY_USER=repl -e PG_PRIMARY_PASSWORD=repl \
-e PG_ROOT_PASSWORD=secret \
-e PG_WRITE_USER=gretl -e PG_WRITE_PASSWORD=gretl \
-e PG_READ_USER=ogc_server -e PG_READ_PASSWORD=ogc_server \
-v /tmp:/pgdata \
sogis/oereb-db:latest
```

Connect as `postgres/secret` to drop and create roles.

```
java -jar /Users/stefan/apps/ili2pg-4.3.2/ili2pg-4.3.2.jar --nameByTopic --strokeArcs --defaultSrsCode 2056 --disableValidation  --createEnumTabs --createMetaInfo --createGeomIdx --createFk --createFkIdx --createNumChecks --models PG_RLS_Waldpflege_Erfassung_20191208 --modeldir ".;http://models.geo.admin.ch" --createscript waldpflege.sql --dbschema awjf_waldpflege_erfassung
```

1. `walpflege.sql`
2. `postscript.sql`
3. `rls.sql` (todo: läuft so noch nicht immer durch)