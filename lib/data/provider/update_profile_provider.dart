import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:landlord/data/model/profile_update_model.dart';
import 'package:landlord/data/provider/tenant_provider.dart';
import 'package:landlord/pages/home/bottom_navigation_bar/custom_bottom_nav.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:provider/provider.dart';
import '../local/local_auth_provider.dart';
import '../network/repository/repository.dart';

class UpdateProfileProvider extends ChangeNotifier{

  ProfileBasicInfoUpdateModel profileBasicInfo = ProfileBasicInfoUpdateModel();

  // TextEditingController userNameController = TextEditingController();
  // TextEditingController userEmailController = TextEditingController();
  // TextEditingController userOccupationController = TextEditingController();
  // TextEditingController userInstituteController = TextEditingController();
  // TextEditingController userGenderController = TextEditingController();
  // TextEditingController userPhoneController = TextEditingController();
  // TextEditingController userNidController = TextEditingController();



  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  final debounce = Debounce(milliseconds: 500);


  // updateProfile({required Map<String,dynamic> json,required BuildContext context}){
  //   RepositoryImpl(context).updateProfile(json: json).then((user){
  //     if(user != null){
  //       debugPrint('Profile data updated');
  //       Provider.of<LocalAutProvider>(context,listen: false).updateUser(user);
  //       Navigator.of(context).pop();
  //     }
  //   });
  // }

  void postProfileData (BuildContext context, VoidCallback onDone) async {

    RepositoryImpl(context).updateProfile(model: profileBasicInfo).then((success){
      if (success) {
        Fluttertoast.showToast(msg: "Successfully updated");
        onDone();
        debounce.run((){
          Navigator.pop(context);
        });
      }
    });

    // RepositoryImpl(context).updateProfile(data);
    // if(apiResponse["result"] == true){
    //   Fluttertoast.showToast(msg: apiResponse['message']);
    //   Navigator.of(context).pop();
    //   notifyListeners();
    // }
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

}