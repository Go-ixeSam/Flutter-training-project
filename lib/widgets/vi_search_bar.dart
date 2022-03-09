import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_croceries/constants/vin_color.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController? textEditingController;
  final ValueChanged? onChanged;
  SearchBar({
    this.onChanged,
    this.textEditingController
});

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: EdgeInsets.all(16)
    ,child: Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(VinColor.grey),
              width: 1
        )
        ),
      child: TextFormField(
        onChanged: this.onChanged,
        controller: textEditingController,
        decoration: InputDecoration(
          suffixIconConstraints: BoxConstraints(minWidth: 20, maxHeight: 20),
          suffixIcon: Container(
            height:15,
            width:15,
            margin: EdgeInsets.only(right: 10),
            child: Icon(Icons.search),
          ),
          fillColor: Color(VinColor.lightGrey),
          border: InputBorder.none,
          filled: true,
          // fillColor: Colors.white,
          hintStyle: TextStyle(color: Colors.grey),
          hintText: "Tìm kiếm Vincom, cửa hàng...",
        ),
      ),
      ),
    );
  }
}
