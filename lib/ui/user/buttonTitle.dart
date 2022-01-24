// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_croceries/constants/assets.dart';

class ButtonTitle extends StatefulWidget {
  final String title;
  final String icon;
  ButtonTitle({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  _ButtonTitleState createState() => _ButtonTitleState();
}

class _ButtonTitleState extends State<ButtonTitle> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        horizontalTitleGap: 0,
        leading: Container(
          margin: EdgeInsets.only(left: 3),
          height: 20.0,
          width: 18,
          child: SvgPicture.asset(
            widget.icon,
          ),
        ),
        title: Container(
          child: Text(
            widget.title,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
        trailing: SvgPicture.asset(Assets.iconForward),
      ),
    );
  }
}
