import 'package:flutter/material.dart';
import 'package:landlord/data/model/tenants_details_model.dart';
import 'package:landlord/data/network/repository/repository.dart';

class TenantsDetailsProvider extends ChangeNotifier {
  TenantsDetailsModel? tenantsDetailsResponse;

  TenantsDetailsProvider(BuildContext context, tenantId) {
    tenantsDetailsData(context, tenantId);
  }

  void tenantsDetailsData(BuildContext context, tenantId) async {
    var apiResponse = await RepositoryImpl(context).getTenantsDetails(tenantId);
    if (apiResponse != null) {
      tenantsDetailsResponse = apiResponse;
    }
    notifyListeners();
  }
}
