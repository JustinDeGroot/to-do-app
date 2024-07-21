import 'package:flutter/material.dart';
import 'package:todo_app_flutter/screens/add_project_screen.dart';
import 'package:todo_app_flutter/widgets/projects_list.dart';

class ProjectsScreen extends StatelessWidget {
  static const String id = 'project_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddProjectScreen(),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello, Justin',
                style: TextStyle(
                  fontSize: 17.0,
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150.0,
                    child: Text(
                      'Your Projects (4)',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage: AssetImage('images/background1.jpg'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: ProjectList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
