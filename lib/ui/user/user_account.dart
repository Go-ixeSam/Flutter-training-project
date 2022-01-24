// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_croceries/constants/assets.dart';
import 'package:online_croceries/constants/strings.dart';
import 'package:online_croceries/data/sharedpref/constants/preferences.dart';
import 'package:online_croceries/ui/components/buttonCommond.dart';
import 'package:online_croceries/ui/user/buttonTitle.dart';
import 'package:online_croceries/utils/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAccount extends StatefulWidget {
  const UserAccount({Key? key}) : super(key: key);

  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  final _buttonList = <ButtonTitle>[];

  @override
  Widget build(BuildContext context) {
    final header = Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: 65,
              height: 66,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.userImage),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        Strings.username,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 20,
                          height: 15,
                          padding: EdgeInsets.only(left: 5.15),
                          child: SvgPicture.asset(Assets.iconEdit),
                        ),
                      )
                    ],
                  ),
                  Text(Strings.email,
                      style: TextStyle(color: Colors.grey, fontSize: 16))
                ],
              ),
            ),
          )
        ],
// >>>>>>> Huy-Develop
      ),
    );
    for (var i = 0; i < Assets.titles.length; i++) {
      _buttonList.add(
        ButtonTitle(
          title: Assets.titles[i],
          icon: Assets.icon[i],
        ),
      );
    }
    Widget _buttonListTitle() {
      return ListView.separated(
        // shrinkWrap: true,
        itemBuilder: (context, int index) => _buttonList[index],
        separatorBuilder: (context, int index) => const Divider(
          thickness: 1,
          color: Color.fromRGBO(226, 226, 226, 1),
        ),
        itemCount: Assets.titles.length,
      );
    }

    final bottom = Expanded(
        child: Container(
      padding: EdgeInsets.all(10),
      child: ButtonCommond(
        title: 'Log Out',
        icon: Assets.iconLogout,
        color: Color.fromRGBO(242, 243, 242, 1),
        onPressed: () {
          SharedPreferences.getInstance().then((preference) {
            preference.setBool(Preferences.is_logged_in, false);
            Navigator.of(context).pushReplacementNamed(Routes.login);
          });
        },
      ),
    ));

    final body = Expanded(
        child: Column(
      children: [
        Container(
          height: 500,
          child: _buttonListTitle(),
        ),
        bottom
      ],
    ));

    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          header,
          Divider(thickness: 1, color: Color.fromRGBO(226, 226, 226, 1)),
          Container(
            child: body,
          ),
        ],
      ),
    ));
  }
}
