import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_croceries/constants/assets.dart';
import 'package:online_croceries/widgets/green_button_widget.dart';
import 'package:online_croceries/widgets/image_background_widget.dart';

class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {

  @override
  Widget build(BuildContext context) {
    double backDropBlur = 30;
    return Scaffold(
      // appBar:TransparentAppBar(
      //   transTitle: ""
      // )
      body: Stack(
        children: [
          Container(
              child: Column(
            children: [
              Flexible(
                  flex: 1,
                  child: ImageBackground(
                    imageName: Assets.blurBackGround,
                  )),
              Flexible(
                flex: 4,
                child: Container(color: Colors.white),
              ),
              Flexible(
                flex: 1,
                child: ImageBackground(imageName: Assets.blurBottomBackGround),
              )
            ],
          )),
          BackdropFilter(
              filter:
                  ImageFilter.blur(sigmaX: backDropBlur, sigmaY: backDropBlur),
              child: Center(child: _bodyMain(context))),
        ],
      ),
    );
  }

  _bodyMain(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 24, right: 24),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 150),
            Container(
                height:200,
                width:200,
                child: Image.asset("${Assets.success}")),
            SizedBox(height: 65),
            Text("Your Order have been", style: TextStyle(fontSize: 28)),
            Text("Accepted", style: TextStyle(fontSize: 28)),
            SizedBox(height: 20),
            Text("Your Order have been placed and is on",
                style: TextStyle(fontSize: 16, color: HexColor("#7C7C7C"))),
            Text("it's way to being processed",
                style: TextStyle(fontSize: 16, color: HexColor("#7C7C7C"))),
            SizedBox(height: 135),
            GreenButtonWidget(onPressed:(){},buttonText: "Track Order"),
            SizedBox(height: 24),
            Text("Back to home", style: TextStyle(fontSize: 18)),
            SizedBox(height:20)
          ]),
        ));
  }

  @override
  void initState() {
    super.initState();
    starTimer();
  }
  starTimer() {
    var _duration = Duration(milliseconds: 3000);
    return Timer(_duration, Navigator.of(context).pop);
  }
}
