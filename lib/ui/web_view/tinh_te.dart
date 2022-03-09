import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TinhTe extends StatefulWidget {
  const TinhTe({Key? key}) : super(key: key);

  @override
  _TinhTeState createState() => _TinhTeState();
}

class _TinhTeState extends State<TinhTe> {
  late WebViewController controller;
  double progress = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Nút clear cache, để quay về trang gốc và xóa bỏ toàn bộ cookies
        leading: IconButton(
            onPressed: () {
              controller.clearCache();
            },
            icon: Icon(Icons.close)),
        actions: [
          // Nút back
          IconButton(
              onPressed: () async {
                // Kiểm tra xem có lịch sử nào ko, vì có mới có thể quay về đc
                // Ta cũng cần vô hiệu hóa nút back của điện thoại và chỉ sử dụng đc khi ta muốn thoát khỏi cái webview, nhuwng ta chỉ làm nếu cần thiết
                if (await controller.canGoBack()) {
                  controller.goBack();
                }
              },
              icon: Icon(Icons.arrow_back)),
          //Nút refesh
          IconButton(
              onPressed: () {
                controller.reload();
              },
              icon: Icon(Icons.refresh)),
        ],
        title: Text("Okay nè"),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            color: Colors.green,
            value: this.progress,
          ),
          Expanded(
            child: WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: "https://tinhte.vn/",
              onPageStarted: (url) {
                print("this is your urlL: ${url}");
              },
              onWebViewCreated: (controller) {
                this.controller = controller;
              },
              onProgress: (progress) => setState(() {
                // tỉ lê 
                this.progress = progress / 100;
              }),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final currentUrl = await controller.currentUrl();
          print("Current controller: ${currentUrl}");
        },
      ),
    );
  }
}
