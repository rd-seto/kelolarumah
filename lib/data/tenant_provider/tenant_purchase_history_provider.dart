import 'package:flutter/material.dart';
import 'package:landlord/data/model/tenant_purchase_history_model.dart';
import 'package:landlord/data/network/repository/repository.dart';

class TenantPurchaseHistoryProvider extends ChangeNotifier{
  TenantPurchaseHistoryModel? purchaseHistory;
  TenantPurchaseHistoryProvider(BuildContext context) {
    purchaseHistoryData(context);
  }
  void purchaseHistoryData(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).getTenantPurchaseHistoryData();
    if (apiResponse != null) {
      purchaseHistory = apiResponse;
    }
    notifyListeners();
  }
}