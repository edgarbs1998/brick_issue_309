import 'package:brick_issue_309/brick/brick.g.dart';
import 'package:brick_issue_309/brick/db/schema.g.dart';
import 'package:brick_offline_first_with_rest/offline_first_with_rest.dart';
import 'package:brick_sqlite/sqlite.dart';
import 'package:sqflite/sqflite.dart' show databaseFactory;

class DataRepository extends OfflineFirstWithRestRepository {
  DataRepository({required this.endpoint})
      : super(
          migrations: migrations,
          restProvider: RestProvider(
            endpoint,
            modelDictionary: restModelDictionary,
          ),
          sqliteProvider: SqliteProvider(
            'brick_offline_first.sqlite',
            databaseFactory: databaseFactory,
            modelDictionary: sqliteModelDictionary,
          ),
          offlineQueueManager: RestRequestSqliteCacheManager(
            'brick_offline_queue.sqlite',
            databaseFactory: databaseFactory,
          ),
        );

  final String endpoint;
}
