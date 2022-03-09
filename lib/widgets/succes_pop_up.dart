import 'dart:async';

import 'package:flutter/material.dart';
import 'package:online_croceries/constants/assets.dart';
import 'package:online_croceries/widgets/green_button_widget.dart';

class ViSuccessDialog extends StatefulWidget {
  const ViSuccessDialog({Key? key}) : super(key: key);

  @override
  _ViSuccessDialogState createState() => _ViSuccessDialogState();
}

class _ViSuccessDialogState extends State<ViSuccessDialog> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    starTimer();
  }

  starTimer() {
    var _duration = Duration(milliseconds: 3000);
    return Timer(_duration, Navigator.of(context).pop);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 72, right: 72),
      child: Column(
        children: [
          Image.asset(Assets.success_vi),
          SizedBox(
            height: 35,
          ),
          Text(
            "Thành công",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text("Bạn đã đăng kí tài khoản My Vincom thành công"),
          SizedBox(
            height: 24,
          ),
          RedButton(() {}, "Đăng nhập")
        ],
      ),
    );
  }
}
