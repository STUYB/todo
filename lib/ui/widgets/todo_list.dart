import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/todo/todo_bloc.dart';
import '../../bloc/todo/todo_state.dart';
import 'new_todo.dart';
import 'todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const NewTodoItem(),
          Expanded(
              child: ListView.builder(
            itemCount: state.items.length,
            itemBuilder: (context, index) => TodoItem(item: state.items[index]),
          ))
          //for (var item in state.items) TodoItem(item: item)
        ],
      );
    });
  }
}
