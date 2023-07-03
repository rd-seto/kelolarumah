import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class DashboardInfoListCart extends StatelessWidget {
  final Color? containerColor;
  final String? title;
  final String? subTitle;
  const DashboardInfoListCart(
      {super.key, this.containerColor, this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 7.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              textAlign: TextAlign.center,
              text: title,
              color: AppColors.colorWhite,
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
            const Spacer(),
            CustomText(
              textAlign: TextAlign.center,
              text: subTitle,
              color: AppColors.colorWhite,
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}
