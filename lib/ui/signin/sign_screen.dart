import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:online_croceries/constants/assets.dart';
import 'package:online_croceries/ui/number/phone_login_screen.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:online_croceries/ui/signin/number_textfield.dart';
import 'package:online_croceries/ui/signin/social_button.dart';
import 'package:online_croceries/utils/routes/routes.dart';
import 'package:online_croceries/widgets/transparent_app_bar_widget.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();

  SignInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    //làm cho status bar hiện ra
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Assets.pannerImage,
            width: size.width,
            fit: BoxFit.fill,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: (size.width / 100) * 70,
                      child: const Text(
                        'Get your groceries with nectar',
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(Routes.phone_login);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  clipBehavior: Clip.antiAlias,
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Image.asset(
                                    'assets/images/flag_country.png',
                                    height: (size.height / 100) * 3,
                                    width: (size.width / 100) * 9,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                const Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      '+880',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 0.5,
                          height: 0.0,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Or connect with social media',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                    ),
                    SocialButton(
                      icon: Assets.google,
                      label: 'Continue with Google',
                      color: Colors.blueAccent,
                      onTap: () {},
                    ),
                    const SizedBox(height: 15.0),
                    SocialButton(
                      icon: Assets.facebook,
                      label: 'Continue with Facebook',
                      color: Colors.blue[900],
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
