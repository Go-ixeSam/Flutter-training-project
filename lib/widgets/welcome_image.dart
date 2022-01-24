import 'package:flutter/material.dart';
import 'package:online_croceries/constants/assets.dart';

class WelcomeImage extends StatelessWidget {
  final String? image;
  const WelcomeImage(this.image);

  @override
  Widget build(BuildContext context) {
    double? size=30;
    return Expanded(
        child: Stack(
      children: [
        Center(
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(top: 15, left: size, right: size),
              child: Image.asset(
                Assets.backgroud,
                fit: BoxFit.fill,
              ),
            ),
            width: double.infinity,
          ),
        ),
        Center(
            child: Image.asset(
          image!,
        ))
      ],
    ));
  }
}
