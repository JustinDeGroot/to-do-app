import 'package:flutter/material.dart';
import 'package:todo_app_flutter/models/project.dart';
import 'package:todo_app_flutter/models/task.dart';
import 'dart:collection';

class ProjectData extends ChangeNotifier {
  List<Project> _projects = [
    Project(
        name: "Create Flutter App",
        projectTasks: [
          Task(name: 'Learn flutter', isDone: true),
          Task(name: 'Create boiler plat code', isDone: true),
          Task(name: 'Come up with a good idea'),
          Task(name: 'Start writting code'),
          Task(name: 'Upload to app store'),
        ],
        backgroundImage: "background.jpg"),
    Project(
        name: "Holiday to Amsterdam",
        projectTasks: [
          Task(name: 'Buy plan tickets'),
        ],
        backgroundImage: "background1.jpg"),
    Project(
        name: "Groceries",
        projectTasks: [],
        backgroundImage: "background2.jpg"),
  ];

  /*
  Project selectedProject = Project(
    name: 'name',
    projectTasks: [],
    backgroundImage: 'backgroundImage',
  );

   */

  //int selectedIndex = 0;

  UnmodifiableListView<Project> get projects {
    return UnmodifiableListView(_projects);
  }

  int get projectCount {
    return _projects.length;
  }

  int taskCount(int index) {
    return _projects[index].projectTasks.length;
  }

  double percentageCompleted(int index) {
    int completed = completedTaskCount(index);
    int total = taskCount(index);
    if (completed == 0 && total == 0) {
      return 0.0;
    }
    return completed / total;
  }

  int completedTaskCount(int index) {
    int completed = 0;
    for (Task task in _projects[index].projectTasks) {
      if (task.isDone) {
        completed += 1;
      }
    }
    return completed;
  }

  /*
  void selectProject(int index) {
    selectedProject = _projects[index];
    selectedIndex = index;
    notifyListeners();
  }

   */

  void addProject(String projectTitle, String backgroundImage) {
    _projects.add(Project(
      name: projectTitle,
      projectTasks: [],
      backgroundImage: backgroundImage,
    ));
    notifyListeners();
  }

  void deleteProject(int index) {
    _projects.removeAt(index);
    notifyListeners();
  }

  // --------- TASKS -----------
  void addTaskToProject(int index, String taskTitle) {
    _projects[index].projectTasks.add(Task(name: taskTitle));
    notifyListeners();
    //selectProject(index);
  }

  void deleteTaskFromProject(int taskIndex, int projectIndex) {
    _projects[projectIndex].projectTasks.removeAt(taskIndex);
    //selectedProject.projectTasks.removeAt(taskIndex);
    notifyListeners();
  }

  void finishTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }
}
