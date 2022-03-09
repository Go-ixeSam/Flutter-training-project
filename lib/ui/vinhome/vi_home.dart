// import 'dart:html';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_croceries/constants/assets.dart';
import 'package:online_croceries/constants/vin_color.dart';
import 'package:online_croceries/ui/vinhome/big_cion.dart';
import 'package:online_croceries/utils/routes/routes.dart';
import 'package:online_croceries/widgets/button_tab.dart';
import 'package:online_croceries/widgets/headline.dart';
import 'package:online_croceries/widgets/home_card.dart';
import 'package:online_croceries/widgets/home_card_style_2.dart';
import 'package:online_croceries/widgets/succes_pop_up.dart';

class ViHome extends StatefulWidget {
  const ViHome({Key? key}) : super(key: key);

  @override
  _ViHomeState createState() => _ViHomeState();
}

class _ViHomeState extends State<ViHome> {
  double radius = 70;
  List<String> slide = [Assets.girl1, Assets.girl2, Assets.girl3];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // color: Colors.black,
              height: 300,
              // width: double.infinity,
              child: Stack(
                children: [
                  buildRedGround(),
                  Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: buildCarosel()),
                      // child: _buildImageSlider()),
                ],
              ),
            ),
            Column(
              children: [
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildButtonTab("Tin tức", Assets.news),
                  buildButtonTab("Ưu đãi", Assets.news),
                  buildButtonTab("Xu hướng", Assets.news)
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              height: 6,
              color: Colors.grey.shade300,
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Text("Ưu đãi nổi bật",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))
                  ]),
                  Text(
                    "Xem tất cả",
                    style: TextStyle(color: Color(VinColor.red)),
                  )
                ],
              ),
            ),
            // ViSuccessDialog()
            buildFirstListView(),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Healine(text: "Xem tất cả",),
            ),
            buildSecondListView()
              ],
            )
          ],
        ),
      ),
    );
  }

  buildFirstListView() {
    return Container(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 15, bottom: 15),
          itemCount: 5,
          itemBuilder: (context, index) {
            return HomeCard();
          }),
    );
  }

  buildSecondListView() {
    List<String> strArr = [Assets.lai_thuyen, Assets.lai_thuyen];
    List<String> showArr = [
      "Biểu tượng quốc gia",
      "Tự hào địa phương",
      "Điểm hẹn niềm vui"
    ];
    return Container(
      height: 165,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 15, bottom: 15),
          itemCount: strArr.length,
          itemBuilder: (context, index) {
            return HomeCardStyleTwo(
              text: showArr[index],
              imageName: strArr[index],
            );
          }),
    );
  }

  buildButtonTab(String text, String iconName) {
    return Column(children: [
      ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        child: ButtonTab(
          icon: SvgPicture.asset(
            iconName,
            color: Color(VinColor.red),
          ),
        ),
      ),
      SizedBox(
        height: 8,
      ),
      Text(
        text,
        style: TextStyle(color: Color(VinColor.grey)),
      )
    ]);
  }

  buildTestClippath() {
    // return ClipPath(
    //   clipper: TestClip(),
    //   child: Container(
    //     color: Colors.blue,
    //   ),
    // );

    return Container(
        color: Colors.green,
        child: CustomPaint(painter: PathPainter(), child: Container()));
  }

  buildRedGround() {
    return ClipPath(
      // clipper: RedClipper(),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(300, 50),
                bottomRight: Radius.elliptical(300, 50))),
        child: Column(
          children: [
            SizedBox(
              height: 28 * 2,
            ),
            buildTopText()
          ],
        ),
      ),
    );
  }

  buildTopText() {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Chào buổi sáng, hôm nay 25c",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.person_outline,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Nguyễn Khắc Sâm",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                ],
              )
            ],
          ),
          // SizedBox(width: 38,),
          Row(
            children: [
              BigIcon(
                iconName: Icons.search,
                acttion: (){
                  Navigator.of(context).pushNamed(Routes.homeSearch);
                },
              ),
              SizedBox(
                width: 16,
              ),
              BigIcon(
                iconName: Icons.notifications_none,
                acttion: (){},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildImageSlider() {
    return Container(
      width: double.infinity,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          autoPlayInterval: Duration(seconds: 3),
        ),
        itemCount: slide.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              slide[index],
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }

  buildCarosel() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 160,
        initialPage: 0,
        // aspectRatio: 5,
        enlargeCenterPage: true,
      ),
      items: slide.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                child: Container(
                    width: double.infinity,
                    child: Image.asset(i, fit: BoxFit.cover)));
          },
        );
      }).toList(),
    );
  }
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint =
        Paint() //todo: đối tượng Paint giống như là 1 cái cọ,cọ kiểu stroke, có màu đỏ và kích thước đường nét của cọ rộng 8
          ..color = Colors.red
          ..style = PaintingStyle.fill
          ..strokeWidth = 8.0;

    Path path = Path();
    // TODO: do operations here
    // Moves starting point to the center of the screen
    //todo: moveTo sẽ giúp ta di chuyển điểm bắt đầu để vẽ, nói thực tế là điểm mà ta chấm bút lần đầu mõi khi vẽ tranh, điểm bắt đầu là 0,0, ta muốn bắt đầu vẽ ở điểm nào thì cứ điền vào
    // path.moveTo(size.width / 2, size.height / 2);
    // path.close();

    //todo: vẽ uốn lượng, giúp ta dễ dàng tạo ra một đường uốn lượn như sóng
    // path.cubicTo(size.width / 4, 3 * size.height / 4, 3 * size.width / 4, size.height / 4, size.width, size.height);

    //todo: Nếu trọng lượng lớn hơn 1, hình được vẽ là hyperbol. Nếu trọng số là 1 thì hình dạng được vẽ là hình parabol và nếu nó nhỏ hơn 1, hình dạng được vẽ sẽ là hình elip.
    // path.conicTo(size.width / 4, 3 * size.height / 4, size.width, size.height, 20);

    //todo: vẽ 1 đường cong bằng compa, dễ hiểu là ta có 1 cái compa, và ta sẽ dùng nó để vẽ
    // num degToRad(num deg) => deg * (Math.pi / 180.0);
    // path.arcTo(Rect.fromLTWH(size.width / 2, size.height / 2, size.width / 4, size.height / 4), degToRad(0), degToRad(90), true);

    //todo: vẽ 1 hình chữ nhật
    // path.addRect(Rect.fromLTWH(size.width / 2, size.height / 2, size.width / 4, size.height / 4));

    //todo: vẽ hình oval
    // path.addOval(Rect.fromLTWH(size.width / 2, size.height / 2, size.width / 4, size.height / 4));
    //todo: ngoài hàng loạt phương thức add mà đọc báo mới hiểu

    path.lineTo(size.width / 2, size.height / 2);
    path.lineTo(size.width, size.height / 2);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class TestClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip

    var path = Path();
    print("blue");
    print(size);
    // path.lineTo(
    //     0,
    //     size.height -
    //         150); //todo: vẽ 1 đoạn thằng từ điểm hiện tại đến điểm đã cho
    var controlPoint = Offset(150, size.height); //todo: Tạo ra điểm cần vẽ
    var endPoint =
        Offset(size.width / 2, size.height); //todo: Tạo ra điểm cần vẽ
    // path.quadraticBezierTo(
    //     controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    // path.lineTo(size.width, 0);
    path.lineTo(size.width / 2, size.height / 2);
    path.lineTo(size.width, size.height / 2);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class RedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    print(size);
    try {
      // path.lineTo(0,
      //     size.width); //todo: thêm 1 đoạn thằng từ điểm hiện tại đến điểm đã cho
      path.lineTo(0, size.height);
      path.lineTo(size.width, size.height);
      var controlPoint = Offset(50, 50); //todo: 2 điểm đầu của đường cong
      var endPoint = Offset(90, 90); //todo: 2 điểm cuối của đường cong
      // path.quadraticBezierTo(
      //     controlPoint.dx,
      //     controlPoint.dy,
      //     endPoint.dx,
      //     endPoint
      //         .dy); //todo: tạo ra 1 đường cong, để có thể tạo ra 1 đường cong thì cần có 4 điểm, rồi ta nhìn vào hình trong link google sẽ biết từ 4 điểm sẽ cho ra 1 đường thằng
      //todo: https://www.google.com/search?q=quadratic+bezier+segment&lr=lang_vi&tbs=lr:lang_1vi&sxsrf=AOaemvIhiEPkuuqdopujsPJrl-CtRgIekw:1642585233657&source=lnms&tbm=isch&sa=X&ved=2ahUKEwiT1fXqwr31AhXAyzgGHeGTC2AQ_AUoAXoECAEQAw&biw=910&bih=960&dpr=1#imgrc=UcuySAQ6cICWOM
    } catch (e) {
      print(e);
    }
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    // throw UnimplementedError();
    return true;
  }
}
