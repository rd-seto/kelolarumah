import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class GreetingsSectionCart extends StatelessWidget {
  final String? name;
  const GreetingsSectionCart({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: name,
          color: AppColors.titleTextColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          height: 1.75,
        ),
        CustomText(
          text: 'Welcome_Back',
          color: AppColors.black2Sd,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          height: 1.75,
        ),
      ],
    );
  }
}
