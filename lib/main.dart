import 'package:flutter/material.dart';
import 'package:todo_list/todo_list_page.dart';

void main() {
  runApp(const TodoList());
}

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const TodoHome(title: 'Flutter Demo Home Page'),
    );
  }
}

class TodoHome extends StatefulWidget {
  const TodoHome({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  @override
  Widget build(BuildContext context) {
    return const TodoListPage();
  }
}
