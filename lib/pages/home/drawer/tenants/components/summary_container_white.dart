

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class SummaryContainerWhite extends StatelessWidget {
    final String? title;
  final String? subTitle;
  const SummaryContainerWhite({
    super.key,
    this.subTitle,
    this.title
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.all(18.0.sp),
        child: Row(
          children: [
            CustomText(
              text: title,
              color: AppColors.paraTxt1,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              height: 1.75,
            ),
            const Spacer(),
            CustomText(
              text: subTitle,
              color: AppColors.paraTxt1,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              height: 1.75,
            ),
          ],
        ),
      ),
    );
  }
}