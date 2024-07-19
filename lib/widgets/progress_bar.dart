import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key});

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
          child: const RotatedBox(
            quarterTurns: -1,
            child: LinearProgressIndicator(
              value: 0.7,
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
              '2/${Provider.of<TaskData>(context).taskCount}',
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
