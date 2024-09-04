import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_with_bloc/data/models/isar_todo.dart';
import 'package:todo_with_bloc/data/repository/isar_todo_repository.dart';
import 'package:todo_with_bloc/domain/repository/todo_repository.dart';
import 'package:todo_with_bloc/presentation/todo_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([TodoIsarSchema], directory: dir.path);
  final isarTodoRepo = IsarTodoRepository(isar);
  
  runApp(MyApp(todoRepository: isarTodoRepo,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.todoRepository});
  final TodoRepository todoRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoPage(todoRepository: todoRepository),
    );
  }
}