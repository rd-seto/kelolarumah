import 'package:flutter/material.dart';
import 'package:landlord/data/model/tenants_dashboard_model.dart';
import 'package:landlord/data/network/repository/repository.dart';

class TenantDashboardProvider extends ChangeNotifier{
  TenantsDashboardModel? tenantsDashboard;
  bool isLoading = false;
  TenantDashboardProvider(BuildContext context) {
    dashboardData(context);
  }
  isLoad(){
    isLoading = !isLoading;
    notifyListeners();
  }
  void dashboardData(BuildContext context) async {
    isLoad();
    var apiResponse = await RepositoryImpl(context).getTenantsDashboardData();
    isLoad();
    if (apiResponse != null) {
      tenantsDashboard = apiResponse;
    }
    notifyListeners();
  }
}