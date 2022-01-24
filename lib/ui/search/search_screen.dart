import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:online_croceries/models/product_real/food_category.dart';
import 'package:online_croceries/models/product_real/food_category_list.dart';
import 'package:online_croceries/stores/food_category/food_category_store.dart';
import 'package:online_croceries/ui/beverages/beverages_screen.dart';
import 'package:online_croceries/utils/routes/routes.dart';
import 'package:online_croceries/widgets/progress_indicator_widget.dart';
import 'package:online_croceries/widgets/search_bar_widget.dart';
import 'package:provider/provider.dart';
import 'package:random_color/random_color.dart';

class SearchProduct extends StatefulWidget {
  const SearchProduct({Key? key}) : super(key: key);

  @override
  _SearchProductState createState() => _SearchProductState();
}

// late CategoryStore _categoryStore;
late FoodCategoryStore _foodCategoryStore;

class _SearchProductState extends State<SearchProduct> {
  TextEditingController _foodProductController = TextEditingController();
  List<FoodCategoy>? _searchResult = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _foodCategoryStore = Provider.of<FoodCategoryStore>(context);
    if (!_foodCategoryStore.loading) {
      _foodCategoryStore.getFoodCategories();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Observer(builder: (context) {
      return _foodCategoryStore.loading
          ? CustomProgressIndicatorWidget()
          : Container(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Text("Find Product",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 30),
                  SearchBar(
                      textController: _foodProductController,
                      onChanged: (value) {
                        _onSearchTextChanged();
                      }),
                  _foodCategoryStore.foodCategoryList != null
                      ? _buildListView()
                      : Center(child: Text("Có lỗi rồi"))
                ],
              ));
    }));
  }

  _onSearchTextChanged() async {
    String text = _foodProductController.text;
    List<FoodCategoy> listFromStore =
        _foodCategoryStore.foodCategoryList!.foodCategories!;
    print(
        "list store: ${_foodCategoryStore.foodCategoryList!.foodCategories!.length}");
    print("text: ${_foodProductController.text}");
    _searchResult!.clear();
    if (text.isEmpty) {
      _searchResult = listFromStore.toList();
      setState(() {});
      return;
    }
    _searchResult = listFromStore
        .where((element) => element.title!
            .toLowerCase()
            .contains(_foodProductController.text.toLowerCase()))
        .toList();

    setState(() {
      print("temp ne: ${_searchResult!.length}");
      // _searchResult=temp;
    });
  }

  _buildListView() {
    FoodCategoryList list = _foodCategoryStore.foodCategoryList!;
    List<FoodCategoy> foods = list.foodCategories!;
    if (_searchResult!.isNotEmpty) {
      foods = _searchResult!;
    }
    double spacing = 15;
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        itemBuilder: (BuildContext context, int index) {
          return _buildGridViewItem(foods[index]);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: spacing,
          crossAxisSpacing: spacing,
          crossAxisCount: 2,
        ),
        itemCount: foods.length,
      ),
    );
  }

  _buildGridViewItem(FoodCategoy item) {
    // var item = _foodCategoryStore.foodCategoryList?.foodCategories?[index];
    // if(_searchResult!.isNotEmpty){
    //   item=_searchResult?[index];
    // }
    void _navigatoBeverages(BuildContext context) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              body: BeveragesScreen(
                foodCategories: item,
              ),
            );
          },
        ),
      );
    }

    RandomColor _randomColor = RandomColor();
    Color _color =
        _randomColor.randomColor(colorBrightness: ColorBrightness.light);
    return InkWell(
      onTap: () => _navigatoBeverages(context),
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(80, _color.red, _color.green, _color.blue),
            border: Border.all(color: _color),
            borderRadius: BorderRadius.all(Radius.circular(18))),
        // color: _color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 74,
              width: 100,
              // child: Image.network(item!.image!)
            ),
            SizedBox(height: 18),
            SizedBox(
              height: 44,
              width: 93,
              child: Center(
                child: Text(
                  item.title!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
