import 'package:flutter/material.dart';
import '../../models/todo.dart';

@immutable
abstract class TodoState {}

class TodoLoadingState extends TodoState {}

class TodoLoadedState extends TodoState {
  final List<Todo> items;
  TodoLoadedState({required this.items});
}
