import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:online_croceries/constants/assets.dart';
import 'package:online_croceries/models/product/product.dart';
import 'package:online_croceries/models/product/product_list.dart';
import 'package:online_croceries/models/product_real/food_favorite_list.dart';
import 'package:online_croceries/models/product_real/food_product.dart';
import 'package:online_croceries/stores/favorite/favorite_store.dart';
import 'package:online_croceries/ui/cart/check_out_widget.dart';
import 'package:online_croceries/ui/order_status/fail.dart';
import 'package:online_croceries/ui/order_status/success_dialog.dart';
import 'package:online_croceries/widgets/green_button_widget.dart';
import 'package:online_croceries/widgets/progress_indicator_widget.dart';
import 'package:online_croceries/widgets/transparent_app_bar_widget.dart';
import 'package:provider/provider.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

late FavoriteStore _favoriteStore;
List<FoodProduct> deletedListItem=<FoodProduct>[];

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransparentAppBar(transTitle: "Favorite"),
      backgroundColor: Colors.white,
      body: Observer(
        builder:(context){
          return _favoriteStore.loading?CustomProgressIndicatorWidget():
            SafeArea(
            child: Stack(
              fit: StackFit.loose,
              // alignment: Alignment.bottomCenter,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const Divider(thickness: 1),
                      Container(
                        // padding: EdgeInsets.only(left: padding, right: padding),
                          child: _favoriteStore.favoriteList != null
                              ? _buildListView()
                              : Center(child: Text("List bị null"))),
                      const Divider(thickness: 1),
                      Container(height: 100.0),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                      child: GreenButtonWidget(
                        buttonText: "Add all to cart",
                        onPressed: (){
                          // _addToCart();
                          // _showCheckoutBottomSheet();
                         showDialog(context: context, builder: (_) => SuccessDialog());
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _buildListItem(
      {required String title, required String image, required String price,required String subTitle}) {
    return ListTile(
      leading: SizedBox(
          width: 50,
          child: Image.network(image)),
      title: Container(
        margin: const EdgeInsets.only(left: 30),
        child: Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
      subtitle: Container(
        margin: const EdgeInsets.only(left: 30),
        child: Text("${subTitle}, Price",
        style:TextStyle(fontSize:12,
        color:Colors.grey)),
      ),
      trailing: Container(
        width: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("\$${price}",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(width:20),
            Icon(
              Icons.clear,
              color:Colors.black
            ), // Icon(Icons.)
          ],
        ),
      ),
    );
  }

  _buildListView() {
    // [
    //   {
    //     "id": 194103,
    //     "name": "Canned Goods",
    //     "price": 3,
    //     "image": "https://www.eatthis.com/wp-content/uploads/sites/4/2021/07/beers.jpg?quality=82&strip=all",
    //     "nutrition": 120,
    //     "review": 2,
    //     "detail": "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet."
    //   },
    //   {
    //     "id": 196148,
    //     "name": "Baby",
    //     "price": 4.99,
    //     "image": "https://www.myveronanj.com/wp-content/uploads/2020/05/CannedGoods.jpg",
    //     "nutrition": 234,
    //     "review": 4,
    //     "detail": "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet."
    //   }
    // ]
    //  FoodProduct item1= FoodProduct(image:
    //  "https://www.eatthis.com/wp-content/uploads/sites/4/2021/07/beers.jpg?quality=82&strip=all",
    //  price: 3,
    //  id: 194103,
    //      review:2,
    //    detail: "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.",
    //    name: "Canned Goods",
    //    nutrition: 120
    //  );
    //
    // FoodProduct item2=FoodProduct(
    //   nutrition: 234,
    //   review:4,
    //   detail:"Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.",
    //   id: 196148,
    //   price: 4.99,
    //   name: "Baby",
    //   image: "https://www.myveronanj.com/wp-content/uploads/2020/05/CannedGoods.jpg"
    // );
    // ProductList productList =
    // ProductList(product: <Product>[coca_cola, coke, pepsi, spite]);

    FoodFavoriteList productList = _favoriteStore.favoriteList!;
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (BuildContext contex, int index) {
          FoodProduct item = productList.foodProducts![index];
          // Product item = productList.product![index];
          return _buildListItem(
              price: item.price.toString(),
              title: item.name!,
              image: item.image!,
          subTitle: item.nutrition.toString());
        },
        separatorBuilder: (BuildContext contex, int index) => Padding(
          padding: const EdgeInsets.only(left:20,right:20),
          child: Divider(),
        ),
        itemCount: productList.foodProducts!.length);
        // itemCount: productList.product!.length);
  }

  _addToCart() {
    List<int> listOfProductId=<int>[];
    _favoriteStore.favoriteList!.foodProducts!.map((e) =>{
      listOfProductId.add(e.id!)
    });
    print("List of id: ${listOfProductId.length}");
    _favoriteStore.addCart(listOfProductId);

  }
  _deleteFavoriteItem(){
    // List<FoodProduct> listFromStore =
    // _favo.foodCategoryList!.foodCategories!;
    // print("list store: ${_foodCategoryStore.foodCategoryList!.foodCategories!.length}");
    // print("text: ${_foodProductController.text}");
    // _searchResult!.clear();
    // if (text.isEmpty) {
    //   _searchResult = listFromStore.toList();
    //   setState(() {});
    //   return;
    // }
    // _searchResult = listFromStore
    //     .where((element) => element.title!
    //     .toLowerCase()
    //     .contains(_foodProductController.text.toLowerCase()))
    //     .toList();
    //
    // setState(() {
    //   print("temp ne: ${_searchResult!.length}");
    //   // _searchResult=temp;
    // });
  }

  Future _showCheckoutBottomSheet() => showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return CheckOutWidget(
          onTap: () {
            // Dùng để close cái alert dialog
            Navigator.pop(context);
            showDialog(context: context, builder: (_) => Fail());
          },
        );
      });

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _favoriteStore = Provider.of<FavoriteStore>(context);
    if (!_favoriteStore.loading) {
      _favoriteStore.getFavoriteList();
    }
  }
}
