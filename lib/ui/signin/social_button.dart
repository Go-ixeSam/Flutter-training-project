import 'package:flutter/material.dart';

Widget SocialButton({
  String? icon,
  String? label,
  Color? color,
  Color? textColor=Colors.white,
  VoidCallback? onTap,
  bool? isRadius=true,
}) =>
    MaterialButton(
      color: color,
      elevation: 0.0,
      padding: const EdgeInsets.all(20.0),
      clipBehavior: Clip.antiAlias,
      shape: isRadius==true?RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ):RoundedRectangleBorder(),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Image.asset(icon!),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                label ?? 'label',
                style: TextStyle(
                  color: textColor,
                  fontSize: 18.0,
                ),
              ),
            ),
          )
        ],
      ),
      onPressed: onTap,
    );
