import 'package:flutter/material.dart';
import 'package:landlord/data/model/cashmanagement_list_model.dart';
import 'package:landlord/data/network/repository/repository.dart';

class CashManagementListProvider extends ChangeNotifier {
  CashManagementListModel? cashManagementListResponse;

  CashManagementListProvider(BuildContext context) {
    getCashManagementListData(context);
  }
  void getCashManagementListData(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).getCashManagementListData();
    if (apiResponse != null) {
      cashManagementListResponse = apiResponse;
    }
    notifyListeners();
  }
}
