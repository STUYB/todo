import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/todo/todo_bloc.dart';
import '../../data/todo_repository.dart';
import '../widgets/todo_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => TodoRepository(),
      child: BlocProvider(
          create: (context) =>
              TodoBloc(repository: context.read<TodoRepository>()),
          child: const TodoList()),
    );
  }
}
