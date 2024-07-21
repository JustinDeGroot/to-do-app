import 'package:todo_app_flutter/models/task.dart';

class Project {
  final String name;
  final List<Task> projectTasks;
  final String backgroundImage;

  Project({
    required this.name,
    required this.projectTasks,
    required this.backgroundImage,
  });
}
