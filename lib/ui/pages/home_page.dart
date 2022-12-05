import 'package:flutter/material.dart';
import '../widgets/new_todo.dart';
import '../widgets/todo_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: const [
        NewTodoItem(),
        Expanded(
          child: TodoList(),
        )
      ],
    );
  }
}
