import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_croceries/widgets/transparent_app_bar_widget.dart';


class Filter extends StatefulWidget {
    const Filter({Key? key}) : super(key: key);

    @override
    _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  CustomGroupController customController = CustomGroupController();
// final selectedItem = customController.selectedItem;

  List<String> brand=["Indvidual collection","Cocola","Ifad","Kazi farmad"];
  List<String> categories=["Eggs","Noodles \& Pasta","Chips \& Crips","Fast Food"];
  @override
  Widget build(BuildContext context) {
    double radius=50;
    double height=280;
    return Scaffold(
      appBar: TransparentAppBar(
        transTitle: "Filter",
        leadingIcon: Icon(
          Icons.clear,
          color:Colors.black
        ),
          onPressed: (){
          Navigator.of(context).pop();
      }
      ),
      body:Container(
        decoration: BoxDecoration(
            color:HexColor("#F2F3F2"),
          borderRadius: BorderRadius.only(
            topLeft:Radius.circular(radius),
            topRight:Radius.circular(radius),
          )
        ),
        child:
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height:30),
              _buildGroupCheckCategory(height),
              _buildGroupCheckBrand(height),
            ],
          ),
        ),
      )
    );
  }

  _buildGroupCheckCategory(double height) {
    double padding=25;
    return Container(
      height:height,
      child: CustomGroupedCheckbox<int>(
        controller:customController,
        groupTitle: Padding(
          padding: EdgeInsets.only(left:padding,right:padding,bottom: padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Categories",style:TextStyle(fontSize:24,fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        itemBuilder: (ctx,index,value,isDisabled){
          return
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (_){},
                    activeColor:HexColor("#53B175") ,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  SizedBox(width:16),
                  Text(categories[index],style:TextStyle(fontSize:16))
                ],
              ),
            );
        },
        // values: ["Noodles \& Pasta","Chips \& Crips","Fast Food"],
        values: List<int>.generate(4, (i)=>i),
      ),
    );
  }

  _buildGroupCheckBrand(double height) {
    double padding=25;
    return Container(
      height:height,
      child: CustomGroupedCheckbox<int>(
        controller:customController,
        groupTitle: Padding(
          padding: EdgeInsets.only(left:padding,right:padding,bottom: padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Brand",style:TextStyle(fontSize:24,fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        itemBuilder: (ctx,index,value,isDisabled){
          return
            Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                value: true,
                onChanged: (_){},
                activeColor:HexColor("#53B175") ,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                SizedBox(width:16),
                Text(brand[index],style:TextStyle(fontSize:16))
              ],
            ),
          );
        },
        // values: ["Noodles \& Pasta","Chips \& Crips","Fast Food"],
        values: List<int>.generate(3, (i)=>i),
      ),
    );
  }
}
