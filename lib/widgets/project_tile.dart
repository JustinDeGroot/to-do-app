import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_flutter/models/project_data.dart';
import 'package:todo_app_flutter/screens/tasks_screen.dart';
import 'package:todo_app_flutter/widgets/progress_bar.dart';
import '../screens/add_task_screen.dart';

class ProjectTile extends StatelessWidget {
  const ProjectTile(
      {super.key,
      required this.backgroundImage,
      required this.name,
      required this.index,
      required this.projectIndex});
  final String name;
  final AssetImage backgroundImage;
  final int index;
  final int projectIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15.0),
      height: 400.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(30.0),
        ),
        image: DecorationImage(
          image: backgroundImage,
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20.0, top: 40.0),
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 45.0,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20.0, top: 30.0),
            child: ProgressBar(
              projectIndex: projectIndex,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, TasksScreen.id,
                        arguments: {'projectIndex': projectIndex});
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 20.0,
                    ),
                    width: 70.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                      color: Colors.white70,
                    ),
                    child: const Icon(
                      Icons.more_horiz,
                      size: 35.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => AddTaskScreen(
                        projectIndex: projectIndex,
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      right: 20.0,
                    ),
                    width: 70.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                      color: Colors.white70,
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 35.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
