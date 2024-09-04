import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_bloc/domain/repository/todo_repository.dart';
import 'package:todo_with_bloc/presentation/todo_cubit.dart';

import 'todo_view.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key, required this.todoRepository});
  
  final TodoRepository todoRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(todoRepository),
      child: const TodoView(),
    );
  }
}