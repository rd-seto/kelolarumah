import 'dart:async';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:landlord/data/model/location_model.dart';
import 'package:landlord/data/model/tenant_body_model.dart';
import 'package:landlord/data/network/repository/repository.dart';
import 'package:landlord/pages/landlord/drawer/tenants/components/Landlord_location/district_screen.dart';
import 'package:landlord/pages/landlord/drawer/tenants/components/Landlord_location/divisions_screen.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../utils/theme/app_colors.dart';
import '../model/tenant_model.dart';

Duration duration = const Duration(seconds: 1);

class TenantProvider extends ChangeNotifier {
  TenantModel? tenantModel;
  List<TenantProperty> properties = [];
  TenantProperty? selectedTenant;
  XFile? image;
  PlatformFile? filePickerResult;
  String? fileName;

  final ImagePicker picker = ImagePicker();
  TenantBodyModel tenantBodyModel = TenantBodyModel();
  String now = DateFormat('yyyy-MM-dd').format(DateTime.now());
  final debounce = Debounce(milliseconds: 500);
  TextEditingController countryController = TextEditingController();
  TextEditingController divisionsController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  Datum? countryData;
  Datum? divisionData;
  Datum? districtData;
  Datum? areaData;
  LocationModel? locationModel;
  bool isLoading = false;

  List<ListElement> listOfTenants = <ListElement>[];
  int page = 1;
  bool isError = false;
  late RefreshController refreshController;

  TenantProvider(BuildContext context) {
    refreshController = RefreshController(initialRefresh: true);
    getCountryData(context);
  }

  loadItems(BuildContext context) {
    refreshController.requestRefresh();
    page = 1;
    tenantData(context);
    notifyListeners();
  }

  loadMoreItems(BuildContext context) {
    page = page + 1;
    tenantData(context);
    notifyListeners();
  }

  void setItems(List<ListElement> item) {
    listOfTenants.clear();
    listOfTenants = item;
    refreshController.refreshCompleted();
    isError = false;
    notifyListeners();
  }

  void setMoreItems(List<ListElement> item) {
    listOfTenants.addAll(item);
    refreshController.loadComplete();
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
    Navigator.pop(context);
    notifyListeners();
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

  void tenantData(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).getTenantData(page);
    if (apiResponse?.status == true) {
      if (apiResponse?.data?.list?.isNotEmpty == true) {
        if (page == 1) {
          setItems(apiResponse!.data!.list!);
          refreshController.loadComplete();
          notifyListeners();
        } else {
          setMoreItems(apiResponse!.data!.list!);
          notifyListeners();
        }
      } else {
        refreshController.loadNoData();
        notifyListeners();
      }
    } else {
      setFetchError();
    }
    notifyListeners();
  }

  setFetchError() {
    if (page == 0) {
      isError = true;
      refreshController.refreshFailed();
      notifyListeners();
    } else {
      refreshController.loadFailed();
      notifyListeners();
    }
  }

  void addTenant(BuildContext context) async {
    final data = {
      "name": nameController.text,
      "email": emailController.text,
      "phone": phoneController.text,
      "country_id": countryData?.id,
      "city_id": divisionData?.id,
      "state_id": districtData?.id,
      "password": passController.text,
      "password_confirmation": passController.text,
      "image": File(image?.path ?? "")
    };
    if (passController.text != confirmPassController.text) {
      Fluttertoast.showToast(
          msg: "Passwords are not same", backgroundColor: AppColors.colorRed);
    } else {
      RepositoryImpl(context).addTenantData(data).then((success) {
        if (success) {
          Fluttertoast.showToast(msg: "Successfully Created");
          tenantData(context);
          clearDate();
          debounce.run(() {
            Navigator.pop(context);
          });
        } else {
          Fluttertoast.showToast(msg: "Something Went Wrong");
        }
      });
    }
  }

  clearDate() {
    nameController.text = "";
    emailController.text = '';
    image = null;
    phoneController.text = "";
    passController.text = "";
    confirmPassController.text = "";
    countryController.text = "";
    districtController.text = "";
    divisionsController.text = "";
    countryData?.id = null;
    divisionData?.id = null;
    districtData?.id = null;
    areaData?.id = null;
    // categoryValue?.id = null;
  }

  void getTenantProperties({required BuildContext context}) async {
    properties = await RepositoryImpl(context).getTenantPropertiesData();
    selectedTenant = properties.first;
    tenantBodyModel.propertyId = '${selectedTenant?.id}';
    notifyListeners();
  }

  onPropertySelect({required TenantProperty property}) {
    selectedTenant = property;
    tenantBodyModel.propertyId = '${selectedTenant?.id}';
    notifyListeners();
  }

  void searchTenantData(BuildContext context, String searchKey) async {
    debounce.run(() async {
      tenantModel =
          await RepositoryImpl(context).searchTenantData(search: searchKey);
      notifyListeners();
    });
  }

  void moveInDate({required BuildContext context}) async {
    tenantBodyModel.moveIn = await selectDate(context);
    notifyListeners();
  }

  void moveOutDate({required BuildContext context}) async {
    tenantBodyModel.moveOut = await selectDate(context);
    notifyListeners();
  }

  Future<String> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    return DateFormat('yyyy-MM-dd').format(picked!);
  }

  void myAlert(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Center(
                child: const Text('Please_choose_media_to_select',
                        textAlign: TextAlign.center)
                    .tr()),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 5,
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
                      children: [
                        const Icon(
                          Icons.image,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        const Text(
                          'From_Gallery',
                          style: TextStyle(color: Colors.white),
                        ).tr(),
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
                      children: [
                        const Icon(
                          Icons.camera,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        const Text(
                          'From_Camera',
                          style: TextStyle(color: Colors.white),
                        ).tr(),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.colorPrimary),
                    onPressed: () {
                      Navigator.pop(context);
                      _pickFile();
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.camera,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        const Text(
                          'Upload_Pdf_File',
                          style: TextStyle(color: Colors.white),
                        ).tr(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    filePickerResult = null;
    var img = await picker.pickImage(source: media);
    image = img;
    tenantBodyModel.document = File(image!.path);
    notifyListeners();
  }

  void _pickFile() async {
    image = null;
    final pickFile = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (pickFile == null) return;

    filePickerResult = pickFile.files.first;
    tenantBodyModel.document = File(filePickerResult!.path ?? '');
    fileName = filePickerResult?.path?.split("/").last;
    //print("...........${filePickerResult?.path}");
    notifyListeners();
  }
}

class Debounce {
  Timer? _timer;
  final int milliseconds;

  Debounce({required this.milliseconds});

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
