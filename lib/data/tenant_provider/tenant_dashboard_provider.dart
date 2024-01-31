import 'package:flutter/material.dart';
import 'package:landlord/data/model/tenants_dashboard_model.dart';
import 'package:landlord/data/network/repository/repository.dart';

class TenantDashboardProvider extends ChangeNotifier{
  TenantsDashboardModel? tenantsDashboard;
  TenantDashboardProvider(BuildContext context) {
    dashboardData(context);
  }
  void dashboardData(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).getTenantsDashboardData();
    if (apiResponse != null) {
      tenantsDashboard = apiResponse;
    }
    notifyListeners();
  }
}