import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_flutter/models/project_data.dart';
import '../models/task_data.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key, required this.projectIndex});

  final projectIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
          height: 50.0,
          width: 12.0,
          child: RotatedBox(
            quarterTurns: -1,
            child: LinearProgressIndicator(
              value: Provider.of<ProjectData>(context)
                  .percentageCompleted(projectIndex),
              color: Colors.white,
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Column(
          children: [
            Text(
              //'test',
              '${Provider.of<ProjectData>(context).completedTaskCount(projectIndex)}/${Provider.of<ProjectData>(context).taskCount(projectIndex)}',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              'tasks',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
