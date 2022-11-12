import '../../models/todo.dart';

/*
@immutable
abstract class TodoState {}

class TodoInitial extends TodoState {
  final List<Todo> items;
  TodoInitial({required this.items});
}

*/

class TodoState {
  List<Todo> items;
  TodoState({required this.items});
}
