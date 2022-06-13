import 'package:flutter/material.dart';
import 'todo.dart';
import 'todo_contorller.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  late final TextEditingController _textEditingController;
  late TodoController _todoController;
  @override
  void initState() {
    _textEditingController = TextEditingController();
    _todoController = TodoController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add todo here"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _textEditingController,
            decoration: const InputDecoration(
              hintText: "Add a todo here",
            ),
          ),
          TextButton(
              onPressed: () {
                _todoController.addATodo(
                  Todo(description: _textEditingController.text),
                );
                Navigator.of(context).pop();
              },
              child: const Text("Click Here"))
        ],
      ),
    );
  }
}
