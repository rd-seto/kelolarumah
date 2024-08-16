import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:landlord/data/model/registration_model.dart';
import 'package:landlord/data/model/user_model.dart';
import 'package:landlord/data/network/repository/repository.dart';
import 'package:landlord/pages/auth/login/login_screen.dart';
import 'package:landlord/pages/auth/reset_pass/reset_pass.dart';
import 'package:landlord/pages/chat_screen/firebase_service.dart';
import 'package:landlord/pages/landlord/home/bottom_navigation_bar/custom_bottom_nav.dart';
import 'package:landlord/pages/tenants/bottom_nav/tenant_bottom_nav.dart';
import 'package:landlord/utils/dialog/loading_dialog.dart';
import 'package:landlord/utils/global_state.dart';
import 'package:landlord/utils/shared_preferences.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';
import '../../utils/nav_utail.dart';
import '../local/local_auth_provider.dart';

UserModel? userResponse;

class AuthProvider{
  void login({required UserLogin userLogin, required BuildContext context}) async {
    RepositoryImpl(context).login(userLogin).then((user) {
      if (user != null) {
        if(user.isVerified == true){
          SPUtill.setIntValue(SPUtill.keyUserId, user.id);
          ///set token as global variable, so that we can use
          ///anywhere in the application
          ///
          /// store user data to firebase for chat
          FirebaseService().createAndUpdateUserInfo(user.toJson(), '${user.id}');

          GlobalState.instance.set('token', user.token);
          LoadingDialog.showToastNotification("User Login Successfully", color: AppColors.successColor);
          context.read<LocalAutProvider>().updateUser(user);
          if (user.roleId == 4) {
            NavUtil.pushAndRemoveUntil(context, const CustomBottomNavBar());
          } else {
            NavUtil.navigateScreen(context, const TenantBottomNavBar());
          }
        }else{
          Fluttertoast.showToast(msg: "Your email is not verified",backgroundColor: AppColors.colorRed);
        }
      }
    });
  }

  void registration({required UserRegistration userRegistration, required BuildContext context}) async {
    await RepositoryImpl(context).registration(userRegistration).then((user) {
      if (user != null) {
        if(user.isVerified == true){
          SPUtill.setIntValue(SPUtill.keyUserId, user.id);
          context.read<LocalAutProvider>().updateUser(user);
          Fluttertoast.showToast(msg: "Registration successfully done");
          NavUtil.pushAndRemoveUntil(context, const LoginScreen());
        }else {
          Fluttertoast.showToast(msg: "Your email is not verified",backgroundColor: AppColors.colorRed);
          NavUtil.pushAndRemoveUntil(context, const LoginScreen());
        }

      } else{
        Fluttertoast.showToast(msg: "Something went wrong");
      }
    });
  }

  void forgetPass(
      {required String email, required BuildContext context}) async {
    final data = {"email": email};
    await RepositoryImpl(context).forgetPass(data).then((response) {
      if (response['status'] == 200) {
        NavUtil.navigateScreen(context, const ResetPass());
      }
    });
  }

  void resetPass({required String otp, required String email, required String password, required BuildContext context}) async {
    final data = {"otp": otp, "email": email, "password": password};
    await RepositoryImpl(context).resetPass(data).then((response) {
      if (response['status'] == 200) {
        NavUtil.pushAndRemoveUntil(context, const LoginScreen());
      }
    });
  }
}
