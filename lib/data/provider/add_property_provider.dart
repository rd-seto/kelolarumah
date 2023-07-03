import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:landlord/data/model/add_property_data_model.dart';
import 'package:landlord/data/model/add_transaction_model.dart';
import 'package:landlord/data/model/location_model.dart';
import 'package:landlord/data/network/repository/repository.dart';
import 'package:landlord/pages/home/drawer/properties/add_property/location/area_screen.dart';
import 'package:landlord/pages/home/drawer/properties/add_property/location/district_screen.dart';
import 'package:landlord/pages/home/drawer/properties/add_property/location/divisions_screen.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';

import '../../pages/home/drawer/properties/properties_screen/properties_screen.dart';

class AddPropertyProvider extends ChangeNotifier {
  AddPropertyDataModel? addPropertyDataModel;
  final propertyController = TextEditingController();
  final addressController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController divisionsController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  LocationModel? locationModel;
  bool isLoading = false;

  XFile? image;
  final ImagePicker picker = ImagePicker();

  List<String>? type;
  List<Category>? categories;

  String? dealTypeValue;
  Category? categoryValue;

  ///set country
  Datum? countryData;
  Datum? divisionData;
  Datum? districtData;
  Datum? areaData;

  AddPropertyProvider(context) {
    getAddPropertyData(context);
    getCountryData(context);
  }

  void setCountry(value, context) {

    countryData = value;
    countryController = TextEditingController(text: countryData?.name);
    getDivisionsData(context);
    NavUtil.replaceScreen(context, const DivisionsScreen());
    notifyListeners();
  }

  void setDivisions(value, context) {
    divisionData = value;
    divisionsController = TextEditingController(text: divisionData?.name);
    getDistrictData(context);
    NavUtil.replaceScreen(context, const DistrictScreen());
    notifyListeners();
  }

  void setDistricts(value, context) {
    districtData = value;
    districtController = TextEditingController(text: districtData?.name);
    getAreaData(context);
    NavUtil.replaceScreen(context, const AreaScreen());
    notifyListeners();
  }

  void setAreas(value, context) {
    areaData = value;
    areaController = TextEditingController(text: areaData?.name);
    Navigator.pop(context);
    notifyListeners();
  }

  void getAddPropertyData(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).getAddPropertiesData();
    if (apiResponse != null) {
      addPropertyDataModel = apiResponse;
      type = addPropertyDataModel?.data?.type;
      categories = addPropertyDataModel?.data?.categories;
    }
    notifyListeners();
  }

  void getCountryData(BuildContext context) async {
    isLoading = true;
    locationModel = null;
    notifyListeners();
    var apiResponse = await RepositoryImpl(context).getCountryData();
    if (apiResponse != null) {
      locationModel = apiResponse;
      isLoading = false;
      notifyListeners();
    }
  }

  void getDivisionsData(BuildContext context) async {
    final data = {'country_id': countryData?.id};
    var apiResponse = await RepositoryImpl(context).getDivisionsData(data);
    if (apiResponse != null) {
      locationModel = apiResponse;
      notifyListeners();
    }
  }

  void getDistrictData(BuildContext context) async {
    final data = {'division_id': divisionData?.id};
    var apiResponse = await RepositoryImpl(context).getDistrictData(data);
    if (apiResponse != null) {
      locationModel = apiResponse;
      notifyListeners();
    }
  }

  void getAreaData(BuildContext context) async {
    final data = {'district_id': districtData?.id};
    var apiResponse = await RepositoryImpl(context).getAresData(data);
    if (apiResponse != null) {
      locationModel = apiResponse;
      notifyListeners();
    }
  }

  void createProperty(context) async {
    if(propertyController.text.isEmpty){
      Fluttertoast.showToast(msg: "Property Name Can not be Empty");
    }else if(dealTypeValue == null || dealTypeValue!.isEmpty){
      Fluttertoast.showToast(msg: "Select your property Type");
    }else if(image?.path == null){
      Fluttertoast.showToast(msg: "Pick Image");
    }else if(addressController.text.isEmpty){
      Fluttertoast.showToast(msg: "Address can not be Empty");
    }else if(countryData?.id == null){
      Fluttertoast.showToast(msg: "Country can not be Empty ");
    }else if(districtData?.id == null){
      Fluttertoast.showToast(msg: "Division Can not be Empty");
    }
    else if(areaData?.id == null){
      Fluttertoast.showToast(msg: "Area Can not be Empty");
    }else if(categoryValue?.id == null){
      Fluttertoast.showToast(msg: "Select your category Type");
    }else {
      final data = {
        "name": propertyController.text,
        "type": dealTypeValue,
        "default_image": File(image?.path ?? ""),
        "address": addressController.text,
        "country_id": countryData?.id,
        "division_id": divisionData?.id,
        "district_id": districtData?.id,
        "upazila_id": areaData?.id,
        "property_category_id": categoryValue?.id,
        "post_code": "", //todo
      };
      var apiResponse = await RepositoryImpl(context).createProperty(data);
      if(apiResponse['result'] == true){
        Fluttertoast.showToast(msg: apiResponse['message']);
        clearDate();
        NavUtil.replaceScreen(context, const PropertiesScreen());
      }
      notifyListeners();
    }
  }

  clearDate(){
    propertyController.text = "";
    dealTypeValue = null;
    image = null;
    addressController.text = "";
    countryData?.id = null;
    divisionData?.id = null;
    districtData?.id = null;
    areaData?.id = null;
    categoryValue?.id = null;
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
                    child: Row(

                      children:  const [

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
                    child: Row(
                      children:  const [
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
