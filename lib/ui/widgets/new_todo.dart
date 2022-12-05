import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/todo/todo_bloc.dart';

class NewTodoItem extends StatefulWidget {
  const NewTodoItem({super.key});

  @override
  State<NewTodoItem> createState() => _NewTodoItemState();
}

class _NewTodoItemState extends State<NewTodoItem> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        decoration: const InputDecoration(
          filled: true,
          fillColor: Color.fromARGB(217, 221, 221, 221),
          hintText: 'New Todo',
        ),
        controller: _controller,
        onSubmitted: (value) {
          _controller.clear();
          BlocProvider.of<TodoBloc>(context)
              .add(TodoCreatedEvent(title: value));
        },
      ),
    );
  }
}
