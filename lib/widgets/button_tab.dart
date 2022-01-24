import 'package:flutter/material.dart';
import 'package:online_croceries/constants/vin_color.dart';

class ButtonTab extends StatelessWidget {
  final Widget? icon;
  ButtonTab({this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 56,
      color: Color(VinColor.red).withOpacity(0.5),
      child: Center(
        child: icon,
      ),
    );
  }
}
