import 'package:flutter/material.dart';
import 'package:landlord/data/model/property_details_model.dart';
import 'package:landlord/data/network/repository/repository.dart';

class PropertyDetailsProvider extends ChangeNotifier{

  PropertyDetailsModel? propertyDetailsResponse;


  PropertyDetailsProvider(context, propertyId){
    propertyDetails(context, propertyId);
  }

  void propertyDetails(context, propertyId)async{
    var apiResponse = await RepositoryImpl(context).getPropertyDetails(propertyId);
    if(apiResponse != null){
      propertyDetailsResponse = apiResponse;
    }
    notifyListeners();

  }

}