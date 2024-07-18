import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:landlord/data/network/repository/repository.dart';
import 'package:landlord/pages/landlord/home/bottom_navigation_bar/custom_bottom_nav.dart';
import '../../utils/custom_image_picker_dialog.dart';
import '../../utils/nav_utail.dart';
import '../model/bill_management_model.dart';
import '../model/tenant_account_model.dart';

class CollectBillProvider extends ChangeNotifier {
  ListElement? billData;
  File? attachmentPath;
  List<AccountList>? accountListResponse;
  var additionalTextController = TextEditingController();
  AccountList? occupiedValue;
  int? accountId;

  CollectBillProvider(BuildContext context){
    // getTenantAccountList(context);
  }

  /// dropdownMenu for Occupied type .....
  void dropdownMenu(AccountList? newValue) {
    occupiedValue = newValue;
    accountId = newValue?.id;
    notifyListeners();
  }


  void getTenantAccountList(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).tenantAccountList(billData?.tenantId);
    if (apiResponse.result == true) {
      accountListResponse = apiResponse.data;
      if (kDebugMode) {
        print(accountListResponse);
      }
    }else {
      Fluttertoast.showToast(msg: "Something went wrong");
    }
    notifyListeners();
  }

  ///Pick Attachment from Camera and Gallery
  Future<dynamic> updateAttachmentImage(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialogImagePicker(
          onCameraClick: () async {
            final ImagePicker picker = ImagePicker();
            final XFile? image = await picker.pickImage(source: ImageSource.camera, maxHeight: 300, maxWidth: 300, imageQuality: 90);
            attachmentPath = File(image!.path);
            notifyListeners();
          },
          onGalleryClick: () async {
            final ImagePicker pickerGallery = ImagePicker();
            final XFile? imageGallery = await pickerGallery.pickImage(source: ImageSource.gallery, maxHeight: 300, maxWidth: 300, imageQuality: 90);
            attachmentPath = File(imageGallery!.path);
            notifyListeners();
          },
        );
      },
    );
    notifyListeners();
  }



  void collectBillApi(context) async{
    var fileAttachment = attachmentPath?.path.split('/').last;
    final data = {
      "bill_id": billData?.id,
      "total_amount": billData?.totalAmount,
      "account_id": accountId,
      "payment_amount": billData?.totalAmount,
      "attachment_file":  attachmentPath?.path != null ? await MultipartFile.fromFile(attachmentPath!.path, filename: fileAttachment) : null,
      "additional_info": additionalTextController.text,
    };
    var apiResponse = await RepositoryImpl(context).collectBillApi(data);
    if (apiResponse['result'] == true) {
      additionalTextController.text = "";
      attachmentPath = null;
      Fluttertoast.showToast(msg: apiResponse['message']);
      NavUtil.replaceScreen(context, const CustomBottomNavBar());
    }else{
      Fluttertoast.showToast(msg: apiResponse['message']);
    }
    notifyListeners();
  }
}