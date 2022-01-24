import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_croceries/constants/assets.dart';
import 'package:online_croceries/constants/vin_color.dart';
import 'package:online_croceries/widgets/transparent_status_bar.dart';
import 'package:online_croceries/widgets/welcome_image.dart';
import "../../widgets/vi_text.dart";

class WelcomeTwo extends StatefulWidget {
  const WelcomeTwo({Key? key}) : super(key: key);

  @override
  _WelcomeTwoState createState() => _WelcomeTwoState();
}

class _WelcomeTwoState extends State<WelcomeTwo> {
  @override
  Widget build(BuildContext context) {
    int margin=40;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Text("Bỏ qua",style: TextStyle(
                        color: Color(VinColor.grey)
                    ),),
                  ),
                ],
              ),
              SizedBox(height: 40,),
              ViText("Điểm hẹn niềm vui mới"),
              ViText("--Vincomn Sơn la--"),
              SizedBox(height: 30,),
              WelcomeImage(Assets.two)
            ],
          ),
        ),
      ),
      value: getTransparentStatusBarWithBlackIcon(),
    );
  }
}
