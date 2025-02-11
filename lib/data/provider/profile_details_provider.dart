import 'package:flutter/material.dart';
import 'package:landlord/data/model/profile_details_model.dart';
import 'package:landlord/data/network/repository/repository.dart';
import 'package:landlord/utils/global_state.dart';
import 'package:provider/provider.dart';

import '../local/local_auth_provider.dart';
import '../model/user_model.dart';

class ProfileDetailsProvider extends ChangeNotifier {
  ProfileDetailsModel? profileDetails;

  ProfileDetailsProvider(BuildContext context) {
    profileDetailsData(context);
  }

  void profileDetailsData(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).getProfileDetails();
    if (apiResponse?.status == true) {
      profileDetails = apiResponse;
      String? token = GlobalState.instance.get("token");
      context.read<LocalAutProvider>().updateUser(UserModel(
        roleId: profileDetails?.data.profileInfo.roleId,
        token: token,
        name: profileDetails?.data.profileInfo.name,
        email: profileDetails?.data.profileInfo.email,
        phone: profileDetails?.data.profileInfo.phone,
        passport: profileDetails?.data.profileInfo.passport,
        avatar: profileDetails?.data.profileInfo.avatar,
      ));


    }
    notifyListeners();
  }
}
