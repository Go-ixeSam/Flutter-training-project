import 'dart:ui';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_croceries/constants/assets.dart';
import 'package:online_croceries/stores/form/form_store.dart';
import 'package:online_croceries/style/text_style.dart';
import 'package:online_croceries/utils/device/device_utils.dart';
import 'package:online_croceries/utils/locale/app_localization.dart';
import 'package:online_croceries/utils/routes/routes.dart';
import 'package:online_croceries/widgets/green_button_widget.dart';
import 'package:online_croceries/widgets/image_background_widget.dart';
import 'package:online_croceries/widgets/textfield_widget.dart';
import 'package:online_croceries/widgets/transparent_app_bar_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  double backDropBlur = 30;
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();

  //focus node
  late FocusNode _passwordFocuseNode;

  @override
  void initState() {
    super.initState();
    _passwordFocuseNode = FocusNode();
  }

  final _store = FormStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:TransparentAppBarWithBlackArrow(),
      body: Stack(
        children: [
          Container(
              child: Column(
            children: [
              Flexible(
                  flex: 1,
                  child: ImageBackground(
                    imageName: Assets.blurBackGround,
                  )),
              Flexible(
                flex: 4,
                child: Container(color: Colors.white),
              ),
              Flexible(
                flex: 1,
                child: ImageBackground(imageName: Assets.blurBottomBackGround),
              )
            ],
          )),
          BackdropFilter(
              filter:
                  ImageFilter.blur(sigmaX: backDropBlur, sigmaY: backDropBlur),
              child: Center(child: _bodyMain(context))),
        ],
      ),
    );
  }

  _bodyMain(BuildContext context) {
    double padding = 25;
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.only(left: padding, right: padding),
          child: Column(
            children: [
              SizedBox(height: 77),
              Center(child: Image.asset(Assets.carrotImage)),
              SizedBox(height: 100),
              Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                AppLocalizations.of(context)
                                    .translate("sign_up"),
                                style: TextStyleWidget.buildBlackText()),
                            SizedBox(height: 15),
                            Text(
                                AppLocalizations.of(context)
                                    .translate("enter_critical"),
                                style: TextStyleWidget.buildGreyText()),
                          ])
                    ]),
                    SizedBox(height: 40),
                    _buildUserNameFeild(),
                    SizedBox(height:30),
                    _buildEmailFeild(),
                    SizedBox(height: 30),
                    _buildPasswordField(),
                    SizedBox(height: 20),
                    Column(children: [
                     Row(
                       children:[
                         Text(
                           AppLocalizations.of(context).translate("continue"),
                           style: TextStyle(fontSize: 14),
                         ),
                         Text(
                           AppLocalizations.of(context).translate("term"),
                           style: TextStyle(fontSize: 14, color: Colors.green),
                         ),
                       ]
                     ),
                 Row(
                   children:[
                     Text(
                       AppLocalizations.of(context).translate("and"),
                       style: TextStyle(fontSize: 14),
                     ),
                     Text(
                       AppLocalizations.of(context).translate("privacy"),
                       style: TextStyle(
                           fontSize: 14,
                           color:Colors.green),
                     )
                   ]
                 )
                    ]),
                    SizedBox(height:30),
                    GreenButtonWidget(
                      onPressed: ()async{
                        if(_store.canRegister){
                          DeviceUtils.hideKeyboard(context);
                          _store.register();
                        }else{
                          _showErrorMessage("Please fill all field");
                        }
                      },
                        buttonText:
                            AppLocalizations.of(context).translate("sign_up"),
                    ),
                    SizedBox(height: 20),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppLocalizations.of(context).translate("no_account"),
                              style: TextStyle(fontSize: 14)),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                AppLocalizations.of(context).translate("log_in"),
                                style: TextStyle(fontSize: 14, color: HexColor("#53B175")),
                              ))
                        ]),
                  ])
            ],
            // )
            // ]
          )),
    );
  }

  Widget _buildEmailFeild() {
    return Observer(
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context).translate("email"),
                    style: TextStyleWidget.buildGreyText()),
              ],
            ),
            SizedBox(height: 10),
            Container(
              child: TextFieldWidget(
                // hint: AppLocalizations.of(context).translate(''),
                inputType: TextInputType.emailAddress,
                textController: _userEmailController,
                inputAction: TextInputAction.next,
                autoFocus: false,
                onChanged: (value) {
                  _store.setUserId(_userEmailController.text);
                },
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_passwordFocuseNode);
                },
                errorText: _store.formErrorStore.userEmail,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildUserNameFeild() {
    return Observer(
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context).translate("username"),
                    style: TextStyleWidget.buildGreyText()),
              ],
            ),
            SizedBox(height: 10),
            Container(
              child: TextFieldWidget(
                // hint: AppLocalizations.of(context).translate(''),
                inputType: TextInputType.name,
                textController: _userNameController,
                inputAction: TextInputAction.next,
                autoFocus: false,
                onChanged: (value) {
                  _store.setUserName(_userNameController.text);
                },
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_passwordFocuseNode);
                },
                errorText: _store.formErrorStore.userName,
              ),
            ),
          ],
        );
      },
    );
  }


  Widget _buildPasswordField() {
    return Observer(
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context).translate("pass"),
                    style: TextStyleWidget.buildGreyText()),
              ],
            ),
            TextFieldWidget(
              isObscure: true,
              padding: EdgeInsets.only(top: 16.0),
              icon: Icons.lock,
              textController: _passwordController,
              focusNode: _passwordFocuseNode,
              errorText: _store.formErrorStore.password,
              onChanged: (value) {
                _store.setPassword(_passwordController.text);
              },
            ),
          ],
        );
      },
    );
  }

  _showErrorMessage(String message) {
    if (message.isNotEmpty) {
      Future.delayed(Duration(milliseconds: 0), () {
        if (message.isNotEmpty) {
          FlushbarHelper.createError(
            message: message,
            title: AppLocalizations.of(context).translate('home_tv_error'),
            duration: Duration(seconds: 3),
          )..show(context);
        }
      });
    }

    return SizedBox.shrink();
  }
}
