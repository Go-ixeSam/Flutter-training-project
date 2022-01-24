// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_croceries/constants/assets.dart';
import 'package:online_croceries/data/sharedpref/constants/preferences.dart';
import 'package:online_croceries/utils/routes/routes.dart';
import 'package:online_croceries/widgets/transparent_app_bar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        // statusBarColor: Colors.transparent,
        // statusBarBrightness: SystemUiOverlayStyle.dark
        // statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        // appBar:TransparentAppBar(transTitle: "") ,
        body: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(83, 177, 117, 1),
          ),
          child: Center(
            child: Container(
              width: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.iconLogo),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
    starTimer();
  }

  starTimer() {
    var _duration = Duration(milliseconds: 2000);
    return Timer(_duration, navigate);
  }

  navigate() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (preferences.getBool(Preferences.is_logged_in) ?? false) {
      Navigator.of(context).pushReplacementNamed(Routes.welcome);
    } else {
      Navigator.of(context).pushReplacementNamed(Routes.welcome);
    }
  }
}
