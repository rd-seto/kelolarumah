import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:landlord/data/network/repository/repository.dart';

import '../../utils/month_picker_dialog/month_picker_dialog.dart';
import '../model/occupied_list_,model.dart';


class OccupiedProvider extends ChangeNotifier{
  List<OccupiedList>? occupiedListResponse;
  String? occupiedValue;
  DateTime? selectedDate;
  String? currentMonth;
  String? monthYear;

  OccupiedProvider(BuildContext context){
   getOccupiedListData(context);
  }

  /// dropdownMenu for Occupied type .....
  void dropdownMenu(String? newValue) {
    occupiedValue = newValue;
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

  getDate() {
    DateTime currentDate = DateTime.now();
    currentMonth = DateFormat('y-MM', 'en').format(currentDate);
    monthYear = DateFormat('MMMM,y', 'en').format(currentDate);
    notifyListeners();
  }

  /// Select date.....
  Future selectDate(BuildContext context) async {
    showMonthPicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 1, 5),
      lastDate: DateTime(DateTime.now().year + 1, 9),
      initialDate: DateTime.now(),
      locale: const Locale("en"),
    ).then((date) {
      if (date != null) {
        selectedDate = date;
        currentMonth = DateFormat('y-MM', 'en').format(selectedDate!);
        monthYear = DateFormat('MMMM,y', 'en').format(selectedDate!);
        // attendanceReportApi();
        if (kDebugMode) {
          print(DateFormat('y-MM', 'en').format(selectedDate!));
        }
        notifyListeners();
      }
    });
  }
}