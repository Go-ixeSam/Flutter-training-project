import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_croceries/constants/assets.dart';
import 'package:online_croceries/widgets/green_button_widget.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double imageSize = 150;
    return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(18))),
        content: Container(
          height: 220,
          child: Column(children: [
            SizedBox(height: 18),
            Container(
              height: imageSize,
              width: imageSize,
              child: Image.asset(Assets.green_success),
            ),
            SizedBox(height:20),
            Text("Success", style:TextStyle(
              color:HexColor("#1ABC9C"),
              fontSize: 20,
              fontWeight:FontWeight.bold
            ))
          ]),
        ));
  }

}
