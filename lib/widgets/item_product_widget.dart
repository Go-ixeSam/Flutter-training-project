import 'package:flutter/material.dart';
import 'package:online_croceries/models/product/product.dart';

class ItemProductWidget extends StatelessWidget {
  final Product product;

  const ItemProductWidget({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(color: Colors.grey.withOpacity(0.5)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Align(
                alignment: Alignment.center,
                child: Image.network(
                  product.image.toString(),
                  height: 80.0,
                ),
              ),
            ),
            Text(
              product.name ?? 'Not Product Name',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  '\$${product.price ?? 1.99}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    ///
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.green[400],
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: const Icon(Icons.add_rounded, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
