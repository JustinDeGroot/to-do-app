import 'package:flutter/material.dart';

class BackgroundImageTile extends StatelessWidget {
  BackgroundImageTile(
      {super.key,
      required this.onTap,
      required this.backgroundImage,
      required this.chosenImage});

  var onTap;
  final String backgroundImage;
  final String chosenImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: backgroundImage == chosenImage
          ? CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/$backgroundImage'),
              child: const Icon(
                Icons.check_circle,
                color: Colors.white70,
                size: 40.0,
              ),
            )
          : CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/$backgroundImage'),
            ),
    );
  }
}
