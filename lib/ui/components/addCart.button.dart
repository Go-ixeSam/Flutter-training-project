import 'package:flutter/material.dart';

class AddCartBtn extends StatefulWidget {
  AddCartBtn({Key? key}) : super(key: key);

  @override
  _AddCartBtnState createState() => _AddCartBtnState();
}

class _AddCartBtnState extends State<AddCartBtn> {
  @override
  Widget build(BuildContext context) {
    final button = Material(
      borderRadius: BorderRadius.circular(17),
      color: Colors.green,
      child: InkWell(
        onTap: () {},
        child: const Icon(
          Icons.add,
          size: 25,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(17),
      ),
    );
    return SizedBox(
      width: 45.67,
      height: 45.67,
      child: button,
    );
  }
}
