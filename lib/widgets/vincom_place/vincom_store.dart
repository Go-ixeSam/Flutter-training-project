import 'package:flutter/material.dart';
import 'package:online_croceries/constants/vin_color.dart';

class VincomMallStore extends StatelessWidget {
  String imageName;
  String name;
  String position;
  VincomMallStore(
      {required this.imageName, required this.name, required this.position});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        width: 163,
        height: 165,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Column(
          children: [
            Image.asset(
              this.imageName,
              height: 100,
              fit: BoxFit.fill,
            ),
            // SizedBox(
            //   height: 12,
            // ),
            Container(
              width: double.infinity,
              decoration:
                  BoxDecoration(border: Border.all(color: Color(VinColor.old_lightGrey)),
                  borderRadius:BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8))),
              child: Column(
                children: [
                  SizedBox(height: 12,),
                  Text(
                    this.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    this.position,
                    style: TextStyle(color: Color(VinColor.grey)),
                  ),
                  SizedBox(height: 12,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
