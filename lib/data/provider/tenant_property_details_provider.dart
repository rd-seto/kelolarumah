import 'package:flutter/material.dart';
import 'package:landlord/data/model/tenant_property_details.dart';
import 'package:landlord/data/network/repository/repository.dart';

class TenantPropertyDetailsProvider extends ChangeNotifier {
  TenantPropertyDetailsModel? tenantPropertyDetailModel;

  TenantPropertyDetailsProvider(context, int? propertyId, slug) {
    tenantPropertyDetails(context, propertyId, slug);
  }

  void tenantPropertyDetails(context, propertyId, slug) async {
    var apiResponse = await RepositoryImpl(context)
        .getTenantPropertyDetails(propertyId, slug);
    if (apiResponse != null) {
      tenantPropertyDetailModel = apiResponse;
    }
    notifyListeners();
  }
}
