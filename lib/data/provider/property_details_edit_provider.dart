import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:landlord/data/model/property_basic_info_body_model.dart';
import 'package:landlord/data/model/property_details_model.dart';
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
  String? typeValue;

  String? completionId;

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController bedroomController = TextEditingController();
  TextEditingController bathroomController = TextEditingController();
  TextEditingController rentAmountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController flatNumberController = TextEditingController();

  PropertyDetailsEditProvider({context, PropertyDetailsModel? propertyData}) {
    setBasicInfoControllerData(propertyData);
    // getTenantProperties(context: context);
  }
  void addGalleryImage(context, propertyData, VoidCallback onDone) async {
    final data = {
      "title": titleController.text,
      "property_id": propertyData,
      "image": File(image?.path ?? ""),
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

  void floorPlanImageAdd(context, propertyData, VoidCallback onDone) async {
    final data = {
      "title": titleController.text,
      "property_id": propertyData,
      "image": File(image?.path ?? ""),
    };
    await RepositoryImpl(context).floorPlanImageAdd(data).then((success) {
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
                        Icon(
                          Icons.image,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          'From Gallery',
                          style: TextStyle(color: Colors.white),
                        ),
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
                        Icon(
                          Icons.camera,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text('From Camera',
                            style: TextStyle(color: Colors.white)),
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
    final data = {
      "size": sizeController.text,
      "rent_amount": rentAmountController.text,
      "bedroom": bedroomController.text,
      "bathroom": bathroomController.text,
      "flat_no": flatNumberController.text,
      "type": completionId,
      "property_category_id": typeValue,
      "description": descriptionController.text,
      "name": nameController.text,
      "country_id": '1',
      "address": addressController.text
    };
    RepositoryImpl(context)
        .propertyEditBasicInfo(data, propertyId)
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

  setPropertyId(String? typeName) {
    if (typeName == 'Residential') {
      typeValue = '1';
    } else {
      typeValue = '0';
    }
  }

  setCompletionId(String? completionName) {
    if (completionName == 'Complete') {
      completionId = '1';
    } else {
      completionId = '0';
    }
  }

  setBasicInfoControllerData(PropertyDetailsModel? propertyData) {
    nameController.text = propertyData?.data?.property?.name ?? '';
    rentAmountController.text =
        propertyData?.data?.property?.rentAmount.toString() ?? '';
    bedroomController.text =
        propertyData?.data?.property?.bedroom.toString() ?? '';
    bathroomController.text =
        propertyData?.data?.property?.bathroom.toString() ?? '';
    flatNumberController.text = propertyData?.data?.property?.flatNo ?? '';
    addressController.text = propertyData?.data?.property?.address ?? '';
    sizeController.text = propertyData?.data?.property?.size ?? '';
    descriptionController.text =
        propertyData?.data?.property?.description ?? '';
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
