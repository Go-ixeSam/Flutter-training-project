import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:online_croceries/constants/assets.dart';
import 'package:online_croceries/constants/vin_color.dart';
import 'package:online_croceries/models/vincom/vi_product_list.dart';
import 'package:online_croceries/models/vincom/vincom_all_product.dart';
import 'package:online_croceries/models/vincom/vincom_news_product.dart';
import 'package:online_croceries/models/vincom/vincom_product.dart';
import 'package:online_croceries/models/vincom/vincom_store_product.dart';
import 'package:online_croceries/stores/vincom/vincom_store.dart';
import 'package:online_croceries/widgets/headline.dart';
import 'package:online_croceries/widgets/progress_indicator_widget.dart';
import 'package:online_croceries/widgets/vi_search_bar.dart';
import 'package:online_croceries/widgets/vincom_place/vincom_mall.dart';
import 'package:online_croceries/widgets/vincom_place/vincom_store.dart';
import 'package:provider/provider.dart';
// import 'package:online_croceries/widgets/search_bar_widget.dart';

class ViSearch extends StatefulWidget {
  const ViSearch({Key? key}) : super(key: key);

  @override
  _ViSearchState createState() => _ViSearchState();
}

class _ViSearchState extends State<ViSearch> {
  late VincomStore _vincomStore;
  TextEditingController _textEditingController = TextEditingController();

  List<String> placeImage = [Assets.first, Assets.second];
  List<String> storeImage = [Assets.lau, Assets.xiomi];
  Vincom _searchResult = new Vincom(
    places: [],
    products: [],
    stores: []
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _vincomStore = Provider.of<VincomStore>(context);
    _vincomStore.getVincom().then((value) => print("Đây nè ${value}"));
  } // List<VincomOnly> vinOnlys = [
  //   VincomOnly(
  //       name: "Vincom Phạm Ngọc Thạch",
  //       address: "2 Phạm Ngọc Thạch Quang Trung",
  //       openTime: "Mở cửa 09:00 AM",
  //       closeTime: "23:00 PM",
  //       isOpen: true,
  //       image: Assets.first),
  //   VincomOnly(
  //       name: "Vincom Mega Mall Royal",
  //       address: "72A Nguyễn Trãi, Thượng Đình",
  //       openTime: "Đang đóng cửa",
  //       image: Assets.second),
  // ];
  //
  // List<NewsProduct> newProducts = [
  //   NewsProduct(
  //       image: Assets.homeCard,
  //       openTime: "14.10.2021",
  //       closeTime: "20.10.2021"),
  //   NewsProduct(
  //       image: Assets.homeCard, openTime: "14.10.2021", closeTime: "20.10.2021")
  // ];
  //
  // List<StoreProduct> stores = [
  //   StoreProduct(
  //       image: Assets.lau, name: "Lẩu trung hoa", position: "Tầng trệt"),
  //   StoreProduct(
  //       image: Assets.xiomi, name: "Xiaomi", position: "Khu L2, tầng 6")
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) {
          return _vincomStore.loading
              ? CustomProgressIndicatorWidget()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 26,
                      ),
                      SearchBar(
                        textEditingController: _textEditingController,
                        onChanged: (value) {
                          _onSearchTextChange();
                        },
                      ),
                      Container(
                        height: 1,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Color(VinColor.lightGrey))),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      (_searchResult.products!.length == 0 ||
                              _searchResult.places!.length == 0 ||
                              _searchResult.stores!.length == 0)
                          ? Container()
                          : Row(
                              children: [
                                SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  "15 kết quả phù hợp với từ khóa",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text("\"A\"",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14)),
                              ],
                            ),
                      SizedBox(
                        height: 24,
                      ),
                      buildHeadline("Vincom"),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 200,
                        child: buildVincomPlace(),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Container(
                        height: 6,
                        color: Color(VinColor.old_lightGrey),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      buildHeadline("Gian hàng"),
                      SizedBox(
                        height: 12,
                      ),
                      // Container(
                      //   height: 200,
                      //   child: buildVincomStore(),
                      // )
                    ],
                  ),
                );
        },
      ),
    );
  }

  _onSearchTextChange() {
    String text = _textEditingController.text;
    print("text: ${text}");
    print("độ dài: ${_vincomStore.vincom!.places!.length}");

    _searchResult = new Vincom();
    if (text.isEmpty) {
      setState(() {
        _searchResult = _vincomStore.vincom ?? new Vincom(
          stores: [],
          products: [],
          places: []
        );
      });
      return;
    }

    List<Places> temp = _vincomStore.vincom!.places!
        .where((element) =>
            element.name!.toLowerCase().contains(text.toLowerCase()))
        .toList();
    print("text: ${temp.length}");
    temp.map((e) => print("name: ${e.name}"));

    List<Products> products = _vincomStore.vincom!.products!
        .where((element) =>
            element.name!.toLowerCase().contains(text.toLowerCase()))
        .toList();

    setState(() {
      _searchResult.places = temp;
      _searchResult.products = products;
      _searchResult.stores=[];
    });

    // print("Hàng: ${temp.map((e) => e.name)}");
  }

  buildHeadline(String text) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Healine(
        text: text,
      ),
    );
  }

  buildVincomPlace() {
    List<Places> places=_vincomStore.vincom!.places??[];
    if(_searchResult.places!.isNotEmpty){
      places=_searchResult.places??[];
    }
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Divider(),
            ),
        // padding: const EdgeInsets.all(8),
        itemCount: places.length,
        itemBuilder: (BuildContext context, int index) {
          return VincomMall(
            name: places[index].name ?? "",
            imageName: placeImage[index],
            address: places[index].address ?? '',
            closeTime: places[index].closeTime ?? '',
            openTime: places[index].openTime ?? '',
            isOpen: places[index].isOpen,
          );
        });
  }

  buildVincomStore() {
    Vincom? vin = _vincomStore.vincom;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
          // padding: const EdgeInsets.all(8),
          scrollDirection: Axis.horizontal,
          itemCount: vin!.products!.length,
          itemBuilder: (BuildContext context, int index) {
            return VincomMallStore(
                imageName: storeImage[index],
                name: vin.products![index].name ?? "",
                position: vin.products![index].position ?? "");
          }),
    );
  }
}
