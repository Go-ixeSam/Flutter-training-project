import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:online_croceries/constants/vin_color.dart';
import 'package:online_croceries/stores/form/form_store.dart';
import 'package:online_croceries/stores/testing/pos_store.dart';
import 'package:online_croceries/widgets/CustomCheckBox.dart';
import 'package:online_croceries/widgets/green_button_widget.dart';
import 'package:online_croceries/widgets/textfield_widget.dart';
import 'package:online_croceries/widgets/type_login.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

import 'login_util_class/selectedButton.dart';

class ViSignIn extends StatefulWidget {
  const ViSignIn({Key? key}) : super(key: key);

  @override
  _ViSignInState createState() => _ViSignInState();
}
late PosStore _posStore;



class _ViSignInState extends State<ViSignIn> {
  SelectedButton selected = SelectedButton("email");
  final _store = FormStore();
  TextEditingController _pass = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _userName = TextEditingController();
  TextEditingController _confirmPass = TextEditingController();
  double? typeButton = 25;
  bool? isShowPass = true;
  bool? isShowConfirmPass = true;

  VoidCallback? changeButton(String buttonName) {
    developer.log('sam', name: 'page', error: buttonName);
    setState(() {
      selected = SelectedButton(
        buttonName,
      );
    });
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _posStore=Provider.of<PosStore>(context);
    if (!_posStore.loading) {
      _posStore.getPos();
    }
  }

  VoidCallback? showPass() {
    setState(() {
      isShowPass = !isShowPass!;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool _onEditing = true;
    String _code;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus
          ?.unfocus(), //todo: remove focus on textField wwhen click outside
      child: Scaffold(
          resizeToAvoidBottomInset:
              false, // todo: remove unbounded error when keyboard appear
          body: Padding(
            padding: EdgeInsets.only(left: typeButton!, right: typeButton!),
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: Text(
                      "????ng k??",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TypeLogin(
                    changeButton: (buttonName) => changeButton(buttonName),
                    selected: selected,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  buildNameInput(),
                  SizedBox(
                    height: 25,
                  ),
                  buildEmailInput(),
                  SizedBox(
                    height: 25,
                  ),
                  buildPassword(isShowPass!),
                  SizedBox(
                    height: 25,
                  ),
                  buildPasswordConfirm(isShowConfirmPass!),
                  SizedBox(
                    height: 15,
                  ),
                  buildVinPolicy(),
                  SizedBox(
                    height: 30,
                  ),
                  RedButton(() {}, "????ng k??"),
                  SizedBox(
                    height: 24,
                  ),
                  RichText(
                      text: TextSpan(
                          style: TextStyle(color: Colors.grey),
                          children: [
                        TextSpan(text: "???? c?? t??i kho???n, vui l??ng ????ng nh???p "),
                        TextSpan(
                            text: " t???i ????y",
                            style: TextStyle(color: Color(VinColor.red))),
                      ]))
                ]),
          )),
    );
  }

  buildVinPolicy() {
    return Row(
      children: [
        CustomCheckBox(
          isChecked: false,
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(style: TextStyle(color: Colors.grey), children: [
              TextSpan(text: "T??i ho??n to??n ?????ng ?? v???i"),
              TextSpan(
                  text: " ??i???u kho???n ",
                  style: TextStyle(color: Color(VinColor.red))),
              TextSpan(text: "v??")
            ])),
            RichText(
                text: TextSpan(style: TextStyle(color: Colors.grey), children: [
              TextSpan(
                  text: "Ch??nh s??ch ",
                  style: TextStyle(color: Color(VinColor.red))),
              TextSpan(text: "c???a My Vincom")
            ]))
          ],
        )
      ],
    );
  }

  buildNameInput() {
    return Observer(builder: (contex) {
      String? error = _store.formErrorStore.userName;
      bool? isNameValid =
          error == null && _userName.text != ""; //todo: true mean good
      return ViTextFormField(
        hint: "T??n ?????y ????? c???a b???n ",
        inputType: TextInputType.name, //todo: loai input dc dung la kieu email
        inputAction: TextInputAction
            .next, //todo: coi giai thich trong C??ch t???o custom textField hay textFormField
        prefix: Icon(Icons.account_circle),
        onChanged: (value) {
          _store.setUserName(_userName.text);
        },
        surfix: isNameValid == true
            ? Icon(
                Icons.done,
                color: Colors.green,
              )
            : Visibility(visible: false, child: Icon(Icons.done)),
        textController: _userName,
        errorText: error,
      );
    });
  }

  buildEmailInput() {
    return Observer(builder: (contex) {
      String? error = _store.formErrorStore.userEmail;
      bool? isEmailValid =
          error == null && _email.text != ""; //todo: true mean good
      return ViTextFormField(
        hint: "?????a ch??? email",
        inputType:
            TextInputType.emailAddress, //todo: loai input dc dung la kieu email
        inputAction: TextInputAction
            .next, //todo: coi giai thich trong C??ch t???o custom textField hay textFormField
        prefix: Icon(Icons.email),
        onChanged: (value) {
          _store.setUserId(_email.text);
        },
        surfix: isEmailValid == true
            ? Icon(
                Icons.done,
                color: Colors.green,
              )
            : Visibility(visible: false, child: Icon(Icons.done)),
        textController: _email,
        errorText: error,
      );
    });
  }

  buildPassword(bool isShowPass) {
    return Observer(
      builder: (context) {
        return ViTextFormField(
          prefix: Icon(Icons.lock),
          hint: "M???t kh???u",
          isObscure: isShowPass,
          surfix: IconButton(
            icon: Icon(
                isShowPass == false ? Icons.visibility : Icons.visibility_off),
            onPressed: () => showPass(),
          ),
          errorText: _store.formErrorStore.password,
          textController: _pass,
          onChanged: (value) {
            _store.setPassword(_pass.text);
          },
        );
      },
    );
  }

  buildPasswordConfirm(bool isShowPass) {
    return Observer(
      builder: (context) {
        return ViTextFormField(
          prefix: Icon(Icons.lock),
          hint: "M???t kh???u",
          isObscure: isShowPass,
          surfix: IconButton(
            icon: Icon(
                isShowPass == false ? Icons.visibility : Icons.visibility_off),
            onPressed: () => showPass(),
          ),
          errorText: _store.formErrorStore.confirmPassword,
          textController: _confirmPass,
          onChanged: (value) {
            _store.setPassword(_confirmPass.text);
          },
        );
      },
    );
  }
}
