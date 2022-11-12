import '../models/todo.dart';

class TodoRepository {
  final List<Todo> _items = [
    Todo(title: "Create Todo App", isComplete: true),
    Todo(title: "Study exam", isComplete: false),
    Todo(title: "Take exam", isComplete: false)
  ];

  List<Todo> getAll() {
    return _items;
  }

  void add(String title) {
    _items.add(Todo(title: title, isComplete: false));
  }

  void delete(String title) {
    _items.removeWhere((item) => item.title == title);
  }
}
