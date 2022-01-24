import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_croceries/constants/vin_color.dart';

class GreenButtonWidget extends StatelessWidget {
  final String? buttonText;
  final VoidCallback? onPressed;
  // const GreenButtonWidget({Key? key}) : super(key: key);
  GreenButtonWidget({required this.buttonText, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(19),
      child: Container(
        width: double.infinity,
        height: 67,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: HexColor("#53B175")),
          onPressed: onPressed,
          child: Text(buttonText!),
        ),
      ),
    );
  }
}

class RedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;
  const RedButton(this.onPressed,this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(VinColor.red)
        ), onPressed: onPressed,
        child: Text(this.text!),
      ),
    );
  }
}

