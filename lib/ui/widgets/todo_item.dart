import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/todo/todo_bloc.dart';
import '../../models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo item;

  const TodoItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              const BoxShadow(
                  color: Colors.white, blurRadius: 15, offset: Offset(-5, -5)),
              BoxShadow(
                  color: Colors.grey.shade500,
                  blurRadius: 15,
                  offset: Offset(5, 5))
            ]),
        child: Row(
          children: [
            Checkbox(
                value: item.isComplete,
                onChanged: (value) {
                  if (value ?? false) {
                    BlocProvider.of<TodoBloc>(context)
                        .add(TodoCompletedEvent(todo: item));
                  } else {
                    BlocProvider.of<TodoBloc>(context)
                        .add(TodoUnCompletedEvent(todo: item));
                  }
                }),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(item.title,
                  style: TextStyle(
                      decoration:
                          item.isComplete ? TextDecoration.lineThrough : null)),
            ),
            Spacer(),
            Padding(
                padding: const EdgeInsets.all(6.0),
                child: IconButton(
                    onPressed: (() {
                      BlocProvider.of<TodoBloc>(context)
                          .add(TodoDeletedEvent(title: item.title));
                    }),
                    icon: Icon(
                      Icons.delete,
                      color: Colors.grey.shade500,
                    )))
          ],
        ),
      ),
    );
  }
}
