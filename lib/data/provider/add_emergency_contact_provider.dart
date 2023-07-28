
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:landlord/data/network/repository/repository.dart';
import 'package:landlord/data/provider/tenant_provider.dart';
import 'package:landlord/data/provider/tenants_details_provider.dart';
import 'package:landlord/pages/home/drawer/tenants/tenants_details/tenants_details_screen.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class AddEmergencyContractProvider extends ChangeNotifier {

  XFile? image;
  final ImagePicker picker = ImagePicker();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final relationController = TextEditingController();
  final occupationController = TextEditingController();

  final debounce = Debounce(milliseconds: 500);


  AddEmergencyContractProvider(context){}


  void addEmergencyContract(context, tenantId, VoidCallback onDone) async {
    final data = {
      "name" : nameController.text,
      "occupied" : occupationController.text,
      "relation" : relationController.text,
      "email" : emailController.text,
      "phone" : phoneController.text,
      "image_id" : File(image?.path ?? "")
    };
    var apiResponse = await RepositoryImpl(context).createEmergencyContact(data, tenantId);
    if(apiResponse["result"] == true){
      Fluttertoast.showToast(msg: apiResponse['message']);
      clearData();
      onDone();
      debounce.run(() {
        Navigator.pop(context);
      });
    }
    notifyListeners();
  }

  clearData(){
    nameController.text = "";
    occupationController.text = "";
    relationController.text = "";
    emailController.text = "";
    phoneController.text = "";
    image = null;
  }




  void myAlert(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title:const Center(child:  Text('Please choose media to select', textAlign: TextAlign.center )),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.colorPrimary),
                    child:const Row(

                      children:   [

                        Icon(Icons.image),
                        SizedBox(
                          width: 16,
                        ),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.colorPrimary),
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child:const Row(
                      children:   [
                        Icon(Icons.camera),
                        SizedBox(
                          width: 16,
                        ),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  //we can upload ~ from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);
    image = img;
    notifyListeners();
  }
}