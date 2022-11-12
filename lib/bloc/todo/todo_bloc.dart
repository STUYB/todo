import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/todo_repository.dart';

import '../../models/todo.dart';
import 'todo_state.dart';
part 'todo_event.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository repository;

  TodoBloc({required this.repository})
      : super(TodoState(items: repository.getAll())) {
    on<TodoCompletedEvent>((event, emit) {
      event.todo.isComplete = true;
      emit(TodoState(items: repository.getAll()));
    });
    on<TodoUnCompletedEvent>((event, emit) {
      event.todo.isComplete = false;
      emit(TodoState(items: repository.getAll()));
    });
    on<TodoCreatedEvent>((event, emit) {
      repository.add(event.title);
      emit(TodoState(items: repository.getAll()));
    });
    on<TodoDeletedEvent>((event, emit) {
      repository.delete(event.title);
      emit(TodoState(items: repository.getAll()));
    });
  }
}
