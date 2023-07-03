import 'package:flutter/material.dart';
import 'package:landlord/data/model/property_list_model.dart';
import 'package:landlord/data/network/repository/repository.dart';
import 'package:landlord/data/provider/tenant_provider.dart';

import '../model/transactionListModel.dart';

class TransactionListProvider extends ChangeNotifier {
  TransactionListModel? transactionListResponse;
  final debounce = Debounce(milliseconds: 500);

  TransactionListProvider(BuildContext context) {
    getTransactionListData(context);
  }
  void getTransactionListData(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).getTransactionListData();
    if (apiResponse != null) {
      transactionListResponse = apiResponse;
    }
    notifyListeners();
  }

  void searchTransactionData(BuildContext context,String searchKey) async {
    debounce.run(() async {
      transactionListResponse = await RepositoryImpl(context).searchTransactionData(search: searchKey);
      notifyListeners();
    });
  }

}


