import 'package:flutter/material.dart';
import '../models/todo.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;
  final Function()? onDelete;
  final Function()? onUpdateStatus;

  const TodoTile({
    super.key,
    required this.todo,
    this.onDelete,
    this.onUpdateStatus,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title),
      subtitle: Text("Status: ${todo.status}"),
      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
        IconButton(onPressed: onUpdateStatus, icon: const Icon(Icons.update)),
        IconButton(onPressed: onDelete, icon: const Icon(Icons.delete)),
      ]),
    );
  }
}
