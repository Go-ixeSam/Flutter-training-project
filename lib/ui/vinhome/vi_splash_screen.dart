import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_croceries/constants/assets.dart';
import 'package:online_croceries/constants/vin_color.dart';

class SplashScreenVi extends StatefulWidget {
  const SplashScreenVi({Key? key}) : super(key: key);

  @override
  _SplashScreenViState createState() => _SplashScreenViState();
}

class _SplashScreenViState extends State<SplashScreenVi> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: Scaffold(
        body: _getBody(context),
      ),
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
  }
}

_getBody(BuildContext context) {
  double backDropBlur = 40;
  return Container(
    color: Color(VinColor.red),
    child: Center(child: Image.asset(Assets.vin_logo)),
  );
}
