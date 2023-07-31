import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
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
  TenantsDetailsModel? tenantsDetailsResponse;
  TenantModel? tenantModel;

  TenantAccountEditBodyModel tenantAccountEditBodyModel = TenantAccountEditBodyModel();

  AgreementUpdateModel agreementEditModel = AgreementUpdateModel();

  ///date picker
  String? dateOfJoining;
  DateTime? selectedDate;
  String? dateOfMoveIn;
  DateTime? selectedMoveInDate;
  String? dateOfMoveOut;
  DateTime? selectedMoveOutDate;
  String? dateOfReminder;
  DateTime? selectedReminderDate;
  final debounce = Debounce(milliseconds: 500);

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





  void tenantEditApi(BuildContext context, int? tenantId,VoidCallback onDone) async {
    RepositoryImpl(context)
        .tenantsEditBasicInfo(model: tenantEditBodyModel, tenantId: tenantId)
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



  void tenantDetailsEditAccount (BuildContext context,  int tenantId, VoidCallback onDone) async {

    RepositoryImpl(context).tenantDetailsEditAccount(model: tenantAccountEditBodyModel, tenantId: tenantId).then((success){
      if (success) {
        Fluttertoast.showToast(msg: "Successfully updated");
        onDone();
        debounce.run((){
          Navigator.pop(context);
        });
        notifyListeners();
      }
    });

  }



  void tenantDetailsEditAgreement (BuildContext context,  int tenantId, VoidCallback onDone) async {

    RepositoryImpl(context).tenantDetailsEditAgreement(model: agreementEditModel, tenantId: tenantId).then((success){
      if (success) {
        Fluttertoast.showToast(msg: "Successfully updated");
        onDone();
        debounce.run((){
          Navigator.pop(context);
        });
        notifyListeners();
      }
    });

  }

}
