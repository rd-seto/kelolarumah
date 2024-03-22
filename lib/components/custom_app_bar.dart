import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  final String? appBarName;
  final Function()? onTap;
  final bool? isBackButton;
  final List<Widget>? actions;
  const CustomAppBar(
      {super.key,
      this.appBarName,
      this.onTap,
      this.isBackButton,
      this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Visibility(
        visible: isBackButton ?? true,
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, top: 8, bottom: 8),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              'assets/dashboard/back_vector.png',
            ),
          ),
        ),
      ),
      leadingWidth: 50,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.colorPrimary,
      elevation: 1,
      title: Text(
        '$appBarName',
        // 'Forget Password',
        style: TextStyle(
            fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.w700),
      ).tr(),
      actions: actions,
    );
  }
}
