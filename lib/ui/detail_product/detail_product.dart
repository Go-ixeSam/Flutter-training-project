// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:online_croceries/constants/assets.dart';
import 'package:online_croceries/constants/strings.dart';
import 'package:online_croceries/ui/components/buttonCommond.dart';

class DetailProduct extends StatefulWidget {
  String name;
  double price;
  String image;
  String detail;
  int nutrition;
  int review;
  DetailProduct({
    Key? key,
    required this.name,
    required this.price,
    required this.image,
    required this.detail,
    required this.nutrition,
    required this.review,
  }) : super(key: key);

  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final int _numPages = 3;
  bool selected = false;
  int qty = 0;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    void _navigatorGoback() {
      Navigator.of(context).pop();
    }

    Widget _indicator(bool isActive) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        height: 3.0,
        width: isActive ? 15.0 : 3.0,
        decoration: BoxDecoration(
          color: isActive ? Color(0xFF71B48D) : Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      );
    }

    void descreaseQty() {
      setState(() {
        if (qty != 0) {
          qty -= 1;
        } else {
          qty = 0;
        }
      });
    }

    void increaseQty() {
      setState(() {
        qty += 1;
      });
    }

    List<Widget> _buildPageIndicator() {
      List<Widget> list = [];
      for (int i = 0; i < _numPages; i++) {
        list.add(i == _currentPage ? _indicator(true) : _indicator(false));
      }
      return list;
    }

    final description = Container(
      child: InkWell(
        child: Column(
          children: [
            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.titleDescription,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Icon(selected
                      ? Icons.keyboard_arrow_down
                      : Icons.chevron_right),
                ],
              ),
            ),
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              height: selected ? 63 : 0,
              child: Text(
                widget.detail,
                style: TextStyle(
                  fontSize: 13,
                  color: Color.fromRGBO(124, 124, 124, 1),
                  height: 1.5,
                ),
              ),
            )
          ],
        ),
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Container(
                  height: 230,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(Assets.background_header))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => _navigatorGoback(),
                        icon: ImageIcon(AssetImage(Assets.icon_back)),
                        color: Colors.black,
                      ),
                      IconButton(
                        color: Colors.black,
                        onPressed: () {},
                        icon: ImageIcon(
                          AssetImage(
                            Assets.icon_share,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 27.0, bottom: 7.5),
                  height: 210,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: [
                      Center(
                        child: Image(
                          image: NetworkImage(widget.image),
                        ),
                      ),
                      Center(
                        child: Image(
                          image: NetworkImage(widget.image),
                        ),
                      ),
                      Center(
                        child: Image(
                          image: NetworkImage(widget.image),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 220,
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 470,
                padding: EdgeInsets.only(
                  left: 25.01,
                  right: 25.01,
                ),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          icon: isFavorite
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.pink,
                                )
                              : ImageIcon(
                                  AssetImage(Assets.icon_favorites),
                                ),
                        )
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       'data',
                    //       style: TextStyle(
                    //         color: Color.fromRGBO(124, 124, 124, 1),
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.w600,
                    //       ),
                    //     ),
                    //     Text('')
                    //   ],
                    // ),
                    Container(
                      padding: EdgeInsets.only(top: 30.0, bottom: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 20),
                                height: 45.67,
                                child: InkWell(
                                  onTap: () => descreaseQty(),
                                  child: Icon(
                                    Icons.remove_rounded,
                                  ),
                                ),
                              ),
                              Container(
                                width: 45.67,
                                height: 45.67,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                ),
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    qty.toString(),
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 20),
                                height: 45.67,
                                child: InkWell(
                                  onTap: () => increaseQty(),
                                  child: Icon(
                                    Icons.add_rounded,
                                    color: Color.fromRGBO(83, 177, 117, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '\$${widget.price}',
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Divider(thickness: 1),
                    description,
                    Divider(thickness: 1),
                    Container(
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nutritions',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 50.61,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(235, 235, 235, 1),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                  child: Text(
                                    '${widget.nutrition}gr',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(124, 124, 124, 1),
                                    ),
                                  ),
                                ),
                              ),
                              Icon(Icons.chevron_right),
                            ],
                          )
                          // this is where I would like to set some minimum constraint
                        ],
                      ),
                    ),
                    Divider(thickness: 1),
                    Container(
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Review',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              RatingBar.builder(
                                initialRating: widget.review.toDouble(),
                                itemSize: 20,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              Icon(Icons.chevron_right),
                            ],
                          )
                        ],
                      ),
                    ),
                    ButtonCommond(
                      onPressed: () {
                        // Navigator.of(context).pushNamed(Routes.sign_in_selection);
                      },
                      title: 'Add To Basket',
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
