import 'dart:async';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:landlord/data/model/tenant_body_model.dart';
import 'package:landlord/data/network/repository/repository.dart';
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

  TenantProvider(BuildContext context) {
    tenantData(context);
  }

  void tenantData(BuildContext context) async {
    tenantModel = await RepositoryImpl(context).getTenantData();
    notifyListeners();
  }

  void addTenant(BuildContext context) async {
    RepositoryImpl(context)
        .addTenantData(model: tenantBodyModel)
        .then((success) {
      if (success) {
        tenantData(context);
        debounce.run(() {
          Navigator.pop(context);
        });
      }
    });
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
                        const Icon(Icons.image),
                        SizedBox(
                          width: 16.w,
                        ),
                        const Text('From_Gallery').tr(),
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
                        const Icon(Icons.camera),
                        SizedBox(
                          width: 16.w,
                        ),
                        const Text('From_Camera').tr(),
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
                        const Icon(Icons.camera),
                        SizedBox(
                          width: 16.w,
                        ),
                        const Text('Upload_Pdf_File').tr(),
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
