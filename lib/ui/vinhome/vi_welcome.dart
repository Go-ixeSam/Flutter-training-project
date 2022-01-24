import 'package:flutter/material.dart';
import 'package:online_croceries/constants/vin_color.dart';
import 'package:online_croceries/ui/vinhome/welcome_1.dart';
import 'package:online_croceries/ui/vinhome/welcome_2.dart';
import 'package:online_croceries/ui/vinhome/welcome_3.dart';
import 'package:online_croceries/widgets/green_button_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:developer' as developer;

class WelcomeVi extends StatefulWidget {
  const WelcomeVi({Key? key}) : super(key: key);

  @override
  _WelcomeViState createState() => _WelcomeViState();
}

class _WelcomeViState extends State<WelcomeVi> {
  bool _visible = true;

  final PageController _pageController =
      PageController(initialPage: 0, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: _pageController,
          onPageChanged: (index) {
            bool result = true;
            if (index == 2) {
              result = false;
            }
            setState(() {
              _visible = result;
            });
            developer.log('sam', name: 'page', error: index);
          },
          children: [WelcomeOne(), WelcomeTwo(), WelcomeThree()],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            getSmoothPageIndicator(_pageController, _visible),
            SizedBox(
              height: 24,
            ),
            changePageButton(_pageController, _visible)
          ],
        )
      ],
    );
  }
}

getSmoothPageIndicator(PageController _pageController, bool visible) {
  return Visibility(
    visible: visible,
    child: SmoothPageIndicator(
      controller: _pageController,
      count: 3,
      effect: ExpandingDotsEffect(
          dotColor: Color(VinColor.red).withOpacity(0.3),
          activeDotColor: Color(VinColor.red),
          dotHeight: 5,
          dotWidth: 12),
    ),
  );
}

changePageButton(
    PageController _pageController, bool _visible) {
  double size = 50;
  return Center(
    child: _visible==true?Padding(
      padding: const EdgeInsets.only(bottom: 45),
      child: Container(
        height: size,
        width: size,
        child: ElevatedButton(
          onPressed: () {
            if (_pageController.hasClients) {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            }
          },
          style: ElevatedButton.styleFrom(
            primary: Color(VinColor.red),
            shape: CircleBorder(),
          ),
          child: Center(child: const Icon(Icons.arrow_forward)),
        ),
      ),
    ):Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Padding(
        padding: const EdgeInsets.only(left: 70,right: 70),
        child: RedButton((){},"Khám phá ngay"),
      ),
    ),
  );
}
