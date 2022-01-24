import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_croceries/ui/order_status/fail.dart';

class CheckOutWidget extends StatelessWidget {
  final VoidCallback? onTap;
  // const CheckOutWidget({Key? key}) : super(key: key);

  const CheckOutWidget({
    this.onTap
});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                const Text(
                  'Checkout',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.clear_rounded),
                ),
              ],
            ),
          ),
          const Divider(thickness: 1),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      const Text(
                        'Delivery',
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'Select Method',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      const Text(
                        'Payment',
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      Image.asset(
                        'assets/images/payment.png',
                        height: 22,
                        width: 25,
                        fit: BoxFit.fill,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      const Text(
                        'Promo Code',
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'Pick discount',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      Text(
                        'Total Cost',
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '\$13.97',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 1),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: RichText(
                    text: TextSpan(
                      text: 'By placing an order you agree to our ',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0,
                      ),
                      children: [
                        TextSpan(
                          text: 'Term ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(text: 'And '),
                        TextSpan(
                          text: 'Conditions',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onTap!,
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    decoration: BoxDecoration(
                      color: HexColor("#53B175"),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      'Place Order',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
