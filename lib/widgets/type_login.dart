import 'package:flutter/material.dart';
import 'package:online_croceries/constants/vin_color.dart';
import 'package:online_croceries/ui/vinhome/login_util_class/selectedButton.dart';
import 'dart:developer' as developer;


class TypeLogin extends StatelessWidget {
  final SelectedButton? selected;
  final Function(String)? changeButton;
  TypeLogin({this.changeButton,this.selected});

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(29)),
      child: Container(
        color: Color(VinColor.lightGrey),
        padding: EdgeInsets.all(5),
        child: Row(
          children: [
            getTypeLoginButton("Email", selected!, "email", () {
              changeButton!("email");
            }),
            getTypeLoginButton("Số điện thoại", selected!, "phone",
                    () {
                  changeButton!("phone");
                }),
          ],
        ),
      ),
    );
  }
}

getTypeLoginButton(String? text, SelectedButton selected, String buttonName,
    VoidCallback? onChange) {
  bool? result = buttonName == selected.name;
  return Expanded(
    flex: 1,
    child: SizedBox(
      height: 43,
      child: ElevatedButton(
        // onPressed: onChange,
        onPressed: onChange,
        child: Text(
          text!,
          style: TextStyle(
              color: result == true ? Color(VinColor.red) : Colors.grey),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              result == true ? Colors.white : Color(VinColor.lightGrey)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(29))),
          elevation: MaterialStateProperty.all(0),
        ),
      ),
    ),
  );
}

