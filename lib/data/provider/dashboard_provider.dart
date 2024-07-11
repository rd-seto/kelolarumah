import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:landlord/data/model/dashboard_model.dart';
import 'package:landlord/data/network/repository/repository.dart';

class DashBoardProvider extends ChangeNotifier {
  DashboardModel? dashboardResponse;

  DashBoardProvider(BuildContext context) {
    FirebaseMessaging.instance.subscribeToTopic('landlord');
    dashboardData(context);
  }
  void dashboardData(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).getDashboardData();
    if (apiResponse != null) {
      dashboardResponse = apiResponse;
    }

    notifyListeners();
  }

  final List<DashboardDummyData> gridDashboardData = [
    DashboardDummyData(
      title: 'Add_Property',
      assetImage: 'assets/dashboard/add_tennats_icon.png',
    ),
    DashboardDummyData(
      title: 'Tenants',
      assetImage: 'assets/dashboard/add_property_img.png',
    ),
    DashboardDummyData(
      title: 'Add_Document',
      assetImage: 'assets/dashboard/add_document_icon.png',
    ),
    DashboardDummyData(
      title: 'Payment Report',
      assetImage: 'assets/dashboard/report_icon.png',
    ),
    DashboardDummyData(
      title: 'Tenant Report',
      assetImage: 'assets/dashboard/report_icon.png',
    ),
    DashboardDummyData(
      title: 'Add_Tenants',
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
