import 'package:isar/isar.dart';

part 'todo.g.dart';

@Collection()
class Todo {
  Id id = Isar.autoIncrement;
  String title;
  bool isComplete;
  Todo({required this.title, required this.isComplete});
}
