import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:landlord/data/local/local_auth_provider.dart';
import 'package:landlord/data/model/profile_update_model.dart';
import 'package:landlord/data/provider/tenant_provider.dart';
import 'package:landlord/pages/landlord/home/bottom_navigation_bar/custom_bottom_nav.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:provider/provider.dart';
import '../../utils/custom_image_picker_dialog.dart';
import '../network/repository/repository.dart';

class UpdateProfileProvider extends ChangeNotifier {
  ProfileBasicInfoUpdateModel profileBasicInfo = ProfileBasicInfoUpdateModel();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  File? imagePath;


  final debounce = Debounce(milliseconds: 500);

  void postProfileData(BuildContext context, VoidCallback onDone) async {
    profileBasicInfo.userImage = imagePath;
    RepositoryImpl(context)
        .updateProfile(model: profileBasicInfo)
        .then((success) {
      if (success) {
        Fluttertoast.showToast(msg: "Successfully updated");
        onDone();
        debounce.run(() {
          Navigator.pop(context);
        });
      }
    });
  }

  void passwordUpdate(context) async {
    final data = {
      "current_password": oldPasswordController.text,
      "password": newPasswordController.text,
      "password_confirmation": confirmPasswordController.text
    };
    var apiResponse = await RepositoryImpl(context).postPasswordUpdate(data);
    if (apiResponse["message"] == "Password changed successfully") {
      Fluttertoast.showToast(msg: apiResponse['message']);
      NavUtil.pushAndRemoveUntil(context, const CustomBottomNavBar());
      oldPasswordController.clear();
      newPasswordController.clear();
      confirmPasswordController.clear();
      notifyListeners();
    } else if(apiResponse["message"] == "Current password is incorrect") {
      Fluttertoast.showToast(msg: apiResponse['message']);
      notifyListeners();
    }
    else{
      Fluttertoast.showToast(msg: apiResponse['message']);
      notifyListeners();
    }
  }

  ///Pick image from Camera and Gallery
  Future<dynamic> pickImage(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialogImagePicker(
          onCameraClick: () async {
            final ImagePicker picker = ImagePicker();
            final XFile? image = await picker.pickImage(
                source: ImageSource.camera,
                maxHeight: 300.h,
                maxWidth: 300.w,
                imageQuality: 90);
            imagePath = File(image!.path);
            notifyListeners();
            if (kDebugMode) {
              print(File(image.path));
            }
          },
          onGalleryClick: () async {
            final ImagePicker pickerGallery = ImagePicker();
            final XFile? imageGallery = await pickerGallery.pickImage(
                source: ImageSource.gallery,
                maxHeight: 300.h,
                maxWidth: 300.w,
                imageQuality: 90);
            imagePath = File(imageGallery!.path);
            if (kDebugMode) {
              print(File(imageGallery.path));
            }
            notifyListeners();
          },
        );
      },
    );
    notifyListeners();
  }

}
