import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_flutter/models/project_data.dart';

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({super.key});

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  String newProjectTitle = '';
  String backgroundImage = '';

  @override
  Widget build(BuildContext context) {
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
              'Add Project',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.orange,
                fontSize: 30.0,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(hintText: 'Project Title'),
              onChanged: (value) {
                setState(() {
                  newProjectTitle = value;
                });
              },
            ),
            const SizedBox(
              height: 25.0,
            ),
            const Text(
              'Choose project background',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.orange,
                fontSize: 20.0,
              ),
            ),
            const Text(
              'Scroll right for more ->',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12.0,
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            SizedBox(
              height: 60.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        backgroundImage = 'background.jpg';
                      });
                    },
                    child: const CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('images/background.jpg'),
                    ),
                  ),
                  GestureDetector(
                    child: const CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('images/background1.jpg'),
                    ),
                    onTap: () {
                      setState(() {
                        backgroundImage = 'background1.jpg';
                      });
                    },
                  ),
                  GestureDetector(
                    child: const CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('images/background2.jpg'),
                    ),
                    onTap: () {
                      setState(() {
                        backgroundImage = 'background2.jpg';
                      });
                    },
                  ),
                  GestureDetector(
                    child: const CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('images/background3.jpg'),
                    ),
                    onTap: () {
                      setState(() {
                        backgroundImage = 'background3.jpg';
                      });
                    },
                  ),
                  GestureDetector(
                    child: backgroundImage == 'background4.jpg'
                        ? const CircleAvatar(
                            backgroundColor: Colors.green,
                            radius: 55.0,
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundImage:
                                  AssetImage('images/background4.jpg'),
                            ),
                          )
                        : const CircleAvatar(
                            radius: 50.0,
                            backgroundImage:
                                AssetImage('images/background4.jpg'),
                          ),
                    onTap: () {
                      setState(() {
                        backgroundImage = 'background4.jpg';
                      });
                    },
                  ),
                  GestureDetector(
                    child: const CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('images/background5.jpg'),
                    ),
                    onTap: () {
                      setState(() {
                        backgroundImage = 'background5.jpg';
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Container(
              color: Colors.orange,
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  print(backgroundImage);
                  print(newProjectTitle);
                  if (backgroundImage != '' && newProjectTitle != '') {
                    Provider.of<ProjectData>(context, listen: false)
                        .addProject(newProjectTitle, backgroundImage);
                    Navigator.pop(context);
                  }
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

/*
class AddProjectScreen extends StatelessWidget {
  String newProjectTitle = '';
  String backgroundImage = '';

  @override
  Widget build(BuildContext context) {
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
              'Add Project',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.orange,
                fontSize: 30.0,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(hintText: 'Project Title'),
              onChanged: (value) {
                newProjectTitle = value;
                print(newProjectTitle);
              },
            ),
            const SizedBox(
              height: 25.0,
            ),
            const Text(
              'Choose project background',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.orange,
                fontSize: 20.0,
              ),
            ),
            const Text(
              'Scroll right for more ->',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12.0,
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            SizedBox(
              height: 60.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      backgroundImage = 'background.jpg';
                    },
                    child: const CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('images/background.jpg'),
                    ),
                  ),
                  GestureDetector(
                    child: const CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('images/background1.jpg'),
                    ),
                    onTap: () {
                      backgroundImage = 'background1.jpg';
                    },
                  ),
                  GestureDetector(
                    child: const CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('images/background2.jpg'),
                    ),
                    onTap: () {
                      backgroundImage = 'background2.jpg';
                    },
                  ),
                  GestureDetector(
                    child: const CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('images/background3.jpg'),
                    ),
                    onTap: () {
                      backgroundImage = 'background3.jpg';
                    },
                  ),
                  GestureDetector(
                    child: const CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('images/background4.jpg'),
                    ),
                    onTap: () {
                      backgroundImage = 'background4.jpg';
                      print(newProjectTitle);
                    },
                  ),
                  GestureDetector(
                    child: const CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('images/background5.jpg'),
                    ),
                    onTap: () {
                      backgroundImage = 'background5.jpg';
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Container(
              color: Colors.orange,
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  print(backgroundImage);
                  print(newProjectTitle);
                  if (backgroundImage != '' && newProjectTitle != '') {
                    Provider.of<ProjectData>(context, listen: false)
                        .addProject(newProjectTitle, backgroundImage);
                    Navigator.pop(context);
                  }
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

 */
