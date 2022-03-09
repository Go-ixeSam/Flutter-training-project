import 'package:flutter/material.dart';
import 'package:online_croceries/constants/vin_color.dart';

class BigIcon extends StatelessWidget {
  IconData? iconName;
  VoidCallback? acttion;

  BigIcon({this.iconName,this.acttion});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.acttion,
      child: Container(
        height: 36,
        width: 36,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
              color: Color(VinColor.red),
          border: Border.all(color: Colors.white)
        ),
        child: Center(
          child:Icon(
            iconName,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
