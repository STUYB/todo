import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/todo/todo_bloc.dart';
import '../../bloc/todo/todo_state.dart';
import 'todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
      if (state is TodoLoadedState) {
        return _todoItemsLoaded(context, state);
      }
      return _todoItemsLoading(context);
    });
  }
}

Widget _todoItemsLoading(BuildContext context) {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

Widget _todoItemsLoaded(BuildContext context, TodoLoadedState state) {
  return ListView.builder(
    itemCount: state.items.length,
    itemBuilder: (context, index) => TodoItem(item: state.items[index]),
  );
}
