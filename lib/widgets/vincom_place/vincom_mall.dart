import 'package:flutter/material.dart';
import 'package:online_croceries/constants/vin_color.dart';

class VincomMall extends StatelessWidget {
  String imageName;
  String name;
  String address;
  String openTime;
  String closeTime;
  bool? isOpen;

  VincomMall({required this.imageName, required this.name, required this.address, this.isOpen=false,required this.closeTime, required this.openTime});

  @override
  Widget build(BuildContext context) {
    String time =
        this.isOpen == true ? "${this.openTime} - ${this.closeTime}" : "Đang đóng cửa";
    return Container(
      padding: EdgeInsets.only(left: 16,right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Image.asset(
                this.imageName,
                fit: BoxFit.fill,
              )),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.name,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4,),
                    Text(
                      this.address,
                      style: TextStyle(color: Color(VinColor.grey)),
                    ),
                    SizedBox(height: 4,),
                    Text(time, style: TextStyle(color: Colors.red)),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 20,
                              color: Colors.amber,
                            ),
                            SizedBox(width: 7.5,),
                            Text("4.8km")
                          ],
                        ),
                        Icon(
                          Icons.near_me,
                          color: Color(VinColor.red),
                        ),
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
