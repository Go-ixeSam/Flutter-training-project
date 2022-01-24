import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_croceries/constants/assets.dart';
import 'package:online_croceries/constants/vin_color.dart';
import 'package:online_croceries/widgets/transparent_status_bar.dart';
import 'package:online_croceries/widgets/welcome_image.dart';
import "../../widgets/vi_text.dart";

class WelcomeThree extends StatefulWidget {
  const WelcomeThree({Key? key}) : super(key: key);

  @override
  _WelcomeThreeState createState() => _WelcomeThreeState();
}

class _WelcomeThreeState extends State<WelcomeThree> {
  double? size=30;
  @override
  Widget build(BuildContext context) {
    int margin=40;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 40,),
              Visibility(
                visible: false,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Text("Bỏ qua",style: TextStyle(
                      color: Color(VinColor.grey)
                  ),),
                ),
              ),
              SizedBox(height: 40,),
              ViText("Cùng khám phá ngay"),
              SizedBox(height: 8,),
              ViTextGrey("Đặc biệt, phòng chiếu phim thương hạng"),
              ViTextGrey("hiện đại bật nhất của CGV"),
              SizedBox(height: 30,),
          Expanded(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: 15, left: size!, right: size!),
                        child: Image.asset(
                          Assets.backgroud,
                          fit: BoxFit.fill,
                        ),
                      ),
                      width: double.infinity,
                    ),
                  ),
                  Center(
                      child: Container(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(top: 15, left: size!, right: size!),
                          child: Image.asset(
                            Assets.three,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ))
                ],
              ))
            ],
          ),
        ),
      ),
      value: getTransparentStatusBarWithBlackIcon(),
    );
  }
}
