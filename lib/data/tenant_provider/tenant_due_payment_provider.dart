import 'package:flutter/material.dart';
import 'package:landlord/data/model/tenant_deu_payment_model.dart';
import 'package:landlord/data/network/repository/repository.dart';

class DeuPaymentProvider extends ChangeNotifier{
  DuePaymentModel? duePayment;

  Future<DuePaymentModel?> duePaymentData(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).getDuePayment();
    if (apiResponse != null) {
      return duePayment = apiResponse;
    }
    return null;
  }
}