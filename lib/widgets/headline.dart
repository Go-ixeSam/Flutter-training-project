import 'package:flutter/material.dart';
import 'package:online_croceries/constants/vin_color.dart';

class Healine extends StatelessWidget {
  String text;
  Healine({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          Text(this.text,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
        ]),
        Text(
          "Xem tất cả",
          style: TextStyle(color: Color(VinColor.red)),
        )
      ],
    );
  }
}
