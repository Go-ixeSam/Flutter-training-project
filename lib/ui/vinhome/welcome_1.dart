import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_croceries/constants/assets.dart';
import 'package:online_croceries/constants/vin_color.dart';
import 'package:online_croceries/widgets/transparent_status_bar.dart';
import 'package:online_croceries/widgets/welcome_image.dart';
import "../../widgets/vi_text.dart";

class WelcomeOne extends StatefulWidget {
  const WelcomeOne({Key? key}) : super(key: key);

  @override
  _WelcomeOneState createState() => _WelcomeOneState();
}

class _WelcomeOneState extends State<WelcomeOne> {
  @override
  Widget build(BuildContext context) {
    int margin = 40;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Text(
                    "Bỏ qua",
                    style: TextStyle(color: Color(VinColor.grey)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            ViText("Mừng khai trương"),
            ViText("rinh quà hạnh phúc"),
            SizedBox(
              height: 30,
            ),
            WelcomeImage(Assets.one)
          ],
        ),
      ),
      value: getTransparentStatusBarWithBlackIcon(),
    );
  }
}
