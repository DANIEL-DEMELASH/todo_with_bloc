import 'package:todo_with_bloc/domain/models/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> getTodos();
  
  Future<void> addTodo(Todo todo);
  
  Future<void> updateTodo(Todo todo);
  
  Future<void> deleteTodo(Todo todo);
}