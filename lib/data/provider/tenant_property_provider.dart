import 'package:flutter/material.dart';
import 'package:landlord/data/model/tenant_property_model.dart';
import 'package:landlord/data/model/tenant_search_model.dart';
import 'package:landlord/data/network/repository/repository.dart';
import 'package:landlord/data/provider/tenant_provider.dart';

class TenantPropertyProvider extends ChangeNotifier {
  TenantPropertyModel? tenantPropertyModel;
  TenantSearchModel? searchData;
  final debounce = Debounce(milliseconds: 500);

  TenantPropertyProvider(BuildContext context) {
    tenantPropertyData(context);
  }

  void searchPropertyData(BuildContext context, String searchKey) async {
    final data = {"search": searchKey};
    debounce.run(() async {
      searchData = await RepositoryImpl(context).searchTenantPropertyData(data);
      notifyListeners();
    });
    notifyListeners();
  }

  void tenantPropertyData(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).getTenantPropertyData();
    if (apiResponse != null) {
      tenantPropertyModel = apiResponse;
    }
    notifyListeners();
  }
}
