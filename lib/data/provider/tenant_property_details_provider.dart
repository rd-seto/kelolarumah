import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:landlord/data/model/tenant_property_details.dart';
import 'package:landlord/data/model/tenant_wishlist_model.dart';
import 'package:landlord/data/network/repository/repository.dart';

class TenantPropertyDetailsProvider extends ChangeNotifier {
  TenantPropertyDetailsModel? tenantPropertyDetailModel;
  TenantWishlistModel? tenantWishlistModel;

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

  void addWishlist(
    context,
    propertyId,
    advertiseId,
    slugId,
  ) async {
    final data = {"property_id": propertyId};
    var apiResponse = await RepositoryImpl(context).addWishlist(data);
    if (apiResponse != null) {
      tenantWishlistModel = apiResponse;
      Fluttertoast.showToast(msg: tenantWishlistModel?.message ?? '');
      tenantPropertyDetails(context, advertiseId, slugId);
    }
    notifyListeners();
  }
}
