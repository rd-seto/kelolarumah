import 'package:flutter/material.dart';
import 'package:landlord/data/model/property_details_model.dart';
import 'package:landlord/data/model/property_list_model.dart';
import 'package:landlord/data/network/repository/repository.dart';
import 'package:landlord/data/provider/tenant_provider.dart';
class PropertyProvider extends ChangeNotifier {
  PropertyListModel? propertyListResponse;
  final debounce = Debounce(milliseconds: 500);

  PropertyProvider(BuildContext context) {
    propertyData(context);
  }
  void propertyData(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).getPropertyData();
    if (apiResponse != null) {
      propertyListResponse = apiResponse;
    }
    notifyListeners();
  }

  void searchPropertyData(BuildContext context,String searchKey) async {
    debounce.run(() async {
      propertyListResponse = await RepositoryImpl(context).searchPropertyData(search: searchKey);
      notifyListeners();
    });
  }
}


