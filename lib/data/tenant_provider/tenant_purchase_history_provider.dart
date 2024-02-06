import 'package:flutter/material.dart';
import 'package:landlord/data/model/tenant_purchase_history_model.dart';
import 'package:landlord/data/network/repository/repository.dart';

class TenantPurchaseHistoryProvider extends ChangeNotifier{
  TenantPurchaseHistoryModel? tenantPurchaseHistory;
  TenantPurchaseHistoryProvider();

  Future<TenantPurchaseHistoryModel?> purchaseHistoryData(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).getTenantPurchaseHistoryData();
    if (apiResponse != null) {
       return tenantPurchaseHistory = apiResponse;
    }
    return null;
  }
}