import 'package:flutter/material.dart';
import 'package:landlord/data/model/user_model.dart';
import 'package:provider/provider.dart';
import '../local/local_auth_provider.dart';
import '../network/repository/repository.dart';

class UpdateProfileProvider extends ChangeNotifier{

  updateProfile({required Map<String,dynamic> json,required BuildContext context}){
    RepositoryImpl(context).updateProfile(json: json).then((user){
      if(user != null){
        debugPrint('Profile data updated');
        Provider.of<LocalAutProvider>(context,listen: false).updateUser(user);
        Navigator.of(context).pop();
      }
    });
  }

  updatePassword({required Map<String,dynamic> json,required BuildContext context}){
    RepositoryImpl(context).updateProfile(json: json).then((user){
      if(user != null){
        debugPrint('Profile password updated');
        Provider.of<LocalAutProvider>(context,listen: false).updateUser(user);
        notifyListeners();
      }
    });
  }

}