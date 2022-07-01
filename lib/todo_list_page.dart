import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<String> _todoList = [];

  void handleAddTodoItem() {
    if (_textEditingController.text.isNotEmpty) {
      setState(() {
        _todoList.add(_textEditingController.text.trim()); //
      });
      _textEditingController.clear();
    }
  }

  void handleClearTodoList() {
    setState(() {
      _todoList.clear();
    });
  }

  void handleDeleteTodoItem(int index) {
    setState(() {
      _todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Super awesome Todo List'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: _textEditingController,
              ),
              SizedBox(
                height: 400,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const Divider(color: Colors.black26),
                  itemCount: _todoList.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(_todoList[index]),
                    onLongPress: () => handleDeleteTodoItem(index),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.deepPurpleAccent,
              onPressed: handleAddTodoItem,
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              backgroundColor: Colors.redAccent,
              onPressed: handleClearTodoList,
              child: const Icon(Icons.clear),
            ),
          ],
        ));
  }
}
