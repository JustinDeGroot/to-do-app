import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  var checkboxCallback;
  var longPress;
  var onTap;

  TaskTile({
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallback,
    required this.longPress,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.5,
            color: Colors.grey,
          ),
        ),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Checkbox(
          shape: CircleBorder(),
          activeColor: Colors.grey,
          value: isChecked,
          onChanged: checkboxCallback,
        ),
        title: Text(
          taskTitle,
          style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        onLongPress: longPress,
      ),
    );
  }
}
