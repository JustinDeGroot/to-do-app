import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_flutter/models/project_data.dart';
import 'package:todo_app_flutter/models/task_data.dart';
import 'package:todo_app_flutter/screens/tasks_screen.dart';
import 'screens/projects_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TaskData(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProjectData(),
        ),
      ],
      child: MaterialApp(
        initialRoute: ProjectsScreen.id,
        routes: {
          ProjectsScreen.id: (context) => ProjectsScreen(),
          TasksScreen.id: (context) => TasksScreen(),
        },
        theme: ThemeData(fontFamily: 'RobotoCondensed'),
        //home: ProjectsScreen(),
      ),
    );
  }
}
