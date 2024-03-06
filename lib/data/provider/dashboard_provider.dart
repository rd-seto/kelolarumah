import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:landlord/data/model/dashboard_model.dart';
import 'package:landlord/data/network/repository/repository.dart';

class DashBoardProvider extends ChangeNotifier {
  DashboardModel? dashboardRespone;

  DashBoardProvider(BuildContext context) {
    FirebaseMessaging.instance.subscribeToTopic('landlord');
    dashboardData(context);
  }
  void dashboardData(BuildContext context) async {
    var apiRespone = await RepositoryImpl(context).getDashboardData();
    if (apiRespone != null) {
      dashboardRespone = apiRespone;
    }

    notifyListeners();
  }

  final List<DashboardDummyData> gridDashboardData = [
    DashboardDummyData(
      title: 'total_order',
      assetImage: 'assets/dashboard/add_tennats_icon.png',
    ),
    DashboardDummyData(
      title: 'my_wishlist',
      assetImage: 'assets/dashboard/add_property_img.png',
    ),
    DashboardDummyData(
      title: 'purchase_amount',
      assetImage: 'assets/dashboard/add_transaction_icon.png',
    ),
    DashboardDummyData(
      title: 'product_in_cart',
      assetImage: 'assets/dashboard/add_document_icon.png',
    ),
    DashboardDummyData(
      title: 'coupon_used',
      assetImage: 'assets/dashboard/report_icon.png',
    ),
    DashboardDummyData(
      title: 'completed_order',
      assetImage: 'assets/dashboard/add_property_img.png',
    ),
  ];
}

class DashboardDummyData {
  String? title;
  String? assetImage;

  DashboardDummyData({
    this.title,
    this.assetImage,
  });
}
