 
import 'package:solid/models/task.dart';

abstract class TaskRepository {
  List<Task> getTasks();
  void addTask(Task task);
  void removeTask(String taskId);
  void updateTask(Task task);
}

class InMemoryTaskRepository implements TaskRepository {
  final List<Task> _tasks = [];

  @override
  List<Task> getTasks() => _tasks;

  @override
  void addTask(Task task) {
    _tasks.add(task);
  }

  @override
  void removeTask(String taskId) {
    _tasks.removeWhere((task) => task.id == taskId);
  }

  @override
  void updateTask(Task task) {
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      _tasks[index] = task;
    }
  }
}
