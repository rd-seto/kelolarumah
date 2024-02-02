import 'package:flutter/material.dart';
import 'package:landlord/data/model/tenant_wishlist_model.dart';
import 'package:landlord/data/network/repository/repository.dart';

class TenantWishlistProvider extends ChangeNotifier {
  TenantWishlistModel? tenantWishlist;

  TenantWishlistProvider();

  Future<TenantWishlistModel?> getTenantWishlist(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).getTenantWishlists();
    if (apiResponse != null) {
      return tenantWishlist = apiResponse;
    }
    return null;
  }
}
