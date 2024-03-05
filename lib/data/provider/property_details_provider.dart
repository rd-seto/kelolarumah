import 'package:flutter/material.dart';
import 'package:landlord/data/model/property_details_model.dart';
import 'package:landlord/data/model/tenant_property_details.dart';
import 'package:landlord/data/model/tenant_property_model.dart';
import 'package:landlord/data/network/repository/repository.dart';

class PropertyDetailsProvider extends ChangeNotifier {
  PropertyDetailsModel? propertyDetailsResponse;
  TenantPropertyDetailsModel? tenantPropertyDetailModel;
  TextEditingController sizeController = TextEditingController();
  TextEditingController rentAmountController = TextEditingController();
  TextEditingController bedroomController = TextEditingController();
  TextEditingController bathroomController = TextEditingController();
  TextEditingController flatNoController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  PropertyDetailsProvider(context, int? propertyId) {
    propertyDetails(context, propertyId);
  }

  void propertyDetails(context, propertyId) async {
    var apiResponse =
        await RepositoryImpl(context).getPropertyDetails(propertyId);
    if (apiResponse != null) {
      propertyDetailsResponse = apiResponse;
    }
    notifyListeners();
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
