import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:landlord/data/network/repository/repository.dart';
import 'package:landlord/pages/landlord/drawer/cash_management/bill_management_dashboard/bill_management_screen.dart';

import '../../utils/month_picker_dialog/month_picker_dialog.dart';
import '../../utils/nav_utail.dart';
import '../model/occupied_list_,model.dart';


class OccupiedProvider extends ChangeNotifier{
  List<OccupiedList>? occupiedListResponse;
  OccupiedList? occupiedValue;
  DateTime? selectedDate;
  String? currentMonth;
  String? monthYear;
  int? billId;

  OccupiedProvider(BuildContext context){
   getOccupiedListData(context);
  }

  /// dropdownMenu for Occupied type .....
  void dropdownMenu(OccupiedList? newValue) {
    occupiedValue = newValue;
    billId = newValue?.id;
    notifyListeners();
  }

  void getOccupiedListData(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).getOccupiedListData();
    if (apiResponse != null) {
      occupiedListResponse = apiResponse.occupiedList;
    }else {
      Fluttertoast.showToast(msg: "Something went wrong");
    }
    notifyListeners();
  }


  /// Select date.....
  Future selectDate(BuildContext context) async {
    showMonthPicker(
      context: context,
      initialDate: DateTime.now(),
      locale: const Locale("en"),
    ).then((date) {
      if (date != null) {
        selectedDate = date;
        currentMonth = DateFormat('MM-y', 'en').format(selectedDate!);
        monthYear = DateFormat('MMMM,y', 'en').format(selectedDate!);

        // attendanceReportApi();
        if (kDebugMode) {
          print(DateFormat('MM-y', 'en').format(selectedDate!));
        }
        notifyListeners();
      }
    });
  }

  void generateBillSubmit(context) async {
    if (currentMonth?.isEmpty == true) {
      Fluttertoast.showToast(msg: "Month can not be Empty");
    } else if (billId == null) {
      Fluttertoast.showToast(msg: "Bill type can not be Empty");
    } else {
      final data = {
        "bill_id": billId,
        "month": currentMonth,
      };
      var apiResponse = await RepositoryImpl(context).generatedApi(data);
      if (apiResponse['status'] == true) {
        Fluttertoast.showToast(msg: apiResponse['message']);
        NavUtil.replaceScreen(context, const BillManagementScreen());
      }else{
        Fluttertoast.showToast(msg: apiResponse['message']);
      }
      notifyListeners();
    }
  }

}