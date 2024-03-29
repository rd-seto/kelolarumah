import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:landlord/components/elevated_button_widget.dart';
import 'package:landlord/components/text_form_field.dart';
import 'package:landlord/data/model/update_profile_model.dart';
import 'package:landlord/data/provider/update_profile_provider.dart';

class ChangePasswordContent extends StatelessWidget {
  const ChangePasswordContent({
    super.key,
    required this.provider,
    required this.updatePassword,
  });

  final UpdateProfileProvider provider;
  final UpdatePassword updatePassword;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          FromField(
            title: "Current_Password",
            controller: provider.oldPasswordController,
            onChange: (currentPassword) {
              updatePassword.oldPassword = currentPassword;
            },
            hintText: "xxxxxxxx",
          ),
          SizedBox(
            height: 20.h,
          ),
          FromField(
            title: "New_Password",
            controller: provider.newPasswordController,
            onChange: (newPassword) {
              updatePassword.password = newPassword;
            },
            hintText: "xxxxxxxxx",
          ),
          SizedBox(
            height: 20.h,
          ),
          FromField(
            title: "Confirm_Password",
            controller: provider.confirmPasswordController,
            onChange: (confirmPassword) {
              updatePassword.confirmPassword = confirmPassword;
            },
            hintText: "xxxxxxxxx",
          ),
          SizedBox(
            height: 20.h,
          ),
          ElevatedButtonWidget(
            text: "Save",
            onPressed: () {
              if (provider.newPasswordController.text ==
                  provider.confirmPasswordController.text) {
                provider.passwordUpdate(context);
              } else {
                Fluttertoast.showToast(
                  msg: 'Password and confirm password not matched',
                );
              }
            },
          )
        ],
      ),
    );
  }
}
