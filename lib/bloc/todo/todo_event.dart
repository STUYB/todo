part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class TodoCompletedEvent extends TodoEvent {
  final Todo todo;
  TodoCompletedEvent({required this.todo});
}

class TodoUnCompletedEvent extends TodoEvent {
  final Todo todo;
  TodoUnCompletedEvent({required this.todo});
}

class TodoCreatedEvent extends TodoEvent {
  final String title;
  TodoCreatedEvent({required this.title});
}

class TodoDeletedEvent extends TodoEvent {
  final String title;
  TodoDeletedEvent({required this.title});
}
