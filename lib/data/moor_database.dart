import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 200)();
  TextColumn get contactNumber => text().withLength(min: 1, max: 10)();
  TextColumn get villageName => text().withLength(min: 1, max: 20)();
  TextColumn get districtName => text().withLength(min: 1, max: 20)();
  TextColumn get identityProof => text()();
  TextColumn get signature => text()();
  // DateTimeColumn get time =>
  //     dateTime().withDefault(Constant(DateTime.now()))();
}

@UseMoor(tables: [Tasks])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(
          FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite',
            logStatements: true,
          ),
        );
  @override
  int get schemaVersion => 1;

  Future<List<Task>> getAllTask() => select(tasks).get();

  Stream<List<Task>> watchAllTask() => select(tasks).watch();

  Future<int> insertTask(Task task) => into(tasks).insert(task);

  Future updateTask(Task task) => update(tasks).replace(task);

  Future deleteTask(Task task) => delete(tasks).delete(task);

  Future<int> addEntry(TasksCompanion entry) {
    return into(tasks).insert(entry);
  }
}
