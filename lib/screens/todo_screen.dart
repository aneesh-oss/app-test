import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../widgets/todo_tile.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final List<Todo> todos = [];

  void _addTodo(String title) {
    setState(() {
      todos.add(Todo(id: DateTime.now().toString(), title: title, status: "Open"));
    });
  }

  void _deleteTodo(String id) {
    setState(() {
      todos.removeWhere((todo) => todo.id == id);
    });
  }

  void _updateStatus(Todo todo) {
    const statuses = ["Open", "In Progress", "Completed", "Failed"];
    final currentIndex = statuses.indexOf(todo.status);
    final newStatus = statuses[(currentIndex + 1) % statuses.length];
    setState(() {
      todo.status = newStatus;
    });
  }

  void _showAddDialog() {
    String title = '';
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Add ToDo"),
        content: TextField(onChanged: (val) => title = val),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Cancel")),
          TextButton(onPressed: () {
            if (title.isNotEmpty) _addTodo(title);
            Navigator.pop(ctx);
          }, child: const Text("Add")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My ToDos")),
      body: ListView(
        children: todos.map((todo) => TodoTile(
          todo: todo,
          onDelete: () => _deleteTodo(todo.id),
          onUpdateStatus: () => _updateStatus(todo),
        )).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
