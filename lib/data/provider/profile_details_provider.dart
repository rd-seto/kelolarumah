import 'package:flutter/material.dart';
import 'package:landlord/data/model/profile_details_model.dart';
import 'package:landlord/data/network/repository/repository.dart';

class ProfileDetailsProvider extends ChangeNotifier {
  ProfileDetailsModel? profileDetails;

  ProfileDetailsProvider(BuildContext context) {
    profileDetailsData(context);
  }

  void profileDetailsData(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).getProfileDetails();
    if (apiResponse?.result == true) {
      profileDetails = apiResponse;
    }
    notifyListeners();
  }
}
