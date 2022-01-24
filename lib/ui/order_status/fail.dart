import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_croceries/constants/assets.dart';
import 'package:online_croceries/widgets/green_button_widget.dart';

class Fail extends StatelessWidget {
  const Fail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double imageSize = 150;
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18))),
        content: Container(
          height: 420,
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Icon(
                Icons.clear,
                color: Colors.black,
              )
            ]),
            SizedBox(height: 18),
            Container(
              height: imageSize,
              width: imageSize,
              child: Image.asset(Assets.fail),
            ),
            SizedBox(height: 20),
            Text("Oops! Order Fail",
                style: TextStyle(
                  fontSize: 28,
                )),
            SizedBox(height: 20),
            Text("Something went tembly wrong",
                style: TextStyle(fontSize: 16, color: HexColor("#7C7C7C"))),
            SizedBox(height: 30),
            GreenButtonWidget(
              buttonText: "Please Try Again",
              onPressed: () {},
            ),
            SizedBox(height: 10),
            Text("Back to home",
                style: TextStyle(
                  fontSize: 18,
                )),
          ]),
        ));
  }
}
