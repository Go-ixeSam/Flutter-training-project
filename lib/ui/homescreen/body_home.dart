import 'package:flutter/material.dart';
import 'package:online_croceries/constants/assets.dart';
import 'package:online_croceries/constants/strings.dart';
import 'package:online_croceries/models/product/product.dart';
import 'package:online_croceries/models/product/product_list.dart';
import 'package:online_croceries/models/shop/shop.dart';
import 'package:online_croceries/models/shop/shop_list.dart';
import 'package:online_croceries/stores/shop/shop_store.dart';
import 'package:online_croceries/ui/detail_product/detail_product.dart';
import 'package:online_croceries/widgets/item_product_widget.dart';
import 'package:provider/provider.dart';
import 'package:random_color/random_color.dart';

class BodyHomeScreen extends StatefulWidget {
  String? title;
  bool? isShowListCategory = false;
  int index;
  final Shop products;
  BodyHomeScreen(
      {Key? key,
      this.title,
      this.isShowListCategory,
      required this.index,
      required this.products})
      : super(key: key);

  @override
  _BodyHomeScreenState createState() => _BodyHomeScreenState();
}

class _BodyHomeScreenState extends State<BodyHomeScreen> {
  late ShopStore _shopStore;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _shopStore = Provider.of<ShopStore>(context);
    _shopStore.getShop();
    print('aaaaa' + widget.products.product[0]!.name.toString());
  }

  @override
  Widget build(BuildContext context) {
    void _navigatorToDetailProduct(int id, String name, double price,
        String image, int nutrition, String detail, int review) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              body: DetailProduct(
                name: name,
                price: price,
                image: image,
                nutrition: nutrition,
                detail: detail,
                review: review,
              ),
            );
          },
        ),
      );
    }

    RandomColor _randomColor = RandomColor();
    Color _color =
        _randomColor.randomColor(colorBrightness: ColorBrightness.light);
    final listProduct = ListView.builder(
      padding: EdgeInsets.only(top: 5),
      scrollDirection: Axis.horizontal,
      itemCount: widget.products.product.length,
      itemBuilder: (_, index) => InkWell(
        onTap: () => _navigatorToDetailProduct(
            widget.products.product[index]!.id!.toInt(),
            widget.products.product[index]!.name.toString(),
            widget.products.product[index]!.price!.toDouble(),
            widget.products.product[index]!.image.toString(),
            widget.products.product[index]!.nutrition!.toInt(),
            widget.products.product[index]!.detail.toString(),
            widget.products.product[index]!.review!.toInt()),
        child: Container(
          padding: EdgeInsets.all(3),
          width: 180,
          height: 250,
          child: ItemProductWidget(
            product: Product(
              id: 1,
              image: "${widget.products.product[index]?.image}",
              name: "${widget.products.product[index]!.name}",
              price: _shopStore
                  .shopList?.shops?[widget.index].product[index]?.price,
            ),
          ),
        ),
      ),
    );

    final listTitleCategory = ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      itemBuilder: (_, index) => Container(
        child: Container(
          padding: EdgeInsets.only(right: 15, top: 20, bottom: 20),
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(
                  _color.red,
                  _color.green,
                  _color.blue,
                  20,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            onPressed: () {},
            child: Row(
              children: [
                Container(
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        Assets.apple_juice,
                      ),
                    ),
                  ),
                ),
                Text('data')
              ],
            ),
          ),
        ),
        width: 200,
      ),
    );

    return Container(
      padding: EdgeInsets.only(left: 24, right: 24, top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title == null ? '' : widget.title.toString(),
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See all',
                  style: TextStyle(
                      color: Color.fromRGBO(87, 177, 117, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
          widget.isShowListCategory == true
              ? Container(
                  child: listTitleCategory,
                  height: 105,
                )
              : Text(''),
          Container(
            height: 250,
            child: listProduct,
          ),
        ],
      ),
    );
  }
}
