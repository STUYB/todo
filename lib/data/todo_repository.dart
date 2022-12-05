import 'package:isar/isar.dart';

import '../models/todo.dart';

class TodoRepository {
  late Isar _database;

  TodoRepository() {
    Isar isar = Isar.openSync([TodoSchema]);
    _database = isar;
  }

  Stream<void> notifyOnChange() => _database.todos.watchLazy();

  List<Todo> getAllSync() {
    return _database.todos.where().findAllSync();
  }

  Future<List<Todo>> getAll() {
    return _database.todos.where().findAll();
  }

  void addSync(String title) {
    _database.writeTxnSync(
        () => _database.todos.putSync(Todo(title: title, isComplete: false)));
  }

  Future<void> add(String title) async {
    await _database.writeTxn(() async =>
        await _database.todos.put(Todo(title: title, isComplete: false)));
  }

  void updateSync(Todo todo) {
    _database.writeTxnSync(() => _database.todos.putSync(todo));
  }

  Future<void> update(Todo todo) async {
    await _database.writeTxn(() async => await _database.todos.put(todo));
  }

  void deleteSync(String title) {
    _database.writeTxnSync(() {
      _database.todos.filter().titleEqualTo(title).idProperty().deleteAllSync();
    });
  }

  Future<void> delete(String title) async {
    await _database.writeTxn(() async {
      await _database.todos
          .filter()
          .titleEqualTo(title)
          .idProperty()
          .deleteAll();
    });
  }
}
