import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_croceries/constants/assets.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController? textController;
  final ValueChanged? onChanged;
  // const SearchBar({Key? key}) : super(key: key);

  SearchBar({
    this.onChanged,
    this.textController,
  });
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        // width: double.infinity,
        height: 50,
        child: TextFormField(
          onChanged: onChanged,
          controller: textController,
          decoration: InputDecoration(
            suffixIconConstraints: BoxConstraints(minWidth: 20, maxHeight: 20),
            suffixIcon: Container(
              height:15,
              width:15,
              margin: EdgeInsets.only(right: 10),
              // child: Icon(Icons.clear),
              child: Image.asset(Assets.cancel),
            ),
            fillColor: HexColor("##F2F3F2"),
            border: InputBorder.none,
            filled: true,
            // fillColor: Colors.white,
            hintStyle: TextStyle(color: Colors.grey),
            hintText: "Search store",
            // contentPadding: Ed,
            prefixIconConstraints: BoxConstraints(minHeight: 15, minWidth: 15),
            prefixIcon: Container(
                margin: EdgeInsets.only(left: 10, right: 5),
                child: Icon(Icons.search,
    color:Colors.black),
          ),
        ),
      ),
    ));
  }
}
