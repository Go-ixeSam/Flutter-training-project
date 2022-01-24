import 'package:flutter/material.dart';
import 'package:online_croceries/constants/vin_color.dart';

class ViText extends StatelessWidget {
  final String? content;
  ViText(this.content);
  @override
  Widget build(BuildContext context) {
    return Text(this.content!,style: TextStyle(
      fontSize: 32
    ),
    );
  }
}

class ViTextGrey extends StatelessWidget {
  final String? content;
  ViTextGrey(this.content);

  @override
  Widget build(BuildContext context) {
    return Text(this.content!,style: TextStyle(
        fontSize: 16,
      color: Color(VinColor.grey)
    ),
    );
  }
}

