import 'package:flutter/material.dart';
import 'package:landlord/data/model/payment_report.dart';
import 'package:landlord/data/model/tenant_report.dart';
import 'package:landlord/data/network/repository/repository.dart';

class ReportProvider extends ChangeNotifier {
  late List<PaymentReport> payments = [];
  late List<TenantReport> tenants = [];

  ReportProvider(context) {
    getPaymentReportData(context);
    getTenantReportData(context);
  }

  void getPaymentReportData(BuildContext context) async {
    payments = await RepositoryImpl(context).getPaymentReportListData();
    notifyListeners();
  }
  void getTenantReportData(BuildContext context) async {
    tenants = await RepositoryImpl(context).getTenantReportListData();
    notifyListeners();
  }
}
