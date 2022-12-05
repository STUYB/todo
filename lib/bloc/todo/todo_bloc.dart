import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/todo_repository.dart';
import '../../models/todo.dart';
import 'todo_state.dart';
part 'todo_event.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository repository;

  TodoBloc({required this.repository}) : super(TodoLoadingState()) {
    repository.notifyOnChange().listen((event) {
      add(TodoListUpdatedEvent());
    });

    on<TodoListUpdatedEvent>((event, emit) async {
      emit(TodoLoadingState());
      await Future.delayed(const Duration(seconds: 4));
      var items = await repository.getAll();
      emit(TodoLoadedState(items: items));
    });

    on<TodoCompletedEvent>((event, emit) async {
      event.todo.isComplete = true;
      var updated = await repository.update(event.todo);
      var items = await repository.getAll();
      emit(TodoLoadedState(items: items));
    });

    on<TodoUnCompletedEvent>((event, emit) async {
      event.todo.isComplete = false;
      var updated = await repository.update(event.todo);
      var items = await repository.getAll();
      emit(TodoLoadedState(items: items));
    });

    on<TodoCreatedEvent>((event, emit) async {
      var todoAdded = await repository.add(event.title);
      var items = await repository.getAll();
      emit(TodoLoadedState(items: items));
    });

    on<TodoDeletedEvent>((event, emit) async {
      var deleted = await repository.delete(event.title);
      var items = await repository.getAll();
      emit(TodoLoadedState(items: items));
    });

    add(TodoListUpdatedEvent());
  }
}
