import 'package:flutter/material.dart';
import 'package:landlord/data/model/bill_management_model.dart';
import 'package:landlord/data/network/repository/repository.dart';

class BillManagementListProvider extends ChangeNotifier {
  BillManagementModel? billManagementListResponse;

  BillManagementListProvider(BuildContext context) {
    getBillManagementListData(context);
  }
  void getBillManagementListData(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).getBillManagementListData();
    if (apiResponse != null) {
      billManagementListResponse = apiResponse;
    }
    notifyListeners();
  }
}
