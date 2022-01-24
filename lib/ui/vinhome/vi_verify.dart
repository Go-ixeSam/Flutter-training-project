import 'dart:async';

import 'package:flutter/material.dart';
import 'package:online_croceries/constants/vin_color.dart';
import 'package:online_croceries/widgets/green_button_widget.dart';
import 'package:online_croceries/widgets/transparent_app_bar_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ViVerify extends StatefulWidget {
  const ViVerify({Key? key}) : super(key: key);

  @override
  _ViVerifyState createState() => _ViVerifyState();
}

class _ViVerifyState extends State<ViVerify> {
  StreamController<ErrorAnimationType>? errorController;
  TextEditingController textEditingController = TextEditingController();
  String currentText = "";

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransparentAppBarWithBlackArrow(),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nhập mã xác nhân",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Nhập mã mà chúng tôi đã gửi đến số",
                      style: TextStyle(
                        color: Color(VinColor.grey),
                      ),
                    ),
                    RichText(
                        text: TextSpan(
                            style: TextStyle(color: Color(VinColor.grey)),
                            children: [
                          TextSpan(
                              text: "08081508 ",
                              style: TextStyle(color: Colors.black)),
                          TextSpan(text: "của bạn")
                        ]))
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            buildPinCode(),
            SizedBox(
              height: 50,
            ),
            RedButton((){},"Xác nhận"),
            SizedBox(height: 20,),
            RichText(text: TextSpan(
              style: TextStyle(color: Color(VinColor.grey)),
              children: [
                TextSpan(text:"Chưa nhận được mã? "),
                TextSpan(text:"Gửi lại",style: TextStyle(color: Color(VinColor.red)))
              ]
            ),
            )
          ],
        ),
      ),
    );
  }

  buildPinCode() {
    return PinCodeTextField(
      appContext: context,
      pastedTextStyle: TextStyle(
        color: Color(VinColor.red),
        fontWeight: FontWeight.bold,
      ),
      length: 6,
      obscureText: false,
      // obscuringCharacter: '*',
      // obscuringWidget: FlutterLogo(
      //   size: 24,
      // ),
      blinkWhenObscuring: true,
      animationType: AnimationType.fade,
      validator: (v) {
        if (v!.length < 3) {
          return "Xin hãy điền đủ mã OTP";
        } else {
          return null;
        }
      },
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          fieldHeight: 50,
          fieldWidth: 40,
          activeColor: Color(VinColor.red),
          activeFillColor: Colors.white,
          selectedFillColor: Colors.white,
          selectedColor: Color(VinColor.red),
          inactiveFillColor: Color(VinColor.lightGrey),
          inactiveColor: Color(VinColor.grey)),
      cursorColor: Colors.black,
      animationDuration: Duration(milliseconds: 300),
      enableActiveFill: true,
      errorAnimationController: errorController,
      controller: textEditingController,
      keyboardType: TextInputType.number,
      onCompleted: (v) {
        print("Completed");
      },
      // onTap: () {
      //   print("Pressed");
      // },
      onChanged: (value) {
        print(value);
        setState(() {
          currentText = value;
        });
      },
      beforeTextPaste: (text) {
        print("Allowing to paste $text");
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
    );
  }
}
