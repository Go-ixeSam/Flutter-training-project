import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_croceries/constants/vin_color.dart';

class CustomCheckBox extends StatefulWidget {
  bool? isChecked;
  CustomCheckBox({this.isChecked});

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}


class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool _isSelected=false;
  double? size=25;

  @override
  void initState() {
    _isSelected=widget.isChecked??false;//todo: assign widget.isChecked to _isSelected, if widget.isChecked is null then assing false to _isSelected
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          _isSelected=!_isSelected; 
        });
      },
      child: AnimatedContainer(
        duration: Duration(microseconds: 200),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          color: _isSelected==true?Color(VinColor.red):Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: _isSelected==true?null:Border.all(
            color: Colors.grey,
            width: 2
          )
        ),
        width: size,
        height:size,
        child: _isSelected==true?Icon(Icons.check,color:Colors.white):null,
      ),
    );
  }
}
