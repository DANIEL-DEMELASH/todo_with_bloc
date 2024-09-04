import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_bloc/domain/models/todo.dart';
import 'package:todo_with_bloc/domain/repository/todo_repository.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoRepository todoRepository;
  
  TodoCubit(this.todoRepository) : super([]) {
    loadTodos();
  }
  
  Future<void> loadTodos() async {
    final todoList = await todoRepository.getTodos();
    emit(todoList);
  }
  
  Future<void> addTodo(String text) async{
    await todoRepository.addTodo(Todo(id: DateTime.now().microsecondsSinceEpoch, text: text));
    loadTodos();
  }
  
  Future<void> deleteTodo(Todo todo) async{
    await todoRepository.deleteTodo(todo);
    loadTodos();
  }
  
  Future<void> toggleTodo(Todo todo) async{
    final updatedTodo = todo.toggleCompletion();
    await todoRepository.updateTodo(updatedTodo);
    loadTodos();
  }
}