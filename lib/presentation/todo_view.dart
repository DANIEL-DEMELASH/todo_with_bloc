import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_bloc/presentation/new_todo.dart';
import 'package:todo_with_bloc/presentation/todo_cubit.dart';

import '../domain/models/todo.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});
  
  // void _showAddTodoBox(BuildContext context){
  //   final todoCubit = context.read<TodoCubit>();
  //   final textController = TextEditingController();
    
  //   showDialog(
  //     context: context, 
  //     builder: (context) => AlertDialog(
  //       title: const Text('New Todo'),
  //       content: TextField(
  //         controller: textController,
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.pop(context), 
  //           child: const Text('Cancel')),
  //         TextButton(
  //           onPressed: () {
  //             todoCubit.addTodo(textController.text);
  //             Navigator.pop(context);
  //           }, 
  //           child: const Text('Save')),
  //       ],
  //     )
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      
      floatingActionButton: FloatingActionButton(
        // onPressed: () => _showAddTodoBox(context),
        onPressed: () {
          Navigator.push(
            context, MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => todoCubit,
                child: NewTodoScreen())));
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),
        backgroundColor: Colors.grey,
        child: const Icon(Icons.add), 
      ),
      
      appBar: AppBar(
        title: const Text('Todo with BloC'),
        backgroundColor: Colors.white,
      ),
      
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, todos) {
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index){
              final todo = todos[index];
              return ListTile(
                leading: Checkbox(
                  value: todo.isCompleted, 
                  onChanged: (bool? newValue){
                  todoCubit.toggleTodo(todo);
                }),
                title: Text(todo.text),
                trailing: IconButton(
                  onPressed: () => todoCubit.deleteTodo(todo), 
                  icon: const Icon(Icons.cancel_outlined)),
              );
            }
          );
        },
      ),
    );
  }
}