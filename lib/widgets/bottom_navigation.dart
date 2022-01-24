// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_croceries/constants/assets.dart';
import 'package:online_croceries/ui/cart/cart_screen.dart';
import 'package:online_croceries/ui/components/buttonCommond.dart';
import 'package:online_croceries/ui/favorite/favorite_screen.dart';
import 'package:online_croceries/ui/homescreen/home.dart';
import 'package:online_croceries/ui/search/search_screen.dart';
import 'package:online_croceries/ui/user/user_account.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  String _title = '';
  // bool isShowBtn = false;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchProduct(),
    CartScreen(),
    Favorite(),
    UserAccount(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      setState(() {
        _title = 'Go to Checkout';
        _selectedIndex = index;
      });
    } else if (index == 1 || index == 0) {
      setState(() {
        // isShowBtn = false;
        _selectedIndex = index;
      });
    } else {
      setState(() {
        _selectedIndex = index;
        _title = 'Log Out';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final myFabButton = Container(
      padding: EdgeInsets.all(10),
      child: new RawMaterialButton(
        elevation: 0.0,
        child: ButtonCommond(
          title: _title,
          icon: Assets.iconLogout,
          color: Color.fromRGBO(242, 243, 242, 1),
        ),
        onPressed: () {},
      ),
    );
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Shop',
            // backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Explore',
            // backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
            // backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
            // backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            label: 'Account',
            // backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(87, 177, 117, 1),
        onTap: _onItemTapped,
      ),
      // floatingActionButton: myFabButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
