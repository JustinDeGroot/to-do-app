import 'package:flutter/material.dart';
import 'package:todo_app_flutter/models/project.dart';
import 'dart:collection';

class ProjectData extends ChangeNotifier {
  List<Project> _projects = [
    Project(
        name: "Holiday to Norway",
        projectTasks: [],
        backgroundImage: "background.jpg"),
    Project(
        name: "Holiday to Amsterdam",
        projectTasks: [],
        backgroundImage: "background1.jpg"),
    Project(
        name: "Groceries",
        projectTasks: [],
        backgroundImage: "background2.jpg"),
  ];

  UnmodifiableListView<Project> get projects {
    return UnmodifiableListView(_projects);
  }

  int get projectCount {
    return _projects.length;
  }

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
}
