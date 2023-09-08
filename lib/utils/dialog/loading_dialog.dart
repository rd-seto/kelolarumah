import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class LoadingDialog {
  static showLoadingDialog() {
    EasyLoading.show(
        dismissOnTap: false,
        indicator: SpinKitCircle(
          size: 40.0,
          itemBuilder: (context, index) {
            return Container(
              height: 10,
              width: 10,
              margin: const EdgeInsets.all(1),
              decoration: const BoxDecoration(
                  color: AppColors.colorPrimary, shape: BoxShape.circle),
            );
          },
        ),
        status: "loading");
  }

  static showLoadingView({Color? color}) {
    return Center(
      child: SpinKitCircle(
        color: color ?? AppColors.colorPrimary,
        size: 40.0,
      ),
    );
  }

  static showToastNotification(msg,
      {Color? color, Color? textColor, ToastGravity? toastGravity}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: toastGravity ?? ToastGravity.BOTTOM,
        backgroundColor: color ?? AppColors.colorPrimary,
        textColor: textColor ?? Colors.white,
        fontSize: 16.0);
  }
}
