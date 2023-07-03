import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/utils/theme/app_colors.dart';

// ignore: must_be_immutable
class ElevatedButtonWidget extends StatelessWidget {
  final String? text;
  final Function()? onPressed;

  const ElevatedButtonWidget({Key? key, this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.h,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            backgroundColor: AppColors.mainColorsh1),
        onPressed: onPressed,
        child: Text(
          '$text',
          style: TextStyle(
            letterSpacing: 1.sp,
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ).tr(),
      ),
    );
  }
}
