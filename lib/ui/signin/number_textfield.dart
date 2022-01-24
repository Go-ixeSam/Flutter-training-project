import 'package:flutter/material.dart';
import 'package:online_croceries/widgets/textfield_border_none_widget.dart';
import 'package:online_croceries/widgets/textfield_widget.dart';

// ignore: must_be_immutable
class NumberTextField extends StatelessWidget {
  String? urlImageFlag;
  int? code;
  final TextEditingController? textEditingController;
  ValueChanged? onChanged;
  final String? error_text;

  NumberTextField(
      {Key? key,
      urlImage,
      code,
      required this.textEditingController,
      this.onChanged,
      required this.error_text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Column(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(5.0),
              child: Image.asset(
                urlImageFlag ?? 'assets/images/flag_country.png',
                height: (height / 100) * 3,
                width: (width / 100) * 9,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: Text(
                '+${code ?? 880}',
                style: const TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 16.0),
              ),
            ),
            Expanded(
              child:
              TextField(
                controller: textEditingController,
                cursorColor: Colors.grey,
                cursorHeight: 21,
                keyboardType: TextInputType.number,
                obscureText: true,
                obscuringCharacter: '-',
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            )
            // Flexible(
            //   child: Container(
            //     height:100,
            //     width: double.infinity,
            //     child: Align(
            //       alignment: Alignment(0.5, 0.7),
            //       child:
            //       TextFieldBorderNoneWidget(
            //         inputType: TextInputType.phone,
            //         textController: textEditingController!,
            //         inputAction: TextInputAction.next,
            //         autoFocus: false,
            //         onChanged: onChanged,
            //         errorText: error_text,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
        const Divider(thickness: 1.5, height: 0.3, color: Colors.grey),
      ],
    );
  }
}
