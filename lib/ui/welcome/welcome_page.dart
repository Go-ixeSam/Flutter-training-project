import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_croceries/constants/assets.dart';
import 'package:online_croceries/constants/strings.dart';
import 'package:online_croceries/ui/components/buttonCommond.dart';
import 'package:online_croceries/utils/routes/routes.dart';

class WellcomePage extends StatefulWidget {
  WellcomePage({Key? key}) : super(key: key);

  @override
  _WellcomePageState createState() => _WellcomePageState();
}

class _WellcomePageState extends State<WellcomePage> {
  @override
  Widget build(BuildContext context) {
    final welcomeBody = Column(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 50.0,
          width: 50.0,
          margin: EdgeInsets.only(top: 30),
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(Assets.iconCarrot),
            ),
          ),
        ),
        Container(
          width: 253,
          margin: EdgeInsets.only(top: 20),
          child: Text(
            Strings.welcomeTitle,
            style: TextStyle(color: Colors.white, fontSize: 48),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 295,
          child: Text(
            Strings.welcomeSubTitle,
            style: TextStyle(color: Colors.grey, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: 30, right: 30, top: 30),
            child: ButtonCommond(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.sign_in_selection);
              },
              title: Strings.welcomeBtnTitle,
            ))
      ],
    );
    return


      Scaffold(
        // appBar: AppBar(),
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.welcomeLogo),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const Expanded(
                flex: 1,
                child: Text(''),
              ),
              Expanded(flex: 1, child: welcomeBody)
            ],
          ),
        ),
      );

  }

  // @override
  // void initState() {
  //   //make the status bar gone
  //   SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   //make the status bar gone
  //   SystemChrome.setEnabledSystemUIOverlays(
  //       [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  //   super.dispose();
  // }
}
