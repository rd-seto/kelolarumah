import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:landlord/data/model/account_category_model.dart';
import 'package:landlord/data/model/agreement_update_model.dart';
import 'package:landlord/data/model/tenant_account_edit_body_model.dart';
import 'package:landlord/data/model/tenant_edit_body_model.dart';
import 'package:landlord/data/model/tenant_model.dart';
import 'package:landlord/data/model/tenants_details_model.dart';
import 'package:landlord/data/network/repository/repository.dart';
import 'package:landlord/data/provider/tenant_provider.dart';
import 'package:provider/provider.dart';

class TenantEditProvider extends ChangeNotifier {
  TenantEditBodyModel tenantEditBodyModel = TenantEditBodyModel();
  TenantModel? tenantModel;
  TenantAccountEditBodyModel tenantAccountEditBodyModel =
      TenantAccountEditBodyModel();
  AgreementUpdateModel agreementEditModel = AgreementUpdateModel();
  AccountCategoryModel? accountCategoryModel;

  TenantEditProvider(
      BuildContext context, TenantsDetailsModel? tenantsDetailsResponse) {
    setControllerData(tenantsDetailsResponse);
    getAccountCategory(context);
  }

  ///date picker
  String? dateOfJoining;
  DateTime? selectedDate;
  String? dateOfMoveIn;
  DateTime? selectedMoveInDate;
  String? dateOfMoveOut;
  DateTime? selectedMoveOutDate;
  String? dateOfReminder;
  DateTime? selectedReminderDate;
  List<String>? type;
  List<AccountCategory>? categories;
  AccountCategory? categoryValue;
  final debounce = Debounce(milliseconds: 500);
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController occupation = TextEditingController();
  final TextEditingController designation = TextEditingController();
  final TextEditingController institution = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController nidNo = TextEditingController();
  final TextEditingController presentAddress = TextEditingController();
  final TextEditingController passportNumber = TextEditingController();
  final TextEditingController nationality = TextEditingController();
  final TextEditingController accountNumber = TextEditingController();
  final TextEditingController accountHolderName = TextEditingController();
  final TextEditingController bankName = TextEditingController();
  final TextEditingController branchName = TextEditingController();
  final TextEditingController expenseAmount = TextEditingController();
  final TextEditingController accountsDetails = TextEditingController();

  /// Select date.....
  Future selectDate(BuildContext context) async {
    showDatePicker(
      context: context,
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(),
      locale: const Locale("en"),
    ).then((date) {
      if (date != null) {
        selectedDate = date;
        dateOfJoining = DateFormat('y-MM-dd').format(selectedDate!);
        tenantEditBodyModel.joinDate = dateOfJoining;
        if (kDebugMode) {
          print(dateOfJoining);
        }
        notifyListeners();
      }
    });
  }

  /// Move In date.....
  Future selectMoveInDate(BuildContext context) async {
    showDatePicker(
      context: context,
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(),
      locale: const Locale("en"),
    ).then((date) {
      if (date != null) {
        selectedMoveInDate = date;
        dateOfMoveIn = DateFormat('y-MM-dd').format(selectedMoveInDate!);
        agreementEditModel.moveIn = dateOfMoveIn;
        if (kDebugMode) {
          print(dateOfMoveIn);
        }
        notifyListeners();
      }
    });
  }

  /// Move out date.....
  Future selectMoveOutDate(BuildContext context) async {
    showDatePicker(
      context: context,
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(),
      locale: const Locale("en"),
    ).then((date) {
      if (date != null) {
        selectedMoveOutDate = date;
        dateOfMoveOut = DateFormat('y-MM-dd').format(selectedMoveOutDate!);
        agreementEditModel.moveOut = dateOfMoveOut;
        if (kDebugMode) {
          print(dateOfMoveIn);
        }
        notifyListeners();
      }
    });
  }

  /// Reminder date.....
  Future selectReminderDate(BuildContext context) async {
    showDatePicker(
      context: context,
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(),
      locale: const Locale("en"),
    ).then((date) {
      if (date != null) {
        selectedReminderDate = date;
        dateOfReminder = DateFormat('y-MM-dd').format(selectedReminderDate!);
        agreementEditModel.reminderDate = dateOfReminder;
        if (kDebugMode) {
          print(dateOfMoveIn);
        }
        notifyListeners();
      }
    });
  }

  setControllerData(TenantsDetailsModel? tenantsDetailsResponse) {
    name.text = tenantsDetailsResponse?.data?.name ?? '';
    email.text = tenantsDetailsResponse?.data?.email ?? "";
    phone.text = tenantsDetailsResponse?.data?.phone ?? "";
    occupation.text = tenantsDetailsResponse?.data?.basicInfo?.occupation ?? "";
    date.text = dateOfJoining.toString();
    institution.text =
        tenantsDetailsResponse?.data?.basicInfo?.institution ?? "";
    nidNo.text = tenantsDetailsResponse?.data?.basicInfo?.nid ?? "";
    passportNumber.text =
        tenantsDetailsResponse?.data?.basicInfo?.passport ?? "";
    // designation.text = tenantsDetailsResponse?.data?. ?? "";
    presentAddress.text =
        tenantsDetailsResponse?.data?.presentAddress?.address ?? "";
    nationality.text = tenantsDetailsResponse?.data?.nationality ?? "";
    email.text = tenantsDetailsResponse?.data?.email ?? "";
  }

  void tenantEditApi(
      BuildContext context, int? tenantId, VoidCallback onDone) async {
    final data = {
      "name": name.text,
      "email": email.text,
      "phone": phone.text,
      "occupation": occupation.text,
      "join_date": dateOfJoining,
      "institution": institution.text,
      "country_id": "1",
      "nid": nidNo.text,
      "passport": passportNumber.text,
      "designation": designation.text,
      "address": presentAddress.text,
      "nationality": nationality.text,
    };
    RepositoryImpl(context)
        .tenantsEditBasicInfo(data, tenantId)
        .then((success) {
      if (success) {
        Fluttertoast.showToast(msg: "Successfully updated");
        Provider.of<TenantProvider>(context, listen: false).tenantData(context);
        onDone();
        debounce.run(() {
          Navigator.pop(context);
        });
        notifyListeners();
      }
    });
  }

  void getAccountCategory(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).getAccountsCategoryData();
    if (apiResponse != null) {
      accountCategoryModel = apiResponse;
      categories = accountCategoryModel?.accountsData;
    }
    notifyListeners();
  }

  void tenantDetailsEditAccount(
      BuildContext context, int tenantId, VoidCallback onDone) async {
    final data = {
      "account_category_id": categoryValue?.id,
      "name": accountHolderName.text,
      "account_no": accountNumber.text,
      "balance": expenseAmount.text,
      "is_default": "0",
      "details": accountsDetails.text,
    };
    RepositoryImpl(context)
        .tenantDetailsEditAccount(data, tenantId)
        .then((success) {
      if (success) {
        Fluttertoast.showToast(msg: "Successfully updated");
        onDone();
        debounce.run(() {
          Navigator.pop(context);
        });
        notifyListeners();
      }
    });
  }

  // void tenantDetailsEditAgreement(
  //     BuildContext context, int tenantId, VoidCallback onDone) async {
  //   final data = {
  //     "name": name.text,
  //     "email": email.text,
  //     "phone": phone.text,
  //     "occupation": occupation.text,
  //     "join_date": dateOfJoining,
  //     "institution": institution,
  //     "country_id": "1",
  //     "nid": nidNo.text,
  //     "passport": passportNumber.text,
  //     "designation": designation.text,
  //     "present_address": presentAddress,
  //     "nationality": nationality.text,
  //   };
  //   RepositoryImpl(context)
  //       .tenantDetailsEditAgreement(data, tenantId)
  //       .then((success) {
  //     if (success) {
  //       Fluttertoast.showToast(msg: "Successfully updated");
  //       onDone();
  //       debounce.run(() {
  //         Navigator.pop(context);
  //       });
  //       notifyListeners();
  //     }
  //   });
  // }
}
