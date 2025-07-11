import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:injectable/injectable.dart';

part 'app_database.g.dart';

class Tasks extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get dueDate => dateTime().nullable()();
  TextColumn get priority => text().nullable()();
  TextColumn get status => text()();
  TextColumn get assigneeId => text().nullable()();
  TextColumn get assigneeUsername => text().nullable()();
  TextColumn get assigneeEmail => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Set<Column>> get indexes => [
        {status},
        {assigneeId},
        {dueDate},
      ];
}

class SyncRecords extends Table {
  TextColumn get id => text()(); // sync op id (UUID)
  TextColumn get recordId => text()(); // task id
  TextColumn get feature => text()(); // e.g., 'task'
  TextColumn get operationType => text()(); // create/update/delete
  TextColumn get syncStatus => text()(); // needSync, failed, etc.
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
  TextColumn get operationParamsJson => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Set<Column>> get indexes => [
        {recordId},
        {syncStatus}
      ];
}

@DriftDatabase(tables: [Tasks, SyncRecords])
@LazySingleton()
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Handle future migrations here
        // Ensure SyncRecords table exists
        final hasSyncRecords = await customSelect(
                "SELECT name FROM sqlite_master WHERE type='table' AND name='sync_records';")
            .getSingleOrNull();
        if (hasSyncRecords == null) {
          await m.createTable(syncRecords);
        } else {
          // Add operationParamsJson column if it doesn't exist
          final columns =
              await customSelect("PRAGMA table_info(sync_records);").get();
          final hasOperationParamsJson =
              columns.any((row) => row.data['name'] == 'operation_params_json');
          if (!hasOperationParamsJson) {
            await m.addColumn(syncRecords, syncRecords.operationParamsJson);
          }
        }
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'bloc_arch.db'));
    return NativeDatabase.createInBackground(file);
  });
}
