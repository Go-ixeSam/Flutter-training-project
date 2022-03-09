import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_croceries/constants/assets.dart';
import 'package:online_croceries/widgets/transparent_app_bar_widget.dart';
import 'package:online_croceries/widgets/transparent_status_bar.dart';

class ViPlaceDetail extends StatefulWidget {
  const ViPlaceDetail({Key? key}) : super(key: key);

  @override
  _ViPlaceDetailState createState() => _ViPlaceDetailState();
}

class _ViPlaceDetailState extends State<ViPlaceDetail> {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.yellow,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: TransparentAppBarCustom(Colors.white, [
        Icon(
          Icons.home,
        ),
        Icon(
          Icons.favorite_border,
        ),
      ]),
      body: Container(
        height: 296,
        width: double.infinity,
        decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(Assets.home), fit: BoxFit.fill),
        ),
      ),
    );
  }
}
