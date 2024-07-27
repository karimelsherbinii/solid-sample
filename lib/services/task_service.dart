 

import 'package:solid/models/task.dart';
import 'package:solid/repositories/task_repository.dart';

class TaskService {
  final TaskRepository repository;

  TaskService(this.repository);

  List<Task> getTasks() => repository.getTasks();
  void addTask(Task task) => repository.addTask(task);
  void removeTask(String taskId) => repository.removeTask(taskId);
  void updateTask(Task task) => repository.updateTask(task);
}
