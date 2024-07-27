import 'package:flutter/material.dart';
import 'package:solid/repositories/task_repository.dart';
import 'package:solid/screens/task_screen.dart';
import 'package:solid/services/task_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskScreen(
        taskService: TaskService(InMemoryTaskRepository()),
      ),
    );
  }
}
