import 'package:flutter/material.dart';
import 'package:online_croceries/constants/assets.dart';
import 'package:online_croceries/constants/vin_color.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  child: Image.asset(
                    Assets.homeCard,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400)),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mùa quan tâm 1 người...",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.schedule,
                              size: 14,
                              color: Color(
                                VinColor.grey,
                              ),
                            ),
                            SizedBox(width: 6),
                            Text("14.10.2021 - 20.10.20.21",
                                style: TextStyle(
                                  color: Color(VinColor.grey),
                                  fontSize: 12,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
