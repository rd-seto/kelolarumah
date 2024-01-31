import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class TenantStatisticsCard extends StatelessWidget {
  final String title;
  final String value;
  const TenantStatisticsCard({
    super.key, required this.title, required this.value
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // navigationMethod(index, context);
      },
      child: Container(
        padding: EdgeInsets.all(8.0.r),
        decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(8.r),
            border:
            Border.all(color: AppColors.stockColor)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                'assets/dashboard/add_property_img.png',
                height: 20.h),
            const SizedBox(
              height: 6,
            ),
            CustomText(
              text: value ?? '',
              color: AppColors.paraTxt1,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              height: 1.75,
            ),
            CustomText(
              text: title,
              color: AppColors.paraTxt1,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              height: 1.75,
            ),
          ],
        ),
      ),
    );
  }
}