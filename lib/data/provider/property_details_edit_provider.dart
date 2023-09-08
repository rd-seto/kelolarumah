import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:landlord/data/model/property_basic_info_body_model.dart';
import 'package:landlord/data/model/property_facelities_model.dart';
import 'package:landlord/data/network/repository/repository.dart';
import 'package:landlord/data/provider/tenant_provider.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class PropertyDetailsEditProvider extends ChangeNotifier {
  PropertyBasicInfoModel propertyEditBodyModel = PropertyBasicInfoModel();
  PropertyFacilitiesModel propertyFacilitiesBodyModel =
      PropertyFacilitiesModel();
  TextEditingController titleController = TextEditingController();
  TextEditingController facilitiesController = TextEditingController();
  List<FacilityType> facilities = [];
  FacilityType? selectedfacilities;
  XFile? image;
  String? facilityType;
  final ImagePicker picker = ImagePicker();
  final debounce = Debounce(milliseconds: 500);
  String? typeId;

  PropertyDetailsEditProvider(context) {
    getTenantProperties(context: context);
  }
  void addImage(context, propertyData, VoidCallback onDone, String type) async {
    final data = {
      "title": titleController.text,
      "type": type,
      "property_id": propertyData,
      "image_id": File(image?.path ?? ""),
    };
    await RepositoryImpl(context).postGalleryImage(data).then((success) {
      if (success = true) {
        Fluttertoast.showToast(msg: 'Successfully Updated');
        onDone();
        debounce.run(() {
          Navigator.pop(context);
        });
      } else {
        Fluttertoast.showToast(msg: 'Something Went Wrong');
        debounce.run(() {
          Navigator.pop(context);
        });
      }
    });

    notifyListeners();
  }

  void imgagePicker(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Center(
                child: Text('Please choose media to select',
                    textAlign: TextAlign.center)),
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
                    child: const Row(
                      children: [
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
                    child: const Row(
                      children: [
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

  void editPropertyBasicInfo(
      BuildContext context, int? propertyId, VoidCallback onDone) async {
    RepositoryImpl(context)
        .propertyEditBasicInfo(
            model: propertyEditBodyModel, propertyId: propertyId)
        .then((success) {
      if (success) {
        Fluttertoast.showToast(msg: "Successfully updated");
        onDone();
        debounce.run(() {
          Navigator.pop(context);
        });
        notifyListeners();
      } else {
        Fluttertoast.showToast(msg: "Something went wrong");
      }
    });
  }

  void getTenantProperties({required BuildContext context}) async {
    facilities = await RepositoryImpl(context).getFacilitiesData();
    selectedfacilities = facilities.first;
    notifyListeners();
  }

  onPropertySelect({required FacilityType selectId}) {
    selectedfacilities = selectId;
    typeId = '${selectedfacilities?.id}';
    print('typeId${typeId}');
    notifyListeners();
  }

  void addFacelities(context, VoidCallback onDone, int facilityId) async {
    final data = {
      "content": [facilitiesController.text],
      "property_facility_type_id": [typeId],
    };
    // var  data = json.encode(body);
    await RepositoryImpl(context)
        .addFacilitiesData(data, facilityId)
        .then((success) {
      if (success = true) {
        Fluttertoast.showToast(msg: 'Successfully Updated');
        onDone();
        debounce.run(() {
          Navigator.pop(context);
        });
      } else {
        Fluttertoast.showToast(msg: 'Something Went Wrong');
        debounce.run(() {
          Navigator.pop(context);
        });
      }
    });

    notifyListeners();
  }
}
