import 'package:flutter/material.dart';

class ImageBackground extends StatelessWidget {

  final String? imageName;


  ImageBackground({this.imageName});

  @override
  Widget build(BuildContext context) {
    return    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageName!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
