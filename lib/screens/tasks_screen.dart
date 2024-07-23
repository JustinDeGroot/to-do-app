import 'package:flutter/material.dart';
import 'package:todo_app_flutter/models/project_data.dart';
import 'package:todo_app_flutter/screens/projects_screen.dart';
import 'package:todo_app_flutter/widgets/progress_bar.dart';
import 'package:todo_app_flutter/widgets/task_list.dart';
import 'package:todo_app_flutter/screens/add_task_screen.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  static const String id = 'tasks_screen';

  //TasksScreen({required this.projectIndex});

  //late final int projectIndex;

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    int projectIndex = arguments['projectIndex'];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen(
              projectIndex: projectIndex,
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
              ),
              image: DecorationImage(
                image: AssetImage(
                    "images/${Provider.of<ProjectData>(context).projects[projectIndex].backgroundImage}"),
                fit: BoxFit.cover,
              ),
            ),
            height: MediaQuery.sizeOf(context).height * 0.4,
            child: Container(
              padding: EdgeInsets.only(top: 60.0, left: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      //Navigator.pop(context);
                      Navigator.pushNamed(context, ProjectsScreen.id);
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.white70,
                      radius: 20.0,
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.orange,
                        size: 20.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    Provider.of<ProjectData>(context)
                        .projects[projectIndex]
                        .name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  ProgressBar(
                    projectIndex: projectIndex,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              height: 300.0,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: TasksList(
                projectIndex: projectIndex,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
