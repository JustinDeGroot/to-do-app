import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_flutter/models/project_data.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({required this.projectIndex});

  final int projectIndex;

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';

    return Container(
      color: const Color(0xFF757575),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.orange,
                fontSize: 30.0,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                newTaskTitle = value;
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              color: Colors.orange,
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  //TasksScreen.newTasks;
                  //print(newTaskTitle);
                  //Provider.of<TaskData>(context, listen: false)
                  //    .addTask(newTaskTitle);
                  Provider.of<ProjectData>(context, listen: false)
                      .addTaskToProject(projectIndex, newTaskTitle);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
