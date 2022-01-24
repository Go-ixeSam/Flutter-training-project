import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TextStyleWidget {
  static buildBlackText() {
    return TextStyle(fontSize: 26, color: Colors.black);
  }

  static buildGreyText() {
    return TextStyle(fontSize: 16, color: HexColor("#7C7C7C"));
  }
}
