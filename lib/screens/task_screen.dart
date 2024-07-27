import 'package:flutter/material.dart';
import 'package:solid/models/task.dart';
import 'package:solid/services/task_service.dart';
import 'package:solid/widgets/task_list.dart';

class TaskScreen extends StatefulWidget {
  final TaskService taskService;

  TaskScreen({required this.taskService});

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  void _addTask() {
    final newTask = Task(
      id: DateTime.now().toString(),
      title: 'New Task ${DateTime.now()}',
    );
    widget.taskService.addTask(newTask);
    setState(() {}); // تحديث الواجهة بعد إضافة المهمة
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: TaskList(taskService: widget.taskService),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
