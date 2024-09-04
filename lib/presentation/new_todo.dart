import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_bloc/presentation/todo_cubit.dart';

class NewTodoScreen extends StatelessWidget {
  NewTodoScreen({super.key});
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Todo'),
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(CupertinoIcons.chevron_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12)
                ),
              ),
            ),
            
            const SizedBox(height: 15),
            
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey.shade300
              ),
              onPressed: (){
                if(textController.text.isNotEmpty){
                  context.read<TodoCubit>().addTodo(textController.text);
                  Navigator.pop(context);  
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('todo can not be empty', 
                        style: TextStyle(color: Colors.red),
                      ), 
                      backgroundColor: Colors.white,));
                }
                
              }, 
              child: const Text('Save', style: TextStyle(color: Colors.black),))
          ],
        ),
      ),
    );
  }
}