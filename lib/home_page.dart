import 'package:flutter/material.dart';
import 'todo.dart';
import 'todo_contorller.dart';

import 'att_todo.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple To Do App With Valuenotifier"),
      ),
      body: ValueListenableBuilder(
          valueListenable: TodoController(),
          builder: (context, value, child) {
            final todos = value as List<Todo>;
            return ListView.builder(
                itemCount: todos.length,
                itemBuilder: ((context, index) {
                  final Todo todo = todos[index];
                  return Dismissible(
                    key: ValueKey(todo.id),
                    onDismissed: ((_) {
                      TodoController().removeATodo(todo);
                    }),
                    child: ListTile(
                      title: Text(todo.description),
                    ),
                  );
                }));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: ((context) => const AddTodo())),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
