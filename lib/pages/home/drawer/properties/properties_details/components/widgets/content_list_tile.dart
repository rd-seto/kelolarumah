import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class ContentListTile extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String? image;
  final Color? color;
  const ContentListTile(
      {super.key, this.title, this.subTitle, this.image, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(8.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 18.0.w),
        child: Row(
          children: [
            Image.asset(
              image ?? '',
              height: 21.h,
            ),
            SizedBox(
              width: 8.w,
            ),
            CustomText(
              text: title,
              color: AppColors.black2Sd,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              height: 1.75,
            ),
            const Spacer(),
            CustomText(
              text: subTitle,
              color: AppColors.black2Sd,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              height: 1.75,
            ),
          ],
        ),
      ),
    );
  }
}
