// ignore_for_file: file_names, prefer_const_constructors, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_croceries/constants/assets.dart';

class ButtonCommond extends StatelessWidget {
  final String title;
  final String? icon;
  final Color? color;
  final VoidCallback? onPressed;
  const ButtonCommond({Key? key, required this.title, this.icon, this.color,this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      onLongPress: onPressed,
      style: ElevatedButton.styleFrom(
        primary: color != null ? color : Color.fromRGBO(83, 177, 117, 1),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                width: 25.0,
                height: 25.0,
                child: icon == null
                    ? Text('')
                    : SvgPicture.asset(Assets.iconLogout),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Container(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    color: color != Color.fromRGBO(242, 243, 242, 1)
                        ? Colors.white
                        : Color.fromRGBO(83, 177, 117, 1),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Container(child: Text('')),
            ),
          ),
        ],
      ),
    );
    return Container(
      height: 67,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: button,
      ),
    );
  }
}
