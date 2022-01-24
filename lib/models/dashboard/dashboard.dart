import 'package:online_croceries/models/dashboard/dashboard_image.dart';

class DashBoard {
  final List<DashboardImage>? dashboardImages;

  DashBoard({this.dashboardImages});
  factory DashBoard.fromJson(List<dynamic> json) {
    List<DashboardImage> categories = <DashboardImage>[];
    categories =
        json.map((category) => DashboardImage.fromJson(category)).toList();

    return DashBoard(
      dashboardImages: categories,
    );
  }
}
