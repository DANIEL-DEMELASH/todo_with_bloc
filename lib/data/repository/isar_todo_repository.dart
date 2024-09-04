import 'package:isar/isar.dart';
import 'package:todo_with_bloc/data/models/isar_todo.dart';
import 'package:todo_with_bloc/domain/models/todo.dart';

import '../../domain/repository/todo_repository.dart';

class IsarTodoRepository implements TodoRepository{
  final Isar db;
  
  IsarTodoRepository(this.db);
  
  @override
  Future<List<Todo>> getTodos() async{
    final todos = await db.todoIsars.where().findAll();
    return todos.map((todoIsar) => todoIsar.toDomain()).toList();
  }
  
  @override
  Future<void> addTodo(Todo todo) async{
    final todoIsar = TodoIsar.fromDomain(todo);
    await db.txn(() => db.todoIsars.put(todoIsar));
  }
  
  @override
  Future<void> updateTodo(Todo todo) async{
    final todoIsar = TodoIsar.fromDomain(todo);
    await db.txn(() => db.todoIsars.put(todoIsar));
  }
  
  @override
  Future<void> deleteTodo(Todo todo) async{
    await db.txn(() => db.todoIsars.delete(todo.id));
  }
}

