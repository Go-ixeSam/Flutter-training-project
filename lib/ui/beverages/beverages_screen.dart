import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_croceries/constants/assets.dart';
import 'package:online_croceries/models/product/product.dart';
import 'package:online_croceries/models/product_real/food_category.dart';
import 'package:online_croceries/ui/beverages/check_filter_changenotify.dart';
import 'package:online_croceries/widgets/item_product_widget.dart';
import 'package:provider/provider.dart';

class BeveragesScreen extends StatefulWidget {
  final FoodCategoy? foodCategories;
  const BeveragesScreen({Key? key, this.foodCategories}) : super(key: key);

  @override
  State<BeveragesScreen> createState() => _BeveragesScreenState();
}

class _BeveragesScreenState extends State<BeveragesScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  List<String> listCategories = [
    'Eggs',
    'Noodles & Pasta',
    'Eggs',
    'Noodles & Pasta'
  ];
  List<String> listBrands = [
    'Cocola',
    'Noodles & Pasta',
    'Eggs',
    'Noodles & Pasta'
  ];

  @override
  Widget build(BuildContext context) {
    print('assdsdsd: ' + widget.foodCategories.toString());
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Beverages',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: GestureDetector(
              onTap: () async =>
                  await _showCategoriesBottomSheet().then((value) {}),
              child: Image.asset(
                Assets.cateIcon,
                height: 25.0,
                width: 25.0,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 0.8,
        ),
        itemCount: widget.foodCategories!.product!.length,
        itemBuilder: (_, index) => ItemProductWidget(
          product: Product(
            id: widget.foodCategories!.product![index].id,
            image: widget.foodCategories!.product![index].image,
            name: widget.foodCategories!.product![index].name,
            price: widget.foodCategories!.product![index].price,
          ),
        ),
      ),
    );
  }

  Future _showCategoriesBottomSheet() {
    // int cate;
    // int brand;
    CheckFilterChangeNotify checkCategoriesChangeNotify =
        CheckFilterChangeNotify();
    CheckFilterChangeNotify checkBrandChangeNotify = CheckFilterChangeNotify();
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
              icon: const Icon(Icons.clear_rounded, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text(
              'Filters',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            centerTitle: true,
          ),
          body: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 20.0),
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(20.0),
                right: Radius.circular(20.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ChangeNotifierProvider<CheckFilterChangeNotify>(
                  create: (_) => checkCategoriesChangeNotify,
                  builder: (_, widget) => Consumer<CheckFilterChangeNotify>(
                    builder: (_, categories, __) => Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 30.0),
                          child: Text(
                            "Categories",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        ...List.generate(
                          listCategories.length,
                          (index) => Row(
                            children: [
                              GestureDetector(
                                onTap: () =>
                                    checkCategoriesChangeNotify.check(index),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 10.0),
                                        decoration: BoxDecoration(
                                          color:
                                              categories.currentIndex == index
                                                  ? HexColor("#53B175")
                                                  : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color:
                                                categories.currentIndex == index
                                                    ? HexColor("#53B175")
                                                    : Colors.grey,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.check_rounded,
                                          size: 22.0,
                                          color:
                                              index == categories.currentIndex
                                                  ? Colors.white
                                                  : Colors.transparent,
                                        ),
                                      ),
                                      Text(
                                        listCategories[index],
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color:
                                              index == categories.currentIndex
                                                  ? HexColor("#53B175")
                                                  : Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40.0),
                ChangeNotifierProvider<CheckFilterChangeNotify>(
                  create: (_) => checkBrandChangeNotify,
                  builder: (_, widget) => Consumer<CheckFilterChangeNotify>(
                    builder: (_, brands, __) => Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 30.0),
                          child: Text(
                            "Brand",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        ...List.generate(
                          listCategories.length,
                          (index) => Row(
                            children: [
                              GestureDetector(
                                onTap: () => brands.check(index),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 10.0),
                                        decoration: BoxDecoration(
                                          color: brands.currentIndex == index
                                              ? HexColor("#53B175")
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: brands.currentIndex == index
                                                ? HexColor("#53B175")
                                                : Colors.grey,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.check_rounded,
                                          size: 22.0,
                                          color: index == brands.currentIndex
                                              ? Colors.white
                                              : Colors.transparent,
                                        ),
                                      ),
                                      Text(
                                        listBrands[index],
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: index == brands.currentIndex
                                              ? HexColor("#53B175")
                                              : Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: HexColor("#53B175"),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Apply Filter',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
