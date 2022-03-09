import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:online_croceries/constants/assets.dart';
import 'package:online_croceries/constants/vin_color.dart';
import 'package:online_croceries/stores/form/form_store.dart';
import 'package:online_croceries/stores/user/user_store.dart';
import 'package:online_croceries/ui/signin/social_button.dart';
import 'package:online_croceries/ui/vinhome/login_util_class/selectedButton.dart';
import 'package:online_croceries/utils/routes/routes.dart';
import 'package:online_croceries/widgets/green_button_widget.dart';
import 'package:online_croceries/widgets/textfield_widget.dart';
import 'package:online_croceries/widgets/transparent_status_bar.dart';
import 'package:online_croceries/widgets/type_login.dart';
import 'package:provider/provider.dart';

class ViLogin extends StatefulWidget {
  const ViLogin({Key? key}) : super(key: key);

  @override
  _ViLoginState createState() => _ViLoginState();
}

class _ViLoginState extends State<ViLogin> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();

  //stor
  final _store = FormStore();
  late UserStore _userStore;

  double? typeButton = 25;
  bool? selectedButton = true;
  SelectedButton selected = SelectedButton("email");
  bool? isShowPass = true;

  VoidCallback? changeButton(String buttonName) {
    developer.log('sam', name: 'page', error: buttonName);
    setState(() {
      selected = SelectedButton(
        buttonName,
      );
    });
  }

  VoidCallback? showPass() {
    setState(() {
      isShowPass = !isShowPass!;
    });
  }

  buildPassword(bool isShowPass) {
    return Observer(
      builder: (context) {
        return ViTextFormField(
          prefix: Icon(Icons.lock),
          hint: "Mật khẩu",
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

  buildEmail() {
    return Observer(builder: (contex) {
      String? error = _store.formErrorStore.userEmail;
      bool? isEmailValid =
          error == null && _email.text != ""; //todo: true mean good
      return ViTextFormField(
        hint: "Địa chỉ email",
        inputType:
            TextInputType.emailAddress, //todo: loai input dc dung la kieu email
        inputAction: TextInputAction
            .next, //todo: coi giai thich trong Cách tạo custom textField hay textFormField
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

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _userStore = Provider.of<UserStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus
            ?.unfocus(), //todo: remove focus on textField wwhen click outside
        child: Scaffold(
          resizeToAvoidBottomInset:
              false, // todo: remove unbounded error when keyboard appear
          body: Padding(
            padding: EdgeInsets.only(left: typeButton!, right: typeButton!),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Center(
                  child: Text(
                    "Đăng nhập",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                buildEmail(),
                SizedBox(
                  height: 15,
                ),
                buildPassword(isShowPass!),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Text(
                        "Quên mật khẩu?",
                        style: TextStyle(color: Color(VinColor.red)),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                RedButton(() {
                Navigator.of(context).pushNamedAndRemoveUntil(Routes.homeVi,(Route<dynamic> route)=>false);
                }, "Đăng nhập"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Chưa có tài khoản?"),
                    TextButton(
                      child: Text(
                        "Đăng ký",
                        style: TextStyle(color: Color(VinColor.red)),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: 28,
                ),
                getSeparateLine(),
                SizedBox(
                  height: 35,
                ),
                SocialButton(
                    icon: Assets.google,
                    label: 'Đăng nhập với Google',
                    color: Color(VinColor.lightGrey),
                    onTap: () {},
                    isRadius: false,
                    textColor: Colors.black),
              ],
            ),
          ),
        ),
      ),
      value: getTransparentStatusBarWithBlackIcon,
    );
  }
}

getSeparateLine() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        color: Color(VinColor.grey),
        height: 1,
        width: 145,
      ),
      Text(
        "Hoặc",
        style: TextStyle(color: Color(VinColor.grey)),
      ),
      Container(
        color: Color(VinColor.grey),
        height: 1,
        width: 145,
      ),
    ],
  );
}
