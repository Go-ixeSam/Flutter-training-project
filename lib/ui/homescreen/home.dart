// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_croceries/constants/assets.dart';
import 'package:online_croceries/constants/strings.dart';
import 'package:online_croceries/models/shop/shop.dart';
import 'package:online_croceries/stores/dashboard/dashboard_store.dart';
import 'package:online_croceries/stores/shop/shop_store.dart';
import 'package:online_croceries/ui/homescreen/body_home.dart';
import 'package:online_croceries/widgets/progress_indicator_widget.dart';
import 'package:online_croceries/widgets/search_bar_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DashboardStore _dashboardStore;
  late ShopStore _shopStore;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final int _numPages = 3;

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   _dashboardStore = Provider.of<DashboardStore>(context);
  //   _dashboardStore.getDashboards();
  // }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _dashboardStore = Provider.of<DashboardStore>(context);
    _shopStore = Provider.of<ShopStore>(context);
    _dashboardStore.getDashboards();
    _shopStore.getShop();
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    if (_dashboardStore.dashboardList != null) {
      for (int i = 0; i < _dashboardStore.dashboardList!.length; i++) {
        list.add(i == _currentPage ? _indicator(true) : _indicator(false));
      }
      return list;
    } else {
      return [];
    }
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 7.5,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFF71B48D) : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final searchArea = Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 5),
                child: SvgPicture.asset(Assets.icon_carrot),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 15.13,
                    child: Icon(
                      Icons.location_on,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 7.44),
                    child: Text(
                      Strings.titleHomeScreen,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 25, right: 24.0, left: 24.0),
                child: SearchBar(),
              ),
            ],
          ),
        )
      ],
    );

    final contentSlider = PageView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(3.0),
          child: Center(
            child: Image(
              image: NetworkImage(
                '${_dashboardStore.dashboardList?[index]}',
              ),
              height: double.infinity,
            ),
          ),
        );
      },
      physics: ClampingScrollPhysics(),
      itemCount: _dashboardStore.dashboardList?.length,
      onPageChanged: (int page) {
        setState(() {
          _currentPage = page;
        });
      },
      controller: _pageController,
    );

    final categoryProduct = ListView.builder(
      itemBuilder: (_, index) {
        return BodyHomeScreen(
          index: index,
          products: _shopStore.shopList!.shops![index] as Shop,
          title: '${_shopStore.shopList?.shops?[index].title}',
        );
      },
      itemCount: _shopStore.shopList?.shops?.length,
    );

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          alignment: Alignment.center,
          child: searchArea,
        ),
        Expanded(
          flex: 2,
          child: Container(
              padding: EdgeInsets.only(top: 10),
              child: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        backgroundColor: Colors.white,
                        expandedHeight: 150,
                        floating: false,
                        // Add this code
                        flexibleSpace: Container(
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  left: 2.0,
                                  right: 2.0,
                                ),
                                height: 250,
                                child: contentSlider,
                              ),
                              Container(
                                height: 140,
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: _buildPageIndicator(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ];
                  },
                  body: categoryProduct)),
        )
      ],
    );
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (context) {
            return _dashboardStore.loading && _shopStore.loading
                ? CustomProgressIndicatorWidget()
                : Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: content,
                  );
          },
        ),
      ),
    );
  }
}
