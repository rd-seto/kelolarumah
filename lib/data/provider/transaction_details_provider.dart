import 'package:flutter/material.dart';
import 'package:landlord/data/network/repository/repository.dart';

import '../model/transaction_details_model.dart';

class TransactionDetailsProvider extends ChangeNotifier{

  TransactionDetailsModel? transactionDetailsResponse;


  TransactionDetailsProvider(context, detailsId){
    transactionDetails(context, detailsId);
  }

  void transactionDetails(context, detailsId)async{
    var apiResponse = await RepositoryImpl(context).getTransactionDetails(detailsId);
    if(apiResponse != null){
      transactionDetailsResponse = apiResponse;
    }
    notifyListeners();

  }

}