import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_croceries/constants/assets.dart';
import 'package:online_croceries/stores/form/form_store.dart';
import 'package:online_croceries/utils/locale/app_localization.dart';
import 'package:online_croceries/utils/routes/routes.dart';
import 'package:online_croceries/widgets/green_button_widget.dart';
import 'package:online_croceries/widgets/image_background_widget.dart';
import 'package:online_croceries/widgets/select_widget.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final _store = FormStore();
  Widget _buildBlurBackground(String imageName, double blur) {
    // final double blur = 100;
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaY: blur, sigmaX: blur),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageName),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _bodyMain(BuildContext context) {
    double selectMargin = 25;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(Assets.mapImage),
            Container(
              padding: EdgeInsets.only(left: selectMargin, right: selectMargin),
              child: Column(
                children: [
                  SizedBox(height: 40.15),
                  _buildStringLocation(context),
                  SizedBox(height: 89.35),
                  _selectInput(context),
                  SizedBox(height: 30),
                  _selectEmptyInput(context),
                  SizedBox(height: 40),
                ],
              ),
            ),
            // SizedBox(height: 40,),
            Container(
                padding:
                    EdgeInsets.only(left: selectMargin, right: selectMargin),
                // margin:EdgeInsets.only(top:40),
                child: GreenButtonWidget(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.login);
                    },
                    buttonText:
                        AppLocalizations.of(context).translate("submit")))
          ],
        ),
      ),
    );
  }

  Widget _selectInput(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context).translate("your_zone"),
              style: TextStyle(
                fontSize: 16,
                color: HexColor("#7C7C7C"),
              )),
        ],
      ),
      _buildSelectZone(),
      // SelectWidget(onChange: _sto,),
    ]);
  }

  Widget _selectEmptyInput(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context).translate("your_are"),
              style: TextStyle(
                fontSize: 16,
                color: HexColor("#7C7C7C"),
              )),
        ],
      ),
      DropdownButton<String>(
          isExpanded: true,
          hint: Text(AppLocalizations.of(context).translate("type_your_are"),
              style: TextStyle(color: HexColor("#B1B1B1"))),
          items: <String>["1", "2", "3"].map((e) {
            return DropdownMenuItem<String>(value: e, child: Text(e));
          }).toList()), // SelectWidget(onChange: _sto,),
    ]);
  }

  Widget _buildSelectZone() {
    return Observer(builder: (context) {
      return SelectWidget(
        onChange: (value) {
          _store.setZoneSelection(value);
        },
        selectContext: _store.zoneSelection,
      );
    });
  }

  Widget _buildStringLocation(BuildContext context) {
    final double margin = 15;
    TextStyle greyString = TextStyle(fontSize: 16, color: HexColor("#7C7C7C"));
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppLocalizations.of(context).translate('select_your_location'),
            style: TextStyle(fontSize: 26, color: Colors.black)),
        SizedBox(height: margin),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context).translate('switch_on'),
                style: greyString),
            Text(AppLocalizations.of(context).translate('what_happen'),
                style: greyString),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    int backDropBlur = 30;
    return Scaffold(
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
              child: Center(child: _bodyMain(context))),
        ],
      ),
    );
  }
}
