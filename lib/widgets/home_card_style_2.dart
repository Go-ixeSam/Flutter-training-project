import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeCardStyleTwo extends StatelessWidget {
  String? text;
  String? imageName;
  HomeCardStyleTwo({this.text, this.imageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        image:DecorationImage(
          image: AssetImage(this.imageName!),
          fit: BoxFit.fill
        )
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0,left: 8),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Opacity(
            opacity: 0.5,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(8),bottomLeft: Radius.circular(8))
              ),
              width: double.infinity,
                height: 50, child: Center(
                  child: Text(this.text!,style: TextStyle(
              color: Colors.white
            ),),
                )),
          ),
        ),
      ),
    );
    // Opacity(
    //   opacity: 0.25,
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.end,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Container(
    //         height: 50,
    //         // width: 132,
    //         color: Colors.black,
    //         child: Text(
    //           this.text!,
    //           style: TextStyle(color: Colors.white),
    //         ),
    //       )
    //     ],
    //   ),
    // )

//   Container(
//   decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(8),
//     image: DecorationImage(
//       image: AssetImage(this.imageName!),
//       fit: BoxFit.cover
//     )
//   ),
//   child: ,
// );
  }
}
