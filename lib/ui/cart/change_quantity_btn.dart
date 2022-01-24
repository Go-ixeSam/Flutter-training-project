import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget changeQuantityButton(
        {required Icon? icon, required VoidCallback? onTap}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: Colors.grey.withOpacity(0.5)),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Align(alignment: Alignment.center, child: icon),
      ),
    );
