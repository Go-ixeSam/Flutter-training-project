// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:online_croceries/stores/cart/cart_store.dart';
import 'package:online_croceries/ui/cart/change_quantity_btn.dart';
import 'package:online_croceries/ui/cart/check_out_widget.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_croceries/ui/cart/change_quantity_btn.dart';
import 'package:online_croceries/ui/cart/check_out_widget.dart';
import 'package:online_croceries/ui/order_status/fail.dart';
import 'package:online_croceries/utils/routes/routes.dart';
import 'package:online_croceries/widgets/progress_indicator_widget.dart';
import 'package:online_croceries/widgets/transparent_app_bar_widget.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartStore _cartStore;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cartStore = Provider.of<CartStore>(context);
    _cartStore.getCarts();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return _cartStore.loading
            ? CustomProgressIndicatorWidget()
            : Scaffold(
                appBar: TransparentAppBar(transTitle: "My cart"),
                backgroundColor: Colors.white,
                body: SafeArea(
                  child: Stack(
                    fit: StackFit.loose,
                    alignment: Alignment.bottomCenter,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            const Divider(thickness: 1),
                            ListView.separated(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 4,
                              itemBuilder: (_, index) => Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                height: 130,
                                child: Row(
                                  children: [
                                    Image(
                                      image: NetworkImage(
                                          '${_cartStore.cartList!.carts![index].image}'),
                                      height: 80,
                                      width: 80,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${_cartStore.cartList?.carts?[index].name}',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const Text(
                                            '1kg, Prices',
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15.0),
                                            child: Row(
                                              children: [
                                                changeQuantityButton(
                                                  icon: const Icon(
                                                    Icons.remove_rounded,
                                                    color: Colors.grey,
                                                  ),
                                                  onTap: () {},
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                                  child: Text(
                                                    '1',
                                                    style: TextStyle(
                                                        fontSize: 16.0),
                                                  ),
                                                ),
                                                changeQuantityButton(
                                                  icon: const Icon(
                                                    Icons.add_rounded,
                                                    color: Colors.green,
                                                  ),
                                                  onTap: () {},
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                              onTap: () {},
                                              child: const Icon(
                                                Icons.clear_rounded,
                                                size: 28.0,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            const Spacer(),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 20.0),
                                              child: Text(
                                                '\$${_cartStore.cartList?.carts?[index].price}',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              separatorBuilder: (_, __) =>
                                  const Divider(thickness: 1),
                            ),
                            const Divider(thickness: 1),
                            Container(height: 100.0),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () async => await _showCheckoutBottomSheet(),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 25.0),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 15.0),
                          decoration: BoxDecoration(
                            color: HexColor("#53B175"),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: 24),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Go to Checkout',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 40),
                                        padding: const EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                          color: HexColor("#489E67"),
                                          borderRadius:
                                              BorderRadius.circular(3.0),
                                        ),
                                        child: Text(
                                          '\$12.96',
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }

  Future _showCheckoutBottomSheet() => showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return CheckOutWidget(
          onTap: () {
            Navigator.of(context).pushNamed(Routes.success);
          },
        );
      });
}
