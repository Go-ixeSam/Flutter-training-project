import 'package:flutter/material.dart';
import 'package:online_croceries/constants/vin_color.dart';

class BigIcon extends StatelessWidget {
  IconData? iconName;
  BigIcon({this.iconName});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
