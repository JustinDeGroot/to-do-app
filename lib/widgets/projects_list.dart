import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_flutter/models/project_data.dart';
import 'package:todo_app_flutter/widgets/project_tile.dart';

class ProjectList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectData>(builder: (context, projectData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final project = projectData.projects[index];
          return ProjectTile(
            name: project.name,
            backgroundImage: AssetImage("images/${project.backgroundImage}"),
          );
        },
        itemCount: projectData.projectCount,
      );
    });
  }
}
