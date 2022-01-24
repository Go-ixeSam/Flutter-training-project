import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:online_croceries/constants/assets.dart';
import 'package:online_croceries/stores/form/form_store.dart';
import 'package:online_croceries/ui/verification/verification_screen.dart';
import 'package:online_croceries/ui/signin/number_textfield.dart';
import 'package:online_croceries/utils/routes/routes.dart';
import 'package:online_croceries/widgets/image_background_widget.dart';
import 'package:online_croceries/widgets/textfield_widget.dart';
import 'package:online_croceries/widgets/transparent_app_bar_widget.dart';

class NumberScreen extends StatefulWidget {
  const NumberScreen({Key? key}) : super(key: key);

  @override
  _NumberScreenState createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  int backDropBlur = 30;
  TextEditingController _phoneController = TextEditingController();

  //store
  final _store = FormStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TransparentAppBarWithBlackArrow(),
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
                  child: ImageBackground(
                    imageName: Assets.blurBottomBackGround,
                  ),
                )
              ],
            )),
            BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: backDropBlur.toDouble(),
                    sigmaY: backDropBlur.toDouble()),
                child: Center(child: _buildBody(context))),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              Navigator.of(context).pushNamed(Routes.phone_verification),
          child: const Icon(Icons.arrow_forward_ios_rounded, size: 20.0),
          backgroundColor: Colors.green[600],
          elevation: 0.0,
        ));
  }

  _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Enter your mobile number',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 30.0),
          Text(
            'Mobile Number',
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(child: _builPhoneField()),
        ],
      ),
    );
  }

  Widget _builPhoneField() {
    return Observer(builder: (context) {
      return
        NumberTextField(
        urlImage: 'assets/image/flag_country.png',
        code: 880,
        textEditingController: _phoneController,
        onChanged: (value) {
          _store.setPhone(_phoneController.text.toString());
        },
        error_text: _store.formErrorStore.phone,
      );
    });
  }
}
