import 'package:flutter/material.dart';
import 'package:solid/services/task_service.dart';

class TaskList extends StatefulWidget {
  final TaskService taskService;

  const TaskList({super.key, required this.taskService});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    final tasks = widget.taskService.getTasks();

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];

        return ListTile(
          title: Text(task.title),
          trailing: IconButton(
            icon: Icon(task.isCompleted
                ? Icons.check_box
                : Icons.check_box_outline_blank),
            onPressed: () {
              final updatedTask = task.copyWith(isCompleted: !task.isCompleted);
              widget.taskService.updateTask(updatedTask);
              setState(() {});
            },
          ),
          onLongPress: () {
            widget.taskService.removeTask(task.id);
            setState(() {});
          },
        );
      },
    );
  }
}
