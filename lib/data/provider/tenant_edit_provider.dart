import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  ///date picker
  String? dateOfJoining;
  DateTime? selectedDate;
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



  void tenantEditApi(BuildContext context, int? tenantId,VoidCallback onDone) async {
    RepositoryImpl(context)
        .tenantsEditBasicInfo(model: tenantEditBodyModel, tenantId: tenantId)
        .then((success) {
      if (success) {
        Provider.of<TenantProvider>(context, listen: false).tenantData(context);
        onDone();
        debounce.run(() {
          Navigator.pop(context);
        });
      }
    });
  }
}
