import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:landlord/pages/auth/login/login_screen.dart';
import 'package:landlord/pages/home/bottom_navigation_bar/custom_bottom_nav.dart';
import 'package:landlord/pages/home/dashboard/dashboard_screen.dart';
import 'package:landlord/pages/home/home_screen/home_screen.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:provider/provider.dart';
import '../local/local_auth_provider.dart';
import '../network/repository/repository.dart';

class UpdateProfileProvider extends ChangeNotifier{


  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  updateProfile({required Map<String,dynamic> json,required BuildContext context}){
    RepositoryImpl(context).updateProfile(json: json).then((user){
      if(user != null){
        debugPrint('Profile data updated');
        Provider.of<LocalAutProvider>(context,listen: false).updateUser(user);
        Navigator.of(context).pop();
      }
    });
  }

  void passwordUpdate (context) async {
    final data = {
      "password": oldPasswordController.text,
      "new_password": newPasswordController.text,
      "confirm_password": confirmPasswordController.text
    };
    var apiResponse = await RepositoryImpl(context).postPasswordUpdate(data);
    if(apiResponse["message"] == "Password changed successfully"){
      Fluttertoast.showToast(msg: apiResponse['message']);
      NavUtil.pushAndRemoveUntil(context, const CustomBottomNavBar());
      oldPasswordController.clear();
      newPasswordController.clear();
      confirmPasswordController.clear();
      notifyListeners();
    }
    else  {
      Fluttertoast.showToast(msg: apiResponse['message']);
    }
  }

  //   updatePassword({required Map<String,dynamic> json,required BuildContext context}){
  //   RepositoryImpl(context).updatePassword(json: json).then((updatedPasswordValue){
  //     if(updatedPasswordValue != null){
  //       debugPrint('Profile password updated');
  //       //Provider.of<LocalAutProvider>(context,listen: false).updateUser(UpdatePassword);
  //       notifyListeners();
  //     }
  //   });
  // }

}