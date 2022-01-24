import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:online_croceries/constants/assets.dart';
import 'package:online_croceries/utils/routes/routes.dart';
import 'package:online_croceries/widgets/image_background_widget.dart';
import 'package:online_croceries/widgets/transparent_app_bar_widget.dart';

class VerificationScreen extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();

  VerificationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int backDropBlur=30;
    return Scaffold(
    appBar: TransparentAppBarWithBlackArrow(),
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
              child: Column(
                children: [
                  Flexible(
                      flex: 1,
                      child: ImageBackground(imageName: Assets.blurBackGround,)
                  ),
                  Flexible(
                    flex: 4,
                    child:
                    Container(
                        color:Colors.white
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ImageBackground(imageName: Assets.blurBottomBackGround,),)
                ],
              )),
          BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: backDropBlur.toDouble(),
                  sigmaY: backDropBlur.toDouble()
              ),
              child: Center(child: _buildMain())),

          Positioned(
            bottom: 20.0,
            left: 20.0,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Resend Code',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w400,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.location);
        },
        child: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 20.0,
        ),
        backgroundColor: Colors.green[600],
        elevation: 0.0,
      ),
    );
  }

  _buildMain() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Enter your 4-digit code',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 30.0),
          Text(
            'Code',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextField(
            controller: textEditingController,
            cursorColor: Colors.grey,
            cursorHeight: 21,
            keyboardType: TextInputType.number,
            obscureText: true,
            obscuringCharacter: '-',
            decoration: const InputDecoration(border: InputBorder.none),
          ),
          Divider(thickness: 0.5, height: 0.0, color: Colors.grey[700]),
        ],
      ),
    );
  }
}
