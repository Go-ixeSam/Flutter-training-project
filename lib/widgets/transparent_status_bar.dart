import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

getTransparentStatusBarWithBlackIcon() {
  return SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark);
}
