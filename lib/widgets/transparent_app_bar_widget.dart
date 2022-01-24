import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_croceries/constants/assets.dart';

AppBar TransparentAppBar(
    {Key? transKey,
    String? transTitle,
    Widget? leadingIcon,
    Widget? actionIcon,
    VoidCallback? onPressed,
    bool showActionIcon = false}) {
  return AppBar(
    key: transKey,
    title: Text(transTitle!, style: TextStyle(color: Colors.black)),
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        // statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent),
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    leading: leadingIcon,
    actions: showActionIcon == true
        ? <Widget>[
            IconButton(
              onPressed: onPressed,
              icon: Image.asset(Assets.filter),
            )
          ]
        : <Widget>[],
  );
}

AppBar TransparentAppBarWithBlackArrow(){
  return AppBar(
    centerTitle: true,
    leading: Builder(builder: (context) {
      return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.chevron_left,
          color: Colors.black,
        ),
      );
    }),
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    backgroundColor: Colors.transparent,
  );
}
