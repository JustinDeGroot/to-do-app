import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_flutter/models/project_data.dart';
import 'package:todo_app_flutter/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  TasksList({required this.projectIndex});

  final int projectIndex;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectData>(builder: (context, projectData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final task = projectData.projects[projectIndex].projectTasks[index];
          return TaskTile(
            taskTitle: task.name,
            isChecked: task.isDone,
            checkboxCallback: (value) {
              //projectData.finishTask(task);
            },
            onTap: () {
              projectData.finishTask(task);
            },
            longPress: () {
              projectData.deleteTaskFromProject(index, projectIndex);
            },
          );
        },
        itemCount: projectData.taskCount(projectIndex),
      );
    });
  }
}
