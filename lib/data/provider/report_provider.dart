import 'package:flutter/material.dart';
import 'package:landlord/data/model/report_details_model.dart';
import 'package:landlord/data/model/report_property_list_model.dart';
import 'package:landlord/data/model/report_tenant_list_model.dart';
import 'package:landlord/data/network/repository/repository.dart';
import 'package:landlord/pages/home/drawer/report/report_transaction_details/report_transaction_details.dart';
import 'package:landlord/utils/nav_utail.dart';

class ReportProvider extends ChangeNotifier {

  ReportPropertyModel? reportPropertyModel;
  ReportTenantModel? tenantModel;
  ReportDetailsModel? reportDetailsModel;

  List<ReportProperty>? propertyList;
  List<ReportTenants>? tenantList;
  ReportProperty? selectProperty;
  ReportTenants? selectTenant;


  ReportProvider(context) {
    propertyData(context);
  }

  void propertyData(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).getReportPropertyList();
    if (apiResponse != null) {
      reportPropertyModel = apiResponse;
      propertyList = reportPropertyModel?.data?.properties;
    }
    notifyListeners();
  }

  void tenantsDataByPropertyId(BuildContext context,
      ReportProperty propertyId) async {
    tenantList = null;
    selectTenant = null;
    notifyListeners();
    var apiResponse = await RepositoryImpl(context).getReportTenantList(
        propertyId.id);
    if (apiResponse != null) {
      tenantModel = apiResponse;
      tenantList = tenantModel?.data?.properties;
      notifyListeners();
    }
    notifyListeners();
  }

  void reportDetails(BuildContext context) async {
    final data = {
      "property_id": selectProperty?.id,
      "tenant_id": selectTenant?.id,
    };
    var apiResponse = await RepositoryImpl(context).getReportDetails(data);
    if (apiResponse != null) {
      reportDetailsModel = apiResponse;
      if(reportDetailsModel?.data?.transactions?.isNotEmpty == true){
        NavUtil.navigateScreen(context, ReportTransactionDetails(reportDetails: reportDetailsModel!,));
      }
      notifyListeners();
    }
  }
}