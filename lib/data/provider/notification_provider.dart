import 'package:flutter/material.dart';
import 'package:landlord/data/model/notification_model.dart';
import 'package:landlord/data/network/repository/repository.dart';

class NotificationProvider extends ChangeNotifier{

  NotificationModel? notificationResponse;

  NotificationProvider(BuildContext context){
    notificationData(context);
  }

  void notificationData(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).getNotificationData();
    if(apiResponse != null){
      notificationResponse = apiResponse;
    }
    notifyListeners();
  }

}